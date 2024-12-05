library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tile_finder is
  port(
    clk         : in  std_logic;             
    valid       : in  std_logic;                
    address_x   : in  unsigned(9 downto 0);    
    address_y   : in  unsigned(9 downto 0);     
    tile     : out unsigned(9 downto 0)      
  );
end tile_finder;

architecture synth of tile_finder is
  
begin

process (clk) begin
	if rising_edge(clk) then
			
		tile(9 downto 5) <= address_y(9 downto 5);
		tile(4 downto 0) <= address_x(9 downto 5);
	end if;
end process;

end synth;