library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity golfball_finder is
  port(
    clk         : in  std_logic;             
    valid       : in  std_logic;                
	address_x   : in  unsigned(9 downto 0);  
	address_y   : in  unsigned(9 downto 0);
	ball_x : in unsigned(9 downto 0);
	ball_y : in unsigned(9 downto 0);
    rgb_b     : out unsigned(5 downto 0)      
  );
end golfball_finder;

architecture synth of golfball_finder is
signal rgb_out: unsigned(5 downto 0);
signal vga_address_x: unsigned(5 downto 0);
signal vga_address_y: unsigned(5 downto 0);
signal ball_x_address: unsigned(5 downto 0);
signal ball_y_address: unsigned(5 downto 0);

begin
rgb_b <= rgb_out;
vga_address_x <= address_x(9 downto 4);
vga_address_y <= address_y(9 downto 4);
ball_x_address <= ball_x(9 downto 4);
ball_y_address <= ball_y(9 downto 4);

process (clk) begin
	if rising_edge(clk) then
		if valid = '0' then
			rgb_out <= "000000"; -- Default to black	
		elsif (vga_address_x = ball_x_address and vga_address_y = ball_y_address) then
			rgb_out <= "111111";
		else 
			rgb_out <= "000000";
			end if;
	end if;
	
end process;
end synth;