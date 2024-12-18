LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;

ENTITY nunchuck IS
	port (
		clk: IN std_logic;
		reset_n: IN std_logic;
		sda: INOUT STD_LOGIC;
		scl: INOUT STD_LOGIC;
		nunchuck_data 	: OUT std_logic_vector(47 DOWNTO 0)
	);

End nunchuck;

ARCHITECTURE logic OF nunchuck IS
	COMPONENT i2c_master 
	GENERIC(
		input_clk : INTEGER := 12_000_000; --input clock speed from user logic in Hz
		bus_clk   : INTEGER := 400_000);   --speed the i2c bus (scl) will run at in Hz
	PORT(
		clk       : IN     STD_LOGIC;                    --system clock
		reset_n   : IN     STD_LOGIC := '0';                    --active low reset
		ena       : IN     STD_LOGIC;                    --latch in command
		addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
		rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
		data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
		busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
		data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
		ack_error : BUFFER STD_LOGIC;                    --flag if improper acknowledge from slave
		sda       : INOUT  STD_LOGIC;                    --serial data output of i2c bus
		scl       : INOUT  STD_LOGIC);                   --serial clock output of i2c bus
	End component;
	
	SIGNAL ena			: std_logic:= '0';
	SIGNAL busy			: std_logic;
	SIGNAL ack_error		: std_logic;
	SIGNAL rw			: std_logic;
	SIGNAL data_addr	: std_logic_vector(6 DOWNTO 0):= "1010010";
	SIGNAL data_wr		: std_logic_vector(7 DOWNTO 0);
	SIGNAL data_rd		: std_logic_vector(7 DOWNTO 0);
	SIGNAL init_done 	: std_logic := '0';
	SIGNAL counter		: integer range 0 TO 32 := 0;
	SIGNAL read_counter 	: integer range 0 to 7 := 0;
	--SIGNAL nunchuck_data 	: std_logic_vector(47 DOWNTO 0):= (others => '0');
	
	TYPE state_type IS (GARBAGE, GARBAGE_WAIT, IDLE, WRITE_F0, WAIT_BUSY1, WRITE_55, WAIT_BUSY2,
                        WRITE_FB, WAIT_BUSY3, WRITE_00, DONE, IDLE_READ, WRITE_READ_00, WAIT_BUSY4, READ_IN, WAITING );
	SIGNAL state       : state_type := IDLE;
	
