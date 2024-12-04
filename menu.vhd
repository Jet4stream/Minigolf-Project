library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity menu_select is
	port (
		joystick: in std_logic_vector(7 downto 0);
		c_button: in std_logic;
		clk: in std_logic; -- game clock
		menu_graphics: out std_logic;
		selected: out std_logic; 
	);
end;

architecture synth of menu_select is 
signal hover: std_logic; -- state machine for just the select menu
signal first_time: std_logic := '0';

-- 0 is play and 1 is quit
begin
	process (clk) begin
		if rising_edge(clk) then
			if first_time = '0' then
				hover <= '0';
				first_time <= '1';
			elsif (c_button = '1') then 
				selected <= hover;
			elsif (joystick = "11111111") then 
				hover <= not hover;
				if (hover = '1') then 
					menu_graphics <= '1'; -- quit
				else 
					menu_graphics <= '0'; -- play
			elsif (joystick = "00000000") then
				hover <= not hover;
				if (hover = '1') then 
					menu_graphics <= '1'; -- quit
				else
					menu_graphics <= '0'; -- play
			else -- hover state for play 
				hover <= '0'; -- hover play
				menu_graphics <= '0'; -- display play
			end if;
		end if;
	end process;
end;

			
			