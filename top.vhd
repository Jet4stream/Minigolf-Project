LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY top IS
	port (
		clk: IN std_logic;
		reset_n: IN std_logic;
		sda: INOUT STD_LOGIC;
		scl: INOUT STD_LOGIC;
		data_out: OUT std_logic_vector(7 DOWNTO 0);
		busy_LED: OUT std_logic;
		counter_out: OUT integer range 0 TO 32
	);

End top;

ARCHITECTURE logic OF top IS
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
	SIGNAL ack_error	: std_logic;
	SIGNAL rw			: std_logic;
	SIGNAL data_addr	: std_logic_vector(6 DOWNTO 0):= "1010010";
	SIGNAL data_wr		: std_logic_vector(7 DOWNTO 0);
	SIGNAL data_rd		: std_logic_vector(7 DOWNTO 0);
	SIGNAL init_done 	: std_logic := '0';
	SIGNAL counter		: integer range 0 TO 32 := 0;
	
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
			ena 		<= '0';
			rw 			<= '0';
			data_wr 	<= "00000000";
			counter 	<= 0;
			init_done 	<= '0';
		elsif rising_edge(clk) then
			--Initializing Communication
			--if init_done = '0' then
				--if busy = '0' then
				
				
				case counter is
						when 0 =>
							ena 	<= '1';
							rw 		<= '0';
							data_wr <= "11110000"; --Write 0xF0
							counter <= counter + 1;
						when 1 =>
							ena 	<= '0';
							if busy = '0' then
								counter <= counter + 1;
							end if;
						when 2 =>
							ena		<= '1';
							rw 		<= '0';
							data_wr	<= "01010101"; --Write 0x55
							counter <= counter + 1;
						when 3 =>
							ena 	<= '0';
							if busy = '0' then
								counter <= counter + 1;
							end if;
						when 4 =>
							ena		<= '1';
							rw 		<= '0';
							data_wr <= "11111011"; --Write 0xFB
							counter <= counter + 1;
						when 5 =>
							ena		<= '0';
							if busy = '0' then
								counter <= counter + 1;
							end if;
						when 6 =>
							ena 	<= '1';
							rw 		<= '0';
							data_wr <= "00000000"; --Write 0x00
							counter <= counter + 1;
						when 7 =>
							ena 	<= '0';
							if busy = '0' then 
								init_done <= '1'; --Done initializing
								counter <=  counter + 1;
							end if;
				
					--case counter is
						--when 0 =>
							--ena 	<= '1';
							--rw 		<= '0';
							--data_wr <= "11110000"; --Write 0xF0
							--counter <= counter + 1;
						--when 1 =>
							--ena <= '0';
							--if busy = '0' then
								--ena 	<= '1';
								--rw 		<= '0';
								--data_wr <= "01010101"; --Write 0x55
								--counter <= counter + 1;
							--end if;
						--when 2 =>
							--ena <= '0';
							--if busy = '0' then
								--ena		<= '1';
								--rw 		<= '0';
								--data_wr	<= "11111011"; --Write 0xFB
								--counter <= counter + 1;
							--end if;
						--when 3 =>
							--ena <= '0';
							--if busy = '0' then
								--ena 	<= '1';
								--rw 		<= '0';
								--data_wr <= "00000000"; --Write 0x00
								--counter <= counter + 1;
							--end if;
						
						
						
						
						
						
							--ena 	<= '0';
							--if busy = '0' then
								--counter <= counter + 1;
							--end if;
						--when 2 =>
							--ena 	<= '1';
							--rw 		<= '0';
							--data_wr <= "01010101"; --Write 0x55
							--counter <= counter + 1;
						--when 3 =>
							--ena 	<= '0';
							--if busy = '0' then
								--counter <= counter + 1;
							--end if;
						--when 4 =>
							--ena		<= '1';
							--rw 		<= '0';
							--data_wr	<= "11111011"; --Write 0xFB
							--counter <= counter + 1;
						--when 5 =>
							--ena 	<= '0';
							--if busy = '0' then
								--counter <= counter + 1;
							--end if;
						--when 6 =>
							--ena 	<= '1';
							--rw 		<= '0';
							--data_wr <= "00000000"; --Write 0x00
							--counter <= counter + 1;
						--when 7 =>
							--ena 	<= '0';
							--if busy = '0' then
								--counter <= counter + 1;
							--end if;
						--when 8 =>
							--ena		<= '1';
							--rw 		<= '0';
							--data_wr <= "11110000"; --Write 0xFF
							--counter <= counter + 1;
						--when 9 =>
							--ena		<= '0';
							--if busy = '0' then
								--counter <= counter + 1;
							--end if;
						--when 10 =>
							--ena 	<= '1';
							--rw 		<= '0';
							--data_wr <= "01010101"; --Write 0xFF
							--counter <= counter + 1;
						--when 11 =>
							--ena 	<= '0';
							--if busy = '0' then
								--counter <= counter + 1;
							--end if;
						--when 12 =>
							--ena 	<= '1';
							--rw 		<= '0';
							--data_wr <= "11111011"; --Write 0xFF
							--counter <= counter + 1;
						--when 13 =>
							--ena 	<= '0';
							--if busy = '0' then 
								--counter <=  counter + 1;
							--end if;
						--when 14 =>
							--ena 	<= '1';
							--rw 		<= '0';
							--data_wr <= "00000000"; --Write 0xFF
							--counter <= counter + 1;
						--when 15 =>
							--ena 	<= '0';
							--if busy = '0' then
								--init_done <= '1';
								--counter <= counter + 1;
							--end if;
						when others =>
							counter <= 0;
					end case;
				--end if;
			--else 
				--if busy = '0' then
					--case counter is 
						--when 0 =>
							--ena		<= '1';
							--rw		<= '0';
							--data_wr <= "00000000"; --Write 0x00 to prepare for reading
							--counter <= counter + 1;
						--when 1 =>
							--ena 	<= '0';
							--if busy = '0' then
								--counter <= counter + 1;
							--end if;
						--when 2 =>
							--ena 	<= '1';
							--rw		<= '1';
							--counter <= counter + 1;
						--when 3 =>
							--ena 	<= '0';
							--if busy = '0' then
								--data_out <= data_rd;
								--counter <= 0;
							--end if;
						--when others =>
							--counter <= 0;
					--end case;
				--end if;
			end if;
		--end if;
	end process;
	
	
	counter_out <= counter;
	busy_LED <= busy;
	
end logic;
	