Begin
	I2C_inst : i2c_master
		generic map (
			input_clk => 12_000_000,
			bus_clk   => 400_000
		)
		port map (
			clk			=> clk,
			reset_n		=> reset_n,
			ena			=> ena,
			addr		=> data_addr,
			rw			=> rw,
			data_wr		=> data_wr,
			busy		=> busy,
			data_rd		=> data_rd,
			ack_error	=> ack_error,
			sda			=> sda,
			scl			=> scl
		);

	process(clk, reset_n) begin
		 if reset_n = '0' then
            -- Reset all signals and state
            ena       <= '0';
            rw        <= '0';
            data_wr   <= (others => '0');
            init_done <= '0';
            state     <= IDLE;
			read_counter <= 0;
			counter <= 0;
        elsif rising_edge(clk) then
			if init_done = '0' then
				case state is
					when IDLE =>
						ena       	<= '1';
						rw        	<= '0';
						data_wr   	<= "11110000"; -- Write 0xF0
						state 		<= WRITE_F0;

					when WRITE_F0 =>
						--ena       <= '0';
						--data_wr   	<= "01010101"; -- Write 0x55
						counter <= counter + 1;
						if counter = 40 then 
							data_wr   	<= "01010101"; -- Write 0x55
							counter <= counter + 1;
						elsif busy = '0' then
							--data_wr   	<= "01010101"; -- Write 0x55
							state <= WAIT_BUSY1;
							counter <= 0;
						end if;

					when WAIT_BUSY1 =>
						if counter = 0 then
							ena       	<= '1';
							rw        	<= '0';
							counter 	<= counter + 1;
						elsif counter < 20 then
							counter 	<= counter + 1;
						else
							state     	<= WRITE_55;
							counter 	<= 0;
						end if;

					when WRITE_55 =>
						--ena       <= '0';
						data_wr   	<= "11111011"; -- Write 0xFB
						if counter < 20 then
							counter <= counter + 1;
						elsif busy = '0' then
							state <= WAIT_BUSY2;
							counter <= 0;
						end if;

					when WAIT_BUSY2 =>
						if counter = 0 then
							ena       	<= '1';
							rw        	<= '0';
							counter 	<= counter + 1;
						elsif counter < 20 then
							counter 	<= counter + 1;
						else
							state     	<= WRITE_FB;
							counter 	<= 0;
						end if;

					when WRITE_FB =>
						--ena       <= '0';
						data_wr   	<= "00000000"; -- Write 0x00
						if counter < 20 then
							counter <= counter + 1;
						elsif busy = '0' then
							state <= WAIT_BUSY3;
							counter <= 0;
						end if;

					when WAIT_BUSY3 =>
						if counter = 0 then
							ena       	<= '1';
							rw        	<= '0';
							counter 	<= counter + 1;
						elsif counter < 20 then
							counter 	<= counter + 1;
						else
							state     	<= WRITE_00;
							counter 	<= 0;
						end if;

					when WRITE_00 =>
						ena       <= '0';
						if counter < 20 then
							counter <= counter + 1;
						elsif busy = '0' then
							state     <= DONE;
							counter <= 0;
						end if;

					when DONE =>
						-- Stay in DONE state after initialization
						if counter < 20 then
							counter <= counter + 1;
						else
							counter <= 0;
							init_done <= '1'; -- Initialization done
							state <= IDLE_READ;
						end if;

					when others =>
						-- Default fallback to IDLE
						state <= IDLE;
				end case;
			else 
				
				case state is
					when IDLE_READ =>
						-- Start the initialization sequence
						if counter = 0 then
							ena       	<= '1';
							rw        	<= '0';
							data_wr   	<= "00000000"; -- Write 0xF0
							counter 	<= counter + 1;
						elsif counter < 20 then
							counter 	<= counter + 1;
						elsif busy = '1' then 
							state     	<= WRITE_READ_00;
							counter 	<= 0;
						end if;

					when WRITE_READ_00 =>
						ena <= '0';
						if counter < 20 then
							counter <= counter + 1;
						elsif busy = '0' then
							state <= WAIT_BUSY4;
							counter <= 0;
						end if;

					when WAIT_BUSY4 =>
						if counter = 0 then
							ena       	<= '1';
							rw        	<= '1';
							counter 		<= counter + 1;
						elsif counter < 20 then
							counter 		<= counter + 1;
						elsif busy = '1' then
							state     	<= READ_IN;
							counter 		<= 0;
						end if;

					when READ_IN =>
						if counter < 20 then
							counter <= counter + 1;
						elsif busy = '0' then
							if read_counter = 0 then
								nunchuck_data(47 DOWNTO 40) <= data_rd;
								read_counter <= read_counter + 1;
								state <= WAIT_BUSY4;
							elsif read_counter = 1 then
								nunchuck_data(39 DOWNTO 32) <= data_rd;
								read_counter <= read_counter + 1;
								state <= WAIT_BUSY4;
							elsif read_counter = 2 then
								nunchuck_data(31 DOWNTO 24) <= data_rd;
								read_counter <= read_counter + 1;
								state <= WAIT_BUSY4;
							elsif read_counter = 3 then
								nunchuck_data(23 DOWNTO 16) <= data_rd;
								read_counter <= read_counter + 1;
								state <= WAIT_BUSY4;
							else
								nunchuck_data(15 DOWNTO 8) <= data_rd;
								ena       <= '0';
								read_counter <= 0;
								counter <= 0;
								state <= WAITING;
							end if;
						end if;
						
					when WAITING =>
						if busy = '1' then
							state <= DONE;
						end if;
						
					when DONE =>
						-- Stay in DONE state after initialization
						if busy = '0' then
							nunchuck_data(7 DOWNTO 0) <= data_rd;
							state <= IDLE_READ;
						end if;

					when others =>
						-- Default fallback to IDLE
						state <= IDLE_READ;
				end case;
			end if;
		end if;
	end process;
	
	--busy_LED <= init_done;
	--busy_LED <= busy;
    --current_state <= 	"0000" when state = IDLE else
						--"0001" when state = WRITE_F0 else
						--"0010" when state = WAIT_BUSY1 else
						--"0011" when state = WRITE_55 else
						--"0100" when state = WAIT_BUSY2 else
						--"0101" when state = WRITE_FB else
						--"0110" when state = WAIT_BUSY3 else
						--"0111" when state = WRITE_00 else
						--"1000" when state = DONE else
						--"1001" when state = IDLE_READ else
						--"1010" when state = WRITE_READ_00 else
						--"1011" when state = WAIT_BUSY4 else
						--"1100" when state = READ_IN else
						--"1101" when state = WAITING else
						--"1111" when state = GARBAGE_WAIT; -- Default case (state = DONE or others)
	--swing_LED <= "111" when unsigned(nunchuck_data(23 DOWNTO 16)) = 255 else
             --"011" when unsigned(nunchuck_data(23 DOWNTO 16)) > 230 else
             --"001" when unsigned(nunchuck_data(23 DOWNTO 16)) > 200 else
             --"000";
			
	
end logic;
	
