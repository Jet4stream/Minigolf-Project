LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;


ENTITY game_logic IS
	port (
		clk: IN std_logic;
		reset_n: IN std_logic;
		sda: INOUT STD_LOGIC;
		scl: INOUT STD_LOGIC;
		--ball_x: INOUT unsigned(9 downto 0);
		--ball_y: INOUT unsigned(9 downto 0);
		swing_speed	: OUT std_logic_vector(1 DOWNTO 0);
		--out_speed: OUT unsigned(4 Downto 0);
		current_d_state: OUT std_logic_vector(1 Downto 0);
		current_c_state: OUT std_logic_vector(1 Downto 0)
	);

End game_logic;

ARCHITECTURE logic OF game_logic IS
	
	COMPONENT nunchuck
		PORT(
			clk				: IN std_logic;
			reset_n		: IN std_logic;
			sda				: INOUT STD_LOGIC;
			scl				: INOUT STD_LOGIC;
			nunchuck_data 	: OUT std_logic_vector(47 DOWNTO 0)
		);
	END COMPONENT;
	
	-- nunchuck_data(47 Downto 40)	: Joystick X
	-- nunchuck_data(39 Downto 32)	: Joystick Y
	-- nunchuck_data(31 Downto 24)	: X-axis Accelerometer
	-- nunchuck_data(23 Downto 16)	: Y-axis Accelerometer
	-- nunchuck_data(15 Downto 8) 	: Z-axis Accelerometer
	-- not nunchuck_data(1)			: C Button
	-- not nunchuck_data(0)			: Z Button
	
	
	Signal nunchuck_data	: std_logic_vector(47 DOWNTO 0);
	Signal speed			: unsigned(4 Downto 0) := "00000";
	-- Delete after game clock implementation
	Signal counter 			: integer range 0 TO 201_000 := 0;
	Signal input_counter	   	: integer range 0 TO 6_000_000 := 0;
	Signal slowdown_counter 	: integer range 0 To 7 := 0;
	
	--TYPE speed IS (HIGHEST, MEDIUM, LOWEST);
	--SIGNAL speed_state 		: speed
	
	TYPE direction IS (LEFT_DIRECTION, RIGHT_DIRECTION, UP_DIRECTION, DOWN_DIRECTION);
	SIGNAL direction_state	: direction := UP_DIRECTION;
	
	TYPE club IS (DRIVER, IRON, PUTTER);
	Signal club_state		: club := DRIVER;	
	
Begin
	nunchuck_inst : nunchuck
		port map (
			clk				=> clk,
			reset_n			=> reset_n,
			sda				=> sda,
			scl				=> scl,
			nunchuck_data 	=> nunchuck_data
		);
		
	process(clk, reset_n) begin
		if reset_n = '0' then
			speed <= "0000";
			
			
		elsif rising_edge(clk) then
			if input_counter = 0 then
				if unsigned(nunchuck_data(47 DOWNTO 40)) = 255 then
					case direction_state is 
						when LEFT_DIRECTION =>
							direction_state <= UP_DIRECTION;
							input_counter <= 6_000_000;
						when UP_DIRECTION => 
							direction_state <= RIGHT_DIRECTION;
							input_counter <= 6_000_000;
						when RIGHT_DIRECTION =>
							direction_state <= DOWN_DIRECTION;
							input_counter <= 6_000_000;
						when DOWN_DIRECTION =>
							direction_state <= LEFT_DIRECTION;
							input_counter <= 6_000_000;
					end case;
				elsif unsigned(nunchuck_data(47 DOWNTO 40)) < 50 then
					case direction_state is 
						when LEFT_DIRECTION =>
							direction_state <= DOWN_DIRECTION;
							input_counter <= 6_000_000;
						when UP_DIRECTION => 
							direction_state <= LEFT_DIRECTION;
							input_counter <= 6_000_000;
						when RIGHT_DIRECTION =>
							direction_state <= UP_DIRECTION;
							input_counter <= 6_000_000;
						when DOWN_DIRECTION =>
							direction_state <= RIGHT_DIRECTION;
							input_counter <= 6_000_000;
					end case;
				elsif unsigned(nunchuck_data(39 DOWNTO 32)) = 255 then
					case club_state is 
						when DRIVER =>
							club_state <= PUTTER;
							input_counter <= 6_000_000;
						when IRON =>
							club_state <= DRIVER;
							input_counter <= 6_000_000;
						when PUTTER =>
							club_state <= IRON;
							input_counter <= 6_000_000;
					end case;
				elsif unsigned(nunchuck_data(39 DOWNTO 32)) < 50 then
					case club_state is 
						when DRIVER =>
							club_state <= IRON;
							input_counter <= 6_000_000;
						when IRON =>
							club_state <= PUTTER;
							input_counter <= 6_000_000;
						when PUTTER =>
							club_state <= DRIVER;
							input_counter <= 6_000_000;
					end case;
				end if;
				
			else 
				input_counter <= input_counter - 1;
			end if;
		
			if counter < 200_000 then
				counter <= counter + 1;
			else 
				counter <= 0;
				if speed = 0 and nunchuck_data(1) = '0' then
					if unsigned(nunchuck_data(23 DOWNTO 16)) = 255 then
						case club_state is 
							when DRIVER =>
								speed <= "11000";
							when IRON =>
								speed <= "10101";
							when PUTTER =>
								speed <= "01110";
						end case;
					elsif unsigned(nunchuck_data(23 DOWNTO 16)) > 230 then
						case club_state is 
							when DRIVER =>
								speed <= "10110";
							when IRON =>
								speed <= "10010";
							when PUTTER =>
								speed <= "01011";
						end case;
					elsif unsigned(nunchuck_data(23 DOWNTO 16)) > 200 then
						case club_state is 
							when DRIVER =>
								speed <= "10011";
							when IRON =>
								speed <= "01100";
							when PUTTER =>
								speed <= "01000";
						end case;
					end if;
				elsif speed /= 0 then
					if slowdown_counter < 6 then
						slowdown_counter <= slowdown_counter + 1;
					else
						--case direction_state is 
							--when LEFT_DIRECTION =>
								--ball_x <= ball_x - speed;
							--when UP_DIRECTION => 
								--ball_y <= ball_y + speed;
							--when RIGHT_DIRECTION =>
								--ball_x <= ball_x + speed;
							--when DOWN_DIRECTION =>
								--ball_y <= ball_y - speed;
						--end case;
						speed <= speed - 1;
						slowdown_counter <= 0;
					end if;
				end if;
			end if;
		
		end if;
		
	end process;
	
	
	--out_speed <= speed;
	swing_speed <= "11" when unsigned(nunchuck_data(23 DOWNTO 16)) = 255 else
             "10" when unsigned(nunchuck_data(23 DOWNTO 16)) > 230 else
             "01" when unsigned(nunchuck_data(23 DOWNTO 16)) > 200 else
             "00";
	current_d_state <= "00" when direction_state = LEFT_DIRECTION else
						"01" when direction_state = UP_DIRECTION else
						"10" when direction_state = RIGHT_DIRECTION else
						"11" when direction_state = DOWN_DIRECTION;
	current_c_state <= "00" when club_state = DRIVER else
						"01" when club_state = IRON else
						"10" when club_state = PUTTER;


end logic;
