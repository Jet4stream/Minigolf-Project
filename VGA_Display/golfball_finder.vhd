library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity golfball_finder is
  port(
    clk         : in  std_logic;             
    valid       : in  std_logic;                
    address   : in  unsigned(9 downto 0);    
    rgb_b     : out unsigned(5 downto 0)      
  );
end golfball_finder;

architecture synth of golfball_finder is
signal address_x: unsigned(4 downto 0);
signal address_y: unsigned(4 downto 0);
signal ball_x: unsigned(4 downto 0):= "00000";
signal ball_y: unsigned(4 downto 0):= "00000";
signal rgb_out: unsigned(5 downto 0);
signal first_time: std_logic:= '0';

begin
address_x <= address(4 downto 0);
address_y <= address(9 downto 5);
rgb_b <= rgb_out;

process (clk) begin
	if rising_edge(clk) then
		if valid = '0' then
			rgb_out <= "000000"; -- Default to black	
		elsif first_time = '0' then
			ball_x <= "01111"; 
			ball_y <= "01011";
			first_time <= '1';
		elsif (address_x = ball_x and address_y = ball_y) then
			rgb_out <= "111111";
		else 
			rgb_out <= "000000";
		end if;
	end if;
	

end process;
end synth;