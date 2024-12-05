library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pixel_tile is
  port(
    clk         : in  std_logic;             
    valid       : in  std_logic;                
    address   : in  unsigned(9 downto 0);    
    rgb_s     : out unsigned(5 downto 0)      
  );
end pixel_tile;

architecture synth of pixel_tile is
signal address_x: unsigned(4 downto 0);
signal address_y: unsigned(4 downto 0);
signal ball_x: unsigned(4 downto 0):= "00000";
signal ball_y: unsigned(4 downto 0):= "00000";
signal rgb_out: unsigned(5 downto 0);

begin
address_x <= address(4 downto 0);
address_y <= address(9 downto 5);
rgb_s <= rgb_out;

process (clk) begin
	if rising_edge(clk) then
		if valid = '0' then
			rgb_out <= "000000"; -- Default to black
        elsif address_x = 0 or address_y = 0 or address_x = 19 or address_y = 14 then
            rgb_out <= "000100"; -- Coordinate (0, 0)
        elsif address_x = 1 and address_y = 1 then
            rgb_out <= "001100"; -- Coordinate (1, 1)
        elsif address_x = 2 and address_y = 1 then
            rgb_out <= "001100"; -- Coordinate (2, 1)
        elsif address_x = 3 and address_y = 1 then
            rgb_out <= "001100"; -- Coordinate (3, 1)
        elsif address_x = 4 and address_y = 1 then
            rgb_out <= "001100"; -- Coordinate (4, 1)
        elsif address_x = 5 and address_y = 1 then
            rgb_out <= "001100"; -- Coordinate (5, 1)
        elsif address_x = 6 and address_y = 1 then
            rgb_out <= "001100"; -- Coordinate (6, 1)
        elsif address_x = 7 and address_y = 1 then
            rgb_out <= "000111"; -- Coordinate (7, 1)
        elsif address_x = 8 and address_y = 1 then
            rgb_out <= "000111"; -- Coordinate (8, 1)
        elsif address_x = 9 and address_y = 1 then
            rgb_out <= "000111"; -- Coordinate (9, 1)
        elsif address_x = 10 and address_y = 1 then
            rgb_out <= "000111"; -- Coordinate (10, 1)
        elsif address_x = 11 and address_y = 1 then
            rgb_out <= "000100"; -- Coordinate (11, 1)
        elsif address_x = 12 and address_y = 1 then
            rgb_out <= "000100"; -- Coordinate (12, 1)
        elsif address_x = 13 and address_y = 1 then
            rgb_out <= "000100"; -- Coordinate (13, 1)
        elsif address_x = 14 and address_y = 1 then
            rgb_out <= "000100"; -- Coordinate (14, 1)
        elsif address_x = 15 and address_y = 1 then
            rgb_out <= "000100"; -- Coordinate (15, 1)
        elsif address_x = 16 and address_y = 1 then
            rgb_out <= "000100"; -- Coordinate (16, 1)
        elsif address_x = 17 and address_y = 1 then
            rgb_out <= "000100"; -- Coordinate (17, 1)
        elsif address_x = 18 and address_y = 1 then
            rgb_out <= "000100"; -- Coordinate (18, 1)
        elsif address_x = 1 and address_y = 2 then
            rgb_out <= "001100"; -- Coordinate (1, 2)
        elsif address_x = 2 and address_y = 2 then
            rgb_out <= "000000"; -- Coordinate (2, 2)
        elsif address_x = 3 and address_y = 2 then
            rgb_out <= "001100"; -- Coordinate (3, 2)
        elsif address_x = 4 and address_y = 2 then
            rgb_out <= "001100"; -- Coordinate (4, 2)
        elsif address_x = 5 and address_y = 2 then
            rgb_out <= "001100"; -- Coordinate (5, 2)
        elsif address_x = 6 and address_y = 2 then
            rgb_out <= "001100"; -- Coordinate (6, 2)
        elsif address_x = 7 and address_y = 2 then
            rgb_out <= "000111"; -- Coordinate (7, 2)
        elsif address_x = 8 and address_y = 2 then
            rgb_out <= "000111"; -- Coordinate (8, 2)
        elsif address_x = 9 and address_y = 2 then
            rgb_out <= "000111"; -- Coordinate (9, 2)
        elsif address_x = 10 and address_y = 2 then
            rgb_out <= "000111"; -- Coordinate (10, 2)
        elsif address_x = 11 and address_y = 2 then
            rgb_out <= "000111"; -- Coordinate (11, 2)
        elsif address_x = 12 and address_y = 2 then
            rgb_out <= "000100"; -- Coordinate (12, 2)
        elsif address_x = 13 and address_y = 2 then
            rgb_out <= "000100"; -- Coordinate (13, 2)
        elsif address_x = 14 and address_y = 2 then
            rgb_out <= "000100"; -- Coordinate (14, 2)
        elsif address_x = 15 and address_y = 2 then
            rgb_out <= "000100"; -- Coordinate (15, 2)
        elsif address_x = 16 and address_y = 2 then
            rgb_out <= "000100"; -- Coordinate (16, 2)
        elsif address_x = 17 and address_y = 2 then
            rgb_out <= "000100"; -- Coordinate (17, 2)
        elsif address_x = 18 and address_y = 2 then
            rgb_out <= "000100"; -- Coordinate (18, 2)
        elsif address_x = 1 and address_y = 3 then
            rgb_out <= "001100"; -- Coordinate (1, 3)
        elsif address_x = 2 and address_y = 3 then
            rgb_out <= "001100"; -- Coordinate (2, 3)
        elsif address_x = 3 and address_y = 3 then
            rgb_out <= "001100"; -- Coordinate (3, 3)
        elsif address_x = 4 and address_y = 3 then
            rgb_out <= "001100"; -- Coordinate (4, 3)
        elsif address_x = 5 and address_y = 3 then
            rgb_out <= "001100"; -- Coordinate (5, 3)
        elsif address_x = 6 and address_y = 3 then
            rgb_out <= "001100"; -- Coordinate (6, 3)
        elsif address_x = 7 and address_y = 3 then
            rgb_out <= "001100"; -- Coordinate (7, 3)
        elsif address_x = 8 and address_y = 3 then
            rgb_out <= "000111"; -- Coordinate (8, 3)
        elsif address_x = 9 and address_y = 3 then
            rgb_out <= "000111"; -- Coordinate (9, 3)
        elsif address_x = 10 and address_y = 3 then
            rgb_out <= "000111"; -- Coordinate (10, 3)
        elsif address_x = 11 and address_y = 3 then
            rgb_out <= "000100"; -- Coordinate (11, 3)
        elsif address_x = 12 and address_y = 3 then
            rgb_out <= "000100"; -- Coordinate (12, 3)
        elsif address_x = 13 and address_y = 3 then
            rgb_out <= "000100"; -- Coordinate (13, 3)
        elsif address_x = 14 and address_y = 3 then
            rgb_out <= "000100"; -- Coordinate (14, 3)
        elsif address_x = 15 and address_y = 3 then
            rgb_out <= "000100"; -- Coordinate (15, 3)
        elsif address_x = 16 and address_y = 3 then
            rgb_out <= "000100"; -- Coordinate (16, 3)
        elsif address_x = 17 and address_y = 3 then
            rgb_out <= "000100"; -- Coordinate (17, 3)
        elsif address_x = 18 and address_y = 3 then
            rgb_out <= "000100"; -- Coordinate (18, 3)
        elsif address_x = 1 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (1, 4)
        elsif address_x = 2 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (2, 4)
        elsif address_x = 3 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (3, 4)
        elsif address_x = 4 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (4, 4)
        elsif address_x = 5 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (5, 4)
        elsif address_x = 6 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (6, 4)
        elsif address_x = 7 and address_y = 4 then
            rgb_out <= "000111"; -- Coordinate (7, 4)
        elsif address_x = 8 and address_y = 4 then
            rgb_out <= "000111"; -- Coordinate (8, 4)
        elsif address_x = 9 and address_y = 4 then
            rgb_out <= "000111"; -- Coordinate (9, 4)
        elsif address_x = 10 and address_y = 4 then
            rgb_out <= "000111"; -- Coordinate (10, 4)
        elsif address_x = 11 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (11, 4)
        elsif address_x = 12 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (12, 4)
        elsif address_x = 13 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (13, 4)
        elsif address_x = 14 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (14, 4)
        elsif address_x = 15 and address_y = 4 then
            rgb_out <= "001100"; -- Coordinate (15, 4)
        elsif address_x = 16 and address_y = 4 then
            rgb_out <= "000100"; -- Coordinate (16, 4)
        elsif address_x = 17 and address_y = 4 then
            rgb_out <= "000100"; -- Coordinate (17, 4)
        elsif address_x = 18 and address_y = 4 then
            rgb_out <= "000100"; -- Coordinate (18, 4)
        elsif address_x = 1 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (1, 5)
        elsif address_x = 2 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (2, 5)
        elsif address_x = 3 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (3, 5)
        elsif address_x = 4 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (4, 5)
        elsif address_x = 5 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (5, 5)
        elsif address_x = 6 and address_y = 5 then
            rgb_out <= "000111"; -- Coordinate (6, 5)
        elsif address_x = 7 and address_y = 5 then
            rgb_out <= "000111"; -- Coordinate (7, 5)
        elsif address_x = 8 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (8, 5)
        elsif address_x = 9 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (9, 5)
        elsif address_x = 10 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (10, 5)
        elsif address_x = 11 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (11, 5)
        elsif address_x = 12 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (12, 5)
        elsif address_x = 13 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (13, 5)
        elsif address_x = 14 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (14, 5)
        elsif address_x = 15 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (15, 5)
        elsif address_x = 16 and address_y = 5 then
            rgb_out <= "001100"; -- Coordinate (16, 5)
        elsif address_x = 17 and address_y = 5 then
            rgb_out <= "000100"; -- Coordinate (17, 5)
        elsif address_x = 18 and address_y = 5 then
            rgb_out <= "000100"; -- Coordinate (18, 5)
        elsif address_x = 1 and address_y = 6 then
            rgb_out <= "000111"; -- Coordinate (1, 6)
        elsif address_x = 2 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (2, 6)
        elsif address_x = 3 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (3, 6)
        elsif address_x = 4 and address_y = 6 then
            rgb_out <= "000111"; -- Coordinate (4, 6)
        elsif address_x = 5 and address_y = 6 then
            rgb_out <= "000111"; -- Coordinate (5, 6)
        elsif address_x = 6 and address_y = 6 then
            rgb_out <= "000111"; -- Coordinate (6, 6)
        elsif address_x = 7 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (7, 6)
        elsif address_x = 8 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (8, 6)
        elsif address_x = 9 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (9, 6)
        elsif address_x = 10 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (10, 6)
        elsif address_x = 11 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (11, 6)
        elsif address_x = 12 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (12, 6)
        elsif address_x = 13 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (13, 6)
        elsif address_x = 14 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (14, 6)
        elsif address_x = 15 and address_y = 6 then
            rgb_out <= "111000"; -- Coordinate (15, 6)
        elsif address_x = 16 and address_y = 6 then
            rgb_out <= "001100"; -- Coordinate (16, 6)
        elsif address_x = 17 and address_y = 6 then
            rgb_out <= "000100"; -- Coordinate (17, 6)
        elsif address_x = 18 and address_y = 6 then
            rgb_out <= "000100"; -- Coordinate (18, 6)
        elsif address_x = 1 and address_y = 7 then
            rgb_out <= "000111"; -- Coordinate (1, 7)
        elsif address_x = 2 and address_y = 7 then
            rgb_out <= "000111"; -- Coordinate (2, 7)
        elsif address_x = 3 and address_y = 7 then
            rgb_out <= "000111"; -- Coordinate (3, 7)
        elsif address_x = 4 and address_y = 7 then
            rgb_out <= "000111"; -- Coordinate (4, 7)
        elsif address_x = 5 and address_y = 7 then
            rgb_out <= "000111"; -- Coordinate (5, 7)
        elsif address_x = 6 and address_y = 7 then
            rgb_out <= "001100"; -- Coordinate (6, 7)
        elsif address_x = 7 and address_y = 7 then
            rgb_out <= "001100"; -- Coordinate (7, 7)
        elsif address_x = 8 and address_y = 7 then
            rgb_out <= "001100"; -- Coordinate (8, 7)
        elsif address_x = 9 and address_y = 7 then
            rgb_out <= "001100"; -- Coordinate (9, 7)
        elsif address_x = 10 and address_y = 7 then
            rgb_out <= "001100"; -- Coordinate (10, 7)
        elsif address_x = 11 and address_y = 7 then
            rgb_out <= "001100"; -- Coordinate (11, 7)
        elsif address_x = 12 and address_y = 7 then
            rgb_out <= "001100"; -- Coordinate (12, 7)
        elsif address_x = 13 and address_y = 7 then
            rgb_out <= "001100"; -- Coordinate (13, 7)
        elsif address_x = 14 and address_y = 7 then
            rgb_out <= "111000"; -- Coordinate (14, 7)
        elsif address_x = 15 and address_y = 7 then
            rgb_out <= "111000"; -- Coordinate (15, 7)
        elsif address_x = 16 and address_y = 7 then
            rgb_out <= "001100"; -- Coordinate (16, 7)
        elsif address_x = 17 and address_y = 7 then
            rgb_out <= "000100"; -- Coordinate (17, 7)
        elsif address_x = 18 and address_y = 7 then
            rgb_out <= "000100"; -- Coordinate (18, 7)
        elsif address_x = 1 and address_y = 8 then
            rgb_out <= "000111"; -- Coordinate (1, 8)
        elsif address_x = 2 and address_y = 8 then
            rgb_out <= "000111"; -- Coordinate (2, 8)
        elsif address_x = 3 and address_y = 8 then
            rgb_out <= "000111"; -- Coordinate (3, 8)
        elsif address_x = 4 and address_y = 8 then
            rgb_out <= "000111"; -- Coordinate (4, 8)
        elsif address_x = 5 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (5, 8)
        elsif address_x = 6 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (6, 8)
        elsif address_x = 7 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (7, 8)
        elsif address_x = 8 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (8, 8)
        elsif address_x = 9 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (9, 8)
        elsif address_x = 10 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (10, 8)
        elsif address_x = 11 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (11, 8)
        elsif address_x = 12 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (12, 8)
        elsif address_x = 13 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (13, 8)
        elsif address_x = 14 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (14, 8)
        elsif address_x = 15 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (15, 8)
        elsif address_x = 16 and address_y = 8 then
            rgb_out <= "001100"; -- Coordinate (16, 8)
        elsif address_x = 17 and address_y = 8 then
            rgb_out <= "000100"; -- Coordinate (17, 8)
        elsif address_x = 18 and address_y = 8 then
            rgb_out <= "000100"; -- Coordinate (18, 8)
        elsif address_x = 1 and address_y = 9 then
            rgb_out <= "000111"; -- Coordinate (1, 9)
        elsif address_x = 2 and address_y = 9 then
            rgb_out <= "000111"; -- Coordinate (2, 9)
        elsif address_x = 3 and address_y = 9 then
            rgb_out <= "000111"; -- Coordinate (3, 9)
        elsif address_x = 4 and address_y = 9 then
            rgb_out <= "000111"; -- Coordinate (4, 9)
        elsif address_x = 5 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (5, 9)
        elsif address_x = 6 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (6, 9)
        elsif address_x = 7 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (7, 9)
        elsif address_x = 8 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (8, 9)
        elsif address_x = 9 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (9, 9)
        elsif address_x = 10 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (10, 9)
        elsif address_x = 11 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (11, 9)
        elsif address_x = 12 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (12, 9)
        elsif address_x = 13 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (13, 9)
        elsif address_x = 14 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (14, 9)
        elsif address_x = 15 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (15, 9)
        elsif address_x = 16 and address_y = 9 then
            rgb_out <= "001100"; -- Coordinate (16, 9)
        elsif address_x = 17 and address_y = 9 then
            rgb_out <= "000100"; -- Coordinate (17, 9)
        elsif address_x = 18 and address_y = 9 then
            rgb_out <= "000100"; -- Coordinate (18, 9)
        elsif address_x = 1 and address_y = 10 then
            rgb_out <= "000100"; -- Coordinate (1, 10)
        elsif address_x = 2 and address_y = 10 then
            rgb_out <= "000100"; -- Coordinate (2, 10)
        elsif address_x = 3 and address_y = 10 then
            rgb_out <= "000100"; -- Coordinate (3, 10)
        elsif address_x = 4 and address_y = 10 then
            rgb_out <= "000100"; -- Coordinate (4, 10)
        elsif address_x = 5 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (5, 10)
        elsif address_x = 6 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (6, 10)
        elsif address_x = 7 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (7, 10)
        elsif address_x = 8 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (8, 10)
        elsif address_x = 9 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (9, 10)
        elsif address_x = 10 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (10, 10)
        elsif address_x = 11 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (11, 10)
        elsif address_x = 12 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (12, 10)
        elsif address_x = 13 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (13, 10)
        elsif address_x = 14 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (14, 10)
        elsif address_x = 15 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (15, 10)
        elsif address_x = 16 and address_y = 10 then
            rgb_out <= "001100"; -- Coordinate (16, 10)
        elsif address_x = 17 and address_y = 10 then
            rgb_out <= "000100"; -- Coordinate (17, 10)
        elsif address_x = 18 and address_y = 10 then
            rgb_out <= "000100"; -- Coordinate (18, 10)
        elsif address_x = 1 and address_y = 11 then
            rgb_out <= "000100"; -- Coordinate (1, 11)
        elsif address_x = 2 and address_y = 11 then
            rgb_out <= "000100"; -- Coordinate (2, 11)
        elsif address_x = 3 and address_y = 11 then
            rgb_out <= "000100"; -- Coordinate (3, 11)
        elsif address_x = 4 and address_y = 11 then
            rgb_out <= "000100"; -- Coordinate (4, 11)
        elsif address_x = 5 and address_y = 11 then
            rgb_out <= "000100"; -- Coordinate (5, 11)
        elsif address_x = 6 and address_y = 11 then
            rgb_out <= "001100"; -- Coordinate (6, 11)
        elsif address_x = 7 and address_y = 11 then
            rgb_out <= "111000"; -- Coordinate (7, 11)
        elsif address_x = 8 and address_y = 11 then
            rgb_out <= "111000"; -- Coordinate (8, 11)
        elsif address_x = 9 and address_y = 11 then
            rgb_out <= "111000"; -- Coordinate (9, 11)
        elsif address_x = 10 and address_y = 11 then
            rgb_out <= "001100"; -- Coordinate (10, 11)
        elsif address_x = 11 and address_y = 11 then
            rgb_out <= "001100"; -- Coordinate (11, 11)
        elsif address_x = 12 and address_y = 11 then
            rgb_out <= "001100"; -- Coordinate (12, 11)
        elsif address_x = 13 and address_y = 11 then
            rgb_out <= "001100"; -- Coordinate (13, 11)
        elsif address_x = 14 and address_y = 11 then
            rgb_out <= "001100"; -- Coordinate (14, 11)
        elsif address_x = 15 and address_y = 11 then
            rgb_out <= "001100"; -- Coordinate (15, 11)
        elsif address_x = 16 and address_y = 11 then
            rgb_out <= "001100"; -- Coordinate (16, 11)
        elsif address_x = 17 and address_y = 11 then
            rgb_out <= "000100"; -- Coordinate (17, 11)
        elsif address_x = 18 and address_y = 11 then
            rgb_out <= "000100"; -- Coordinate (18, 11)
        elsif address_x = 1 and address_y = 12 then
            rgb_out <= "000100"; -- Coordinate (1, 12)
        elsif address_x = 2 and address_y = 12 then
            rgb_out <= "000100"; -- Coordinate (2, 12)
        elsif address_x = 3 and address_y = 12 then
            rgb_out <= "000100"; -- Coordinate (3, 12)
        elsif address_x = 4 and address_y = 12 then
            rgb_out <= "000100"; -- Coordinate (4, 12)
        elsif address_x = 5 and address_y = 12 then
            rgb_out <= "000100"; -- Coordinate (5, 12)
        elsif address_x = 6 and address_y = 12 then
            rgb_out <= "000100"; -- Coordinate (6, 12)
        elsif address_x = 7 and address_y = 12 then
            rgb_out <= "001100"; -- Coordinate (7, 12)
        elsif address_x = 8 and address_y = 12 then
            rgb_out <= "001100"; -- Coordinate (8, 12)
        elsif address_x = 9 and address_y = 12 then
            rgb_out <= "001100"; -- Coordinate (9, 12)
        elsif address_x = 10 and address_y = 12 then
            rgb_out <= "001100"; -- Coordinate (10, 12)
        elsif address_x = 11 and address_y = 12 then
            rgb_out <= "001100"; -- Coordinate (11, 12)
        elsif address_x = 12 and address_y = 12 then
            rgb_out <= "001100"; -- Coordinate (12, 12)
        elsif address_x = 13 and address_y = 12 then
            rgb_out <= "001100"; -- Coordinate (13, 12)
        elsif address_x = 14 and address_y = 12 then
            rgb_out <= "001100"; -- Coordinate (14, 12)
        elsif address_x = 15 and address_y = 12 then
            rgb_out <= "001100"; -- Coordinate (15, 12)
        elsif address_x = 16 and address_y = 12 then
            rgb_out <= "000100"; -- Coordinate (16, 12)
        elsif address_x = 17 and address_y = 12 then
            rgb_out <= "000100"; -- Coordinate (17, 12)
        elsif address_x = 18 and address_y = 12 then
            rgb_out <= "000100"; -- Coordinate (18, 12)
        elsif address_x = 1 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (1, 13)
        elsif address_x = 2 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (2, 13)
        elsif address_x = 3 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (3, 13)
        elsif address_x = 4 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (4, 13)
        elsif address_x = 5 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (5, 13)
        elsif address_x = 6 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (6, 13)
        elsif address_x = 7 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (7, 13)
        elsif address_x = 8 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (8, 13)
        elsif address_x = 9 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (9, 13)
        elsif address_x = 10 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (10, 13)
        elsif address_x = 11 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (11, 13)
        elsif address_x = 12 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (12, 13)
        elsif address_x = 13 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (13, 13)
        elsif address_x = 14 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (14, 13)
        elsif address_x = 15 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (15, 13)
        elsif address_x = 16 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (16, 13)
        elsif address_x = 17 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (17, 13)
        elsif address_x = 18 and address_y = 13 then
            rgb_out <= "000100"; -- Coordinate (18, 13)
        else
            rgb_out <= "000000"; -- Default to black
        end if;
	end if;
	

end process;
end synth;