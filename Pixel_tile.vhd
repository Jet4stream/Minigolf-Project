library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pixel_tile is
  port(
    clk         : in  std_logic;             
    valid       : in  std_logic;                
    address   : in  unsigned(9 downto 0);    
    rgb_out     : out unsigned(5 downto 0)      
  );
end pixel_tile;

architecture synth of pixel_tile is
begin

process (clk) begin
	if rising_edge(clk) then
		if valid = '0' then
			rgb_out <= "000000";
		elsif address = 0 then
			rgb_out <= "100000";
		elsif address < 32 then
			rgb_out <= "001000";
		elsif address < 63 then
			rgb_out <= "000100";
		elsif address < 95 then
			rgb_out <= "001010";
		elsif address = 639 then
			rgb_out <= "101010";
		else 
			rgb_out <= "111111";
		end if;
	end if;
end process;

end synth;