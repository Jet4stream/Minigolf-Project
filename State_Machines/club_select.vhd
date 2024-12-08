library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--screen 640 x 480

entity club_select is
	port (
		current_c_state: in std_logic_vector(1 downto 0);
		clk: in std_logic; -- game clock
		
		swing_speed	: in std_logic_vector(1 DOWNTO 0); -- high/med/low
		-- 00 is high, 10 is medium, 10 is high
		current_d_state: in std_logic_vector(1 Downto 0); -- direction
		current_c_state: in std_logic_vector(1 Downto 0) -- club
		
		ball_x: INOUT unsigned(9 downto 0);
		ball_y: INOUT unsigned(9 downto 0);	
	);
end;
	
architecture synth of club_select is 
-- 00 is a driver, 01 is a iron, 10 is a putter 
signal slow_down_clock: unsigned(20 downto 0) := 21b"0"; -- changes how quickly the balls slow down
signal speed: unsigned(4 downto 0) := "00000"; 

begin
	process (clk) begin
		if rising_edge(clk) then
			if (speed /= 0) then
				if (current_c_state = "00") then -- driver
					if (swing_speed = "11") -- high
						speed <= "11000";
					elsif (swing_speed = "10") -- medium
						speed <= "10110";
					elsif (swing_speed = "01") -- low
						speed <= "10011";
					end if;
				elsif (current_c_state = "01") then -- iron
					if (swing_speed = "11") -- high
						speed <= "10101";
					elsif (swing_speed = "10") -- medium
						speed <= "10010";
					elsif (swing_speed = "01") -- low
						speed <= "01100";
					end if;
				elsif (current_c_state = "10") then -- putter
					if (swing_speed = "11") -- high
						speed <= "01110";
					elsif (swing_speed = "10") -- medium
						speed <= "01011";
					elsif (swing_speed = "01") -- low
						speed <= "01000";
					end if;	
				end if;
			end if;
			slow_down_clock <= slow_down_clock + 1;
			if (slow_down_clock = "111101000010010000000") then -- 2 million = 6 updates per second
				slow_down_clock <= 21b"0";
				speed <= speed - 1;
				if (current_d_state = "00") -- left
					ball_x <= ball_x - speed;
				elsif (current_d_state = "01")	-- up
					ball_y <= ball_y - speed;
				elsif (current_d_state = "10") -- right
					ball_x <= ball_x + speed;
				elsif (current_d_state = "11") -- down
					ball_y <= ball_y + speed;
				end if;    
			end if;
		end if;
	end process;
end;

			
			
