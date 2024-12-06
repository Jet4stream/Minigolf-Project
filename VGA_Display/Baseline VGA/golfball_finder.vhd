library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity golfball_finder is
  port(
    clk         : in  std_logic;             
    valid       : in  std_logic;                
	address_x   : in  unsigned(9 downto 0);  
	address_y   : in  unsigned(9 downto 0);    	
    rgb_b     : out unsigned(5 downto 0)      
  );
end golfball_finder;

architecture synth of golfball_finder is
signal ball_x: unsigned(5 downto 0):= "000000";
signal ball_y: unsigned(5 downto 0):= "000000";
signal rgb_out: unsigned(5 downto 0);
signal first_time: std_logic:= '0';
signal ball_address_x: unsigned(5 downto 0);
signal ball_address_y: unsigned(5 downto 0);

begin
rgb_b <= rgb_out;
ball_address_x <= address_x(9 downto 4);
ball_address_y <= address_y(9 downto 4);

process (clk) begin
	if rising_edge(clk) then
		--if address_x = 640 and address_y = 480 then
			if valid = '0' then
				rgb_out <= "000000"; -- Default to black	
			elsif first_time = '0' then
				ball_x <= "011111"; 
				ball_y <= "010111";
				first_time <= '1';
			elsif (ball_address_x = ball_x and ball_address_y = ball_y) then
				rgb_out <= "111111";
			else 
				rgb_out <= "000000";
			end if;
		--end if;
	end if;
	
end process;
end synth;