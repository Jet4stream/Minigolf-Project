library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity club_select is
	port (
		joystick: in std_logic_vector(7 downto 0);
		c_button: in std_logic;
		clk: in std_logic; -- game clock
		club_graphics: out unsigned(1 downto 0);
		selected: out unsigned(1 downto 0); 
	);
end;

architecture synth of club_select is 
signal hover: unsigned(1 downto 0); -- state machine for just the select menu
-- 00 is a driver, 01 is a iron, 10 is a putter 
signal first_time: std_logic := '0';

begin
	process (clk) begin
		if rising_edge(clk) then
			if (first_time = '0') then -- select state for play
				hover <= "00"; 
				first_time <= '1';
			elsif (c_button '1') then
				selected <= hover;
			elsif (joystick = "11111111") then
				if (hover = "10") then 
					hover <= "00"
					club_grpahics <= "00";
				else 
					hover <= hover + 1;
					club_graphics <= hover + 1;
				end if;
			elsif (joystick = "00000000") then
				if (hover = "00") then 
					hover <= "10"; 
					club_graphics <= "10";
				else 
					hover <= hover - 1;
					club_graphics <= hover - 1;
				end if;
			else 
				hover <= "00";
				club_graphics <= "00";
			end if;
		end if;
	end process;
end;

			
			