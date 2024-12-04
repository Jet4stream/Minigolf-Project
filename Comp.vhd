library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity comp is
	port (
		X_acc: in std_logic_vector(7 downto 0);
		Y_acc: in std_logic_vector(7 downto 0);
		Z_acc: in std_logic_vector(7 downto 0);
		c_button: in std_logic;
		club_state: in unsigned(1 downto 0);
		direction_state: in unsigned(3 downto 0);
		clk: in std_logic; -- game clock
		location: out unsigned(16 downto 0); 
	);
end;

architecture synth of comp is 
signal first_time: std_logic := '0';

begin  -- computations for each direction
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