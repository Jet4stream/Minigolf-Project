library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity game_clock is 
	port(
		clk: in std_logic;
		rows: in unsigned(9 downto 0);
		columns: in unsigned(9 downto 0);
		game_clock: out std_logic
	); 
end;

architecture synth of game_clock is

begin 


process (clk) begin
	if rising_edge(clk) then
		if rows = 480 and columns = 640 then
			game_clock <= '1';
		else 
			game_clock <= '0';
		end if;
	end if;
end process;

end;