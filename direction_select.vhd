library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity direction_select is
	port (
		joystick: in std_logic_vector(7 downto 0);
		c_button: in std_logic;
		clk: in std_logic; -- game clock
		club_graphics: out unsigned(3 downto 0);
		selected: out unsigned(3 downto 0); 
	);
end;

architecture synth of direction_select is 
signal hover: unsigned(3 downto 0); -- state machine for just the select menu
-- 00 is a driver, 01 is a iron, 10 is a putter 
signal first_time: std_logic := '0';

begin
	process (clk) begin
		if rising_edge(clk) then
			if (first_time = '0') then -- select state for play
				hover <= "0000"; 
				first_time <= '1';
			elsif (c_button '1') then
				selected <= hover;
			elsif (joystick = "11111111") then
				hover <= hover + 1;
				graphics <= hover + 1;
			elsif (joystick = "00000000") then
				if (hover = "0000") then 
					hover <= "1111"; 
					club_graphics <= "1111";
				else 
					hover <= hover - 1;
					club_graphics <= hover - 1;
				end if;
			else 
				hover <= "0000";
				club_graphics <= "0000";
			end if;
		end if;
	end process;
end;

			
			