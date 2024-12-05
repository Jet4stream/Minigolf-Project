library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity game_clock is 
	port(
		rows: in unsigned(9 downto 0);
		columns: in unsigned(9 downto 0);
		game_clock: out std_logic
	); 
end;

architecture synth of game_clock is

begin 

game_clock <= '1' when (rows = 480 and columns = 640) else '0';

end;