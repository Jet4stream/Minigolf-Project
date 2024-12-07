library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--screen 640 x 480

entity club_select is
	port (
		selected: in std_logic_vector(1 downto 0);
		hit: in std_logic; -- has the ball been hit?
		clk: in std_logic; -- game clock
		variety: in std_logic_vector(1 downto 0);
		-- 00 is high, 10 is medium, 10 is high
		--selected: out unsigned(1 downto 0); 
		new_speed: out unsigned(4 downto 0); 
		--location: out 
		
	);
end;
	
architecture synth of club_select is 
signal hover: unsigned(1 downto 0); -- state machine for just the select menu
-- 00 is a driver, 01 is a iron, 10 is a putter 
signal first_time: std_logic := '0';
signal selected: unsigned(1 downto 0);
signal slow_down_clock: unsigned(20 downto 0) := 21b"0"; --first number changes how quickly the balls slow down
signal set_speed: std_logic := '1'

begin
	process (clk) begin
		if rising_edge(clk) then
			if (hit = '1') then
				if (set_speed = '1')
					set_speed <= 0;
					if (selected = "00") then -- driver
						if (variety = "00") -- high
							speed <= "11000";
						elsif (variety = "01") -- medium
							speed <= "10110";
						elsif (variety = "10") -- low
							speed <= "10011";
						end if;
					elsif (selected = "01") then -- iron
						if (variety = "00") -- high
							speed <= "10101";
						elsif (variety = "01") -- medium
							speed <= "10010";
						elsif (variety = "10") -- low
							speed <= "01100";
						end if;
					elsif (selected = "10") then -- putter
						if (variety = "00") -- high
							speed <= "01110";
						elsif (variety = "01") -- medium
							speed <= "01011";
						elsif (variety = "10") -- low
							speed <= "01000";
						end if;	
					end if;
				end if;
				slow_down_clock <= slow_down_clock + 1;
				if (slow_down_clock = "111101000010010000000") then -- 2 million = 6 updates per second
					slow_down_clock <= 21b"0";
					speed <= speed - 1;
					-- should also update location here where change in location is the speed
				end if;
			end if;
		end if;
	end process;
end;

			
			
