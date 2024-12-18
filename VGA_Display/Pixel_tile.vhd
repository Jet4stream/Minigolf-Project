library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pixel_tile is
  port(
    clk         : in  std_logic;             
    valid       : in  std_logic;                
    address   : in  unsigned(11 downto 0);
	row: in unsigned(9 downto 0);
	column: in unsigned(9 downto 0);
	game_state: in std_logic_vector(1 downto 0);
	club_state: in std_logic_vector(1 downto 0);
    rgb_s     : out unsigned(5 downto 0)      
  );
end pixel_tile;

architecture synth of pixel_tile is
signal address_x: unsigned(5 downto 0);
signal address_y: unsigned(5 downto 0);
signal ball_x: unsigned(5 downto 0):= "000000";
signal ball_y: unsigned(5 downto 0):= "000000";
signal rgb_out: unsigned(5 downto 0);
signal counter: unsigned(24 downto 0);

begin
address_x <= address(5 downto 0);
address_y <= address(11 downto 6);
rgb_s <= rgb_out;

process (clk) begin
	if rising_edge(clk) then
		if game_state = "00" then 
			-- start screen
		elsif game_state = "01" then -- play screen
			if valid = '0' then
				rgb_out <= "000000"; -- Default to black
			elsif address_x = 0 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (0, 0)
			elsif address_x = 1 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (1, 0)
			elsif address_x = 2 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (2, 0)
			elsif address_x = 3 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (3, 0)
			elsif address_x = 4 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (4, 0)
			elsif address_x = 5 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (5, 0)
			elsif address_x = 6 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (6, 0)
			elsif address_x = 7 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (7, 0)
			elsif address_x = 8 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (8, 0)
			elsif address_x = 9 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (9, 0)
			elsif address_x = 10 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (10, 0)
			elsif address_x = 11 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (11, 0)
			elsif address_x = 12 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (12, 0)
			elsif address_x = 13 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (13, 0)
			elsif address_x = 14 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (14, 0)
			elsif address_x = 15 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (15, 0)
			elsif address_x = 16 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (16, 0)
			elsif address_x = 17 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (17, 0)
			elsif address_x = 18 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (18, 0)
			elsif address_x = 19 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (19, 0)
			elsif address_x = 20 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (20, 0)
			elsif address_x = 21 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (21, 0)
			elsif address_x = 22 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (22, 0)
			elsif address_x = 23 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (23, 0)
			elsif address_x = 24 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (24, 0)
			elsif address_x = 25 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (25, 0)
			elsif address_x = 26 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (26, 0)
			elsif address_x = 27 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (27, 0)
			elsif address_x = 28 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (28, 0)
			elsif address_x = 29 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (29, 0)
			elsif address_x = 30 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (30, 0)
			elsif address_x = 31 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (31, 0)
			elsif address_x = 32 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (32, 0)
			elsif address_x = 33 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (33, 0)
			elsif address_x = 34 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (34, 0)
			elsif address_x = 35 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (35, 0)
			elsif address_x = 36 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (36, 0)
			elsif address_x = 37 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (37, 0)
			elsif address_x = 38 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (38, 0)
			elsif address_x = 39 and address_y = 0 then
				rgb_out <= "001000"; -- Coordinate (39, 0)
			elsif address_x = 0 and address_y = 1 then
				rgb_out <= "001000"; -- Coordinate (0, 1)
			elsif address_x = 1 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (1, 1)
			elsif address_x = 2 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (2, 1)
			elsif address_x = 3 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (3, 1)
			elsif address_x = 4 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (4, 1)
			elsif address_x = 5 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (5, 1)
			elsif address_x = 6 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (6, 1)
			elsif address_x = 7 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (7, 1)
			elsif address_x = 8 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (8, 1)
			elsif address_x = 9 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (9, 1)
			elsif address_x = 10 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (10, 1)
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
			elsif address_x = 19 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (19, 1)
			elsif address_x = 20 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (20, 1)
			elsif address_x = 21 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (21, 1)
			elsif address_x = 22 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (22, 1)
			elsif address_x = 23 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (23, 1)
			elsif address_x = 24 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (24, 1)
			elsif address_x = 25 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (25, 1)
			elsif address_x = 26 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (26, 1)
			elsif address_x = 27 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (27, 1)
			elsif address_x = 28 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (28, 1)
			elsif address_x = 29 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (29, 1)
			elsif address_x = 30 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (30, 1)
			elsif address_x = 31 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (31, 1)
			elsif address_x = 32 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (32, 1)
			elsif address_x = 33 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (33, 1)
			elsif address_x = 34 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (34, 1)
			elsif address_x = 35 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (35, 1)
			elsif address_x = 36 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (36, 1)
			elsif address_x = 37 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (37, 1)
			elsif address_x = 38 and address_y = 1 then
				rgb_out <= "000100"; -- Coordinate (38, 1)
			elsif address_x = 39 and address_y = 1 then
				rgb_out <= "001000"; -- Coordinate (39, 1)
			elsif address_x = 0 and address_y = 2 then
				rgb_out <= "001000"; -- Coordinate (0, 2)
			elsif address_x = 1 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (1, 2)
			elsif address_x = 2 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (2, 2)
			elsif address_x = 3 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (3, 2)
			elsif address_x = 4 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (4, 2)
			elsif address_x = 5 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (5, 2)
			elsif address_x = 6 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (6, 2)
			elsif address_x = 7 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (7, 2)
			elsif address_x = 8 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (8, 2)
			elsif address_x = 9 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (9, 2)
			elsif address_x = 10 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (10, 2)
			elsif address_x = 11 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (11, 2)
			elsif address_x = 12 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (12, 2)
			elsif address_x = 13 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (13, 2)
			elsif address_x = 14 and address_y = 2 then
				rgb_out <= "001100"; -- Coordinate (14, 2)
			elsif address_x = 15 and address_y = 2 then
				rgb_out <= "000111"; -- Coordinate (15, 2)
			elsif address_x = 16 and address_y = 2 then
				rgb_out <= "000111"; -- Coordinate (16, 2)
			elsif address_x = 17 and address_y = 2 then
				rgb_out <= "000111"; -- Coordinate (17, 2)
			elsif address_x = 18 and address_y = 2 then
				rgb_out <= "000111"; -- Coordinate (18, 2)
			elsif address_x = 19 and address_y = 2 then
				rgb_out <= "000111"; -- Coordinate (19, 2)
			elsif address_x = 20 and address_y = 2 then
				rgb_out <= "000111"; -- Coordinate (20, 2)
			elsif address_x = 21 and address_y = 2 then
				rgb_out <= "000111"; -- Coordinate (21, 2)
			elsif address_x = 22 and address_y = 2 then
				rgb_out <= "000111"; -- Coordinate (22, 2)
			elsif address_x = 23 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (23, 2)
			elsif address_x = 24 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (24, 2)
			elsif address_x = 25 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (25, 2)
			elsif address_x = 26 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (26, 2)
			elsif address_x = 27 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (27, 2)
			elsif address_x = 28 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (28, 2)
			elsif address_x = 29 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (29, 2)
			elsif address_x = 30 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (30, 2)
			elsif address_x = 31 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (31, 2)
			elsif address_x = 32 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (32, 2)
			elsif address_x = 33 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (33, 2)
			elsif address_x = 34 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (34, 2)
			elsif address_x = 35 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (35, 2)
			elsif address_x = 36 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (36, 2)
			elsif address_x = 37 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (37, 2)
			elsif address_x = 38 and address_y = 2 then
				rgb_out <= "000100"; -- Coordinate (38, 2)
			elsif address_x = 39 and address_y = 2 then
				rgb_out <= "001000"; -- Coordinate (39, 2)
			elsif address_x = 0 and address_y = 3 then
				rgb_out <= "001000"; -- Coordinate (0, 3)
			elsif address_x = 1 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (1, 3)
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
				rgb_out <= "001100"; -- Coordinate (8, 3)
			elsif address_x = 9 and address_y = 3 then
				rgb_out <= "001100"; -- Coordinate (9, 3)
			elsif address_x = 10 and address_y = 3 then
				rgb_out <= "001100"; -- Coordinate (10, 3)
			elsif address_x = 11 and address_y = 3 then
				rgb_out <= "001100"; -- Coordinate (11, 3)
			elsif address_x = 12 and address_y = 3 then
				rgb_out <= "001100"; -- Coordinate (12, 3)
			elsif address_x = 13 and address_y = 3 then
				rgb_out <= "001100"; -- Coordinate (13, 3)
			elsif address_x = 14 and address_y = 3 then
				rgb_out <= "001100"; -- Coordinate (14, 3)
			elsif address_x = 15 and address_y = 3 then
				rgb_out <= "000111"; -- Coordinate (15, 3)
			elsif address_x = 16 and address_y = 3 then
				rgb_out <= "000111"; -- Coordinate (16, 3)
			elsif address_x = 17 and address_y = 3 then
				rgb_out <= "000111"; -- Coordinate (17, 3)
			elsif address_x = 18 and address_y = 3 then
				rgb_out <= "000111"; -- Coordinate (18, 3)
			elsif address_x = 19 and address_y = 3 then
				rgb_out <= "000111"; -- Coordinate (19, 3)
			elsif address_x = 20 and address_y = 3 then
				rgb_out <= "000111"; -- Coordinate (20, 3)
			elsif address_x = 21 and address_y = 3 then
				rgb_out <= "000111"; -- Coordinate (21, 3)
			elsif address_x = 22 and address_y = 3 then
				rgb_out <= "000111"; -- Coordinate (22, 3)
			elsif address_x = 23 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (23, 3)
			elsif address_x = 24 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (24, 3)
			elsif address_x = 25 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (25, 3)
			elsif address_x = 26 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (26, 3)
			elsif address_x = 27 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (27, 3)
			elsif address_x = 28 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (28, 3)
			elsif address_x = 29 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (29, 3)
			elsif address_x = 30 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (30, 3)
			elsif address_x = 31 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (31, 3)
			elsif address_x = 32 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (32, 3)
			elsif address_x = 33 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (33, 3)
			elsif address_x = 34 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (34, 3)
			elsif address_x = 35 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (35, 3)
			elsif address_x = 36 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (36, 3)
			elsif address_x = 37 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (37, 3)
			elsif address_x = 38 and address_y = 3 then
				rgb_out <= "000100"; -- Coordinate (38, 3)
			elsif address_x = 39 and address_y = 3 then
				rgb_out <= "001000"; -- Coordinate (39, 3)
			elsif address_x = 0 and address_y = 4 then
				rgb_out <= "001000"; -- Coordinate (0, 4)
			elsif address_x = 1 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (1, 4)
			elsif address_x = 2 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (2, 4)
			elsif address_x = 3 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (3, 4)
			elsif address_x = 4 and address_y = 4 then
				rgb_out <= "000000"; -- Coordinate (4, 4)
			elsif address_x = 5 and address_y = 4 then
				rgb_out <= "000000"; -- Coordinate (5, 4)
			elsif address_x = 6 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (6, 4)
			elsif address_x = 7 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (7, 4)
			elsif address_x = 8 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (8, 4)
			elsif address_x = 9 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (9, 4)
			elsif address_x = 10 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (10, 4)
			elsif address_x = 11 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (11, 4)
			elsif address_x = 12 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (12, 4)
			elsif address_x = 13 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (13, 4)
			elsif address_x = 14 and address_y = 4 then
				rgb_out <= "001100"; -- Coordinate (14, 4)
			elsif address_x = 15 and address_y = 4 then
				rgb_out <= "000111"; -- Coordinate (15, 4)
			elsif address_x = 16 and address_y = 4 then
				rgb_out <= "000111"; -- Coordinate (16, 4)
			elsif address_x = 17 and address_y = 4 then
				rgb_out <= "000111"; -- Coordinate (17, 4)
			elsif address_x = 18 and address_y = 4 then
				rgb_out <= "000111"; -- Coordinate (18, 4)
			elsif address_x = 19 and address_y = 4 then
				rgb_out <= "000111"; -- Coordinate (19, 4)
			elsif address_x = 20 and address_y = 4 then
				rgb_out <= "000111"; -- Coordinate (20, 4)
			elsif address_x = 21 and address_y = 4 then
				rgb_out <= "000111"; -- Coordinate (21, 4)
			elsif address_x = 22 and address_y = 4 then
				rgb_out <= "000111"; -- Coordinate (22, 4)
			elsif address_x = 23 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (23, 4)
			elsif address_x = 24 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (24, 4)
			elsif address_x = 25 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (25, 4)
			elsif address_x = 26 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (26, 4)
			elsif address_x = 27 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (27, 4)
			elsif address_x = 28 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (28, 4)
			elsif address_x = 29 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (29, 4)
			elsif address_x = 30 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (30, 4)
			elsif address_x = 31 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (31, 4)
			elsif address_x = 32 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (32, 4)
			elsif address_x = 33 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (33, 4)
			elsif address_x = 34 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (34, 4)
			elsif address_x = 35 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (35, 4)
			elsif address_x = 36 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (36, 4)
			elsif address_x = 37 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (37, 4)
			elsif address_x = 38 and address_y = 4 then
				rgb_out <= "000100"; -- Coordinate (38, 4)
			elsif address_x = 39 and address_y = 4 then
				rgb_out <= "001000"; -- Coordinate (39, 4)
			elsif address_x = 0 and address_y = 5 then
				rgb_out <= "001000"; -- Coordinate (0, 5)
			elsif address_x = 1 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (1, 5)
			elsif address_x = 2 and address_y = 5 then
				rgb_out <= "001100"; -- Coordinate (2, 5)
			elsif address_x = 3 and address_y = 5 then
				rgb_out <= "001100"; -- Coordinate (3, 5)
			elsif address_x = 4 and address_y = 5 then
				rgb_out <= "000000"; -- Coordinate (4, 5)
			elsif address_x = 5 and address_y = 5 then
				rgb_out <= "000000"; -- Coordinate (5, 5)
			elsif address_x = 6 and address_y = 5 then
				rgb_out <= "001100"; -- Coordinate (6, 5)
			elsif address_x = 7 and address_y = 5 then
				rgb_out <= "001100"; -- Coordinate (7, 5)
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
				rgb_out <= "000111"; -- Coordinate (15, 5)
			elsif address_x = 16 and address_y = 5 then
				rgb_out <= "000111"; -- Coordinate (16, 5)
			elsif address_x = 17 and address_y = 5 then
				rgb_out <= "000111"; -- Coordinate (17, 5)
			elsif address_x = 18 and address_y = 5 then
				rgb_out <= "000111"; -- Coordinate (18, 5)
			elsif address_x = 19 and address_y = 5 then
				rgb_out <= "000111"; -- Coordinate (19, 5)
			elsif address_x = 20 and address_y = 5 then
				rgb_out <= "000111"; -- Coordinate (20, 5)
			elsif address_x = 21 and address_y = 5 then
				rgb_out <= "000111"; -- Coordinate (21, 5)
			elsif address_x = 22 and address_y = 5 then
				rgb_out <= "000111"; -- Coordinate (22, 5)
			elsif address_x = 23 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (23, 5)
			elsif address_x = 24 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (24, 5)
			elsif address_x = 25 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (25, 5)
			elsif address_x = 26 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (26, 5)
			elsif address_x = 27 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (27, 5)
			elsif address_x = 28 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (28, 5)
			elsif address_x = 29 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (29, 5)
			elsif address_x = 30 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (30, 5)
			elsif address_x = 31 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (31, 5)
			elsif address_x = 32 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (32, 5)
			elsif address_x = 33 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (33, 5)
			elsif address_x = 34 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (34, 5)
			elsif address_x = 35 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (35, 5)
			elsif address_x = 36 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (36, 5)
			elsif address_x = 37 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (37, 5)
			elsif address_x = 38 and address_y = 5 then
				rgb_out <= "000100"; -- Coordinate (38, 5)
			elsif address_x = 39 and address_y = 5 then
				rgb_out <= "001000"; -- Coordinate (39, 5)
			elsif address_x = 0 and address_y = 6 then
				rgb_out <= "001000"; -- Coordinate (0, 6)
			elsif address_x = 1 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (1, 6)
			elsif address_x = 2 and address_y = 6 then
				rgb_out <= "001100"; -- Coordinate (2, 6)
			elsif address_x = 3 and address_y = 6 then
				rgb_out <= "001100"; -- Coordinate (3, 6)
			elsif address_x = 4 and address_y = 6 then
				rgb_out <= "001100"; -- Coordinate (4, 6)
			elsif address_x = 5 and address_y = 6 then
				rgb_out <= "001100"; -- Coordinate (5, 6)
			elsif address_x = 6 and address_y = 6 then
				rgb_out <= "001100"; -- Coordinate (6, 6)
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
				rgb_out <= "001100"; -- Coordinate (15, 6)
			elsif address_x = 16 and address_y = 6 then
				rgb_out <= "001100"; -- Coordinate (16, 6)
			elsif address_x = 17 and address_y = 6 then
				rgb_out <= "000111"; -- Coordinate (17, 6)
			elsif address_x = 18 and address_y = 6 then
				rgb_out <= "000111"; -- Coordinate (18, 6)
			elsif address_x = 19 and address_y = 6 then
				rgb_out <= "000111"; -- Coordinate (19, 6)
			elsif address_x = 20 and address_y = 6 then
				rgb_out <= "000111"; -- Coordinate (20, 6)
			elsif address_x = 21 and address_y = 6 then
				rgb_out <= "000111"; -- Coordinate (21, 6)
			elsif address_x = 22 and address_y = 6 then
				rgb_out <= "000111"; -- Coordinate (22, 6)
			elsif address_x = 23 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (23, 6)
			elsif address_x = 24 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (24, 6)
			elsif address_x = 25 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (25, 6)
			elsif address_x = 26 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (26, 6)
			elsif address_x = 27 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (27, 6)
			elsif address_x = 28 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (28, 6)
			elsif address_x = 29 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (29, 6)
			elsif address_x = 30 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (30, 6)
			elsif address_x = 31 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (31, 6)
			elsif address_x = 32 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (32, 6)
			elsif address_x = 33 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (33, 6)
			elsif address_x = 34 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (34, 6)
			elsif address_x = 35 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (35, 6)
			elsif address_x = 36 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (36, 6)
			elsif address_x = 37 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (37, 6)
			elsif address_x = 38 and address_y = 6 then
				rgb_out <= "000100"; -- Coordinate (38, 6)
			elsif address_x = 39 and address_y = 6 then
				rgb_out <= "001000"; -- Coordinate (39, 6)
			elsif address_x = 0 and address_y = 7 then
				rgb_out <= "001000"; -- Coordinate (0, 7)
			elsif address_x = 1 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (1, 7)
			elsif address_x = 2 and address_y = 7 then
				rgb_out <= "001100"; -- Coordinate (2, 7)
			elsif address_x = 3 and address_y = 7 then
				rgb_out <= "001100"; -- Coordinate (3, 7)
			elsif address_x = 4 and address_y = 7 then
				rgb_out <= "001100"; -- Coordinate (4, 7)
			elsif address_x = 5 and address_y = 7 then
				rgb_out <= "001100"; -- Coordinate (5, 7)
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
				rgb_out <= "001100"; -- Coordinate (14, 7)
			elsif address_x = 15 and address_y = 7 then
				rgb_out <= "001100"; -- Coordinate (15, 7)
			elsif address_x = 16 and address_y = 7 then
				rgb_out <= "001100"; -- Coordinate (16, 7)
			elsif address_x = 17 and address_y = 7 then
				rgb_out <= "000111"; -- Coordinate (17, 7)
			elsif address_x = 18 and address_y = 7 then
				rgb_out <= "000111"; -- Coordinate (18, 7)
			elsif address_x = 19 and address_y = 7 then
				rgb_out <= "000111"; -- Coordinate (19, 7)
			elsif address_x = 20 and address_y = 7 then
				rgb_out <= "000111"; -- Coordinate (20, 7)
			elsif address_x = 21 and address_y = 7 then
				rgb_out <= "000111"; -- Coordinate (21, 7)
			elsif address_x = 22 and address_y = 7 then
				rgb_out <= "000111"; -- Coordinate (22, 7)
			elsif address_x = 23 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (23, 7)
			elsif address_x = 24 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (24, 7)
			elsif address_x = 25 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (25, 7)
			elsif address_x = 26 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (26, 7)
			elsif address_x = 27 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (27, 7)
			elsif address_x = 28 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (28, 7)
			elsif address_x = 29 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (29, 7)
			elsif address_x = 30 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (30, 7)
			elsif address_x = 31 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (31, 7)
			elsif address_x = 32 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (32, 7)
			elsif address_x = 33 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (33, 7)
			elsif address_x = 34 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (34, 7)
			elsif address_x = 35 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (35, 7)
			elsif address_x = 36 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (36, 7)
			elsif address_x = 37 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (37, 7)
			elsif address_x = 38 and address_y = 7 then
				rgb_out <= "000100"; -- Coordinate (38, 7)
			elsif address_x = 39 and address_y = 7 then
				rgb_out <= "001000"; -- Coordinate (39, 7)
			elsif address_x = 0 and address_y = 8 then
				rgb_out <= "001000"; -- Coordinate (0, 8)
			elsif address_x = 1 and address_y = 8 then
				rgb_out <= "000100"; -- Coordinate (1, 8)
			elsif address_x = 2 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (2, 8)
			elsif address_x = 3 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (3, 8)
			elsif address_x = 4 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (4, 8)
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
				rgb_out <= "000111"; -- Coordinate (15, 8)
			elsif address_x = 16 and address_y = 8 then
				rgb_out <= "000111"; -- Coordinate (16, 8)
			elsif address_x = 17 and address_y = 8 then
				rgb_out <= "000111"; -- Coordinate (17, 8)
			elsif address_x = 18 and address_y = 8 then
				rgb_out <= "000111"; -- Coordinate (18, 8)
			elsif address_x = 19 and address_y = 8 then
				rgb_out <= "000111"; -- Coordinate (19, 8)
			elsif address_x = 20 and address_y = 8 then
				rgb_out <= "000111"; -- Coordinate (20, 8)
			elsif address_x = 21 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (21, 8)
			elsif address_x = 22 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (22, 8)
			elsif address_x = 23 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (23, 8)
			elsif address_x = 24 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (24, 8)
			elsif address_x = 25 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (25, 8)
			elsif address_x = 26 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (26, 8)
			elsif address_x = 27 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (27, 8)
			elsif address_x = 28 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (28, 8)
			elsif address_x = 29 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (29, 8)
			elsif address_x = 30 and address_y = 8 then
				rgb_out <= "001100"; -- Coordinate (30, 8)
			elsif address_x = 31 and address_y = 8 then
				rgb_out <= "000100"; -- Coordinate (31, 8)
			elsif address_x = 32 and address_y = 8 then
				rgb_out <= "000100"; -- Coordinate (32, 8)
			elsif address_x = 33 and address_y = 8 then
				rgb_out <= "000100"; -- Coordinate (33, 8)
			elsif address_x = 34 and address_y = 8 then
				rgb_out <= "000100"; -- Coordinate (34, 8)
			elsif address_x = 35 and address_y = 8 then
				rgb_out <= "000100"; -- Coordinate (35, 8)
			elsif address_x = 36 and address_y = 8 then
				rgb_out <= "000100"; -- Coordinate (36, 8)
			elsif address_x = 37 and address_y = 8 then
				rgb_out <= "000100"; -- Coordinate (37, 8)
			elsif address_x = 38 and address_y = 8 then
				rgb_out <= "000100"; -- Coordinate (38, 8)
			elsif address_x = 39 and address_y = 8 then
				rgb_out <= "001000"; -- Coordinate (39, 8)
			elsif address_x = 0 and address_y = 9 then
				rgb_out <= "001000"; -- Coordinate (0, 9)
			elsif address_x = 1 and address_y = 9 then
				rgb_out <= "000100"; -- Coordinate (1, 9)
			elsif address_x = 2 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (2, 9)
			elsif address_x = 3 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (3, 9)
			elsif address_x = 4 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (4, 9)
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
				rgb_out <= "000111"; -- Coordinate (15, 9)
			elsif address_x = 16 and address_y = 9 then
				rgb_out <= "000111"; -- Coordinate (16, 9)
			elsif address_x = 17 and address_y = 9 then
				rgb_out <= "000111"; -- Coordinate (17, 9)
			elsif address_x = 18 and address_y = 9 then
				rgb_out <= "000111"; -- Coordinate (18, 9)
			elsif address_x = 19 and address_y = 9 then
				rgb_out <= "000111"; -- Coordinate (19, 9)
			elsif address_x = 20 and address_y = 9 then
				rgb_out <= "000111"; -- Coordinate (20, 9)
			elsif address_x = 21 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (21, 9)
			elsif address_x = 22 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (22, 9)
			elsif address_x = 23 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (23, 9)
			elsif address_x = 24 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (24, 9)
			elsif address_x = 25 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (25, 9)
			elsif address_x = 26 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (26, 9)
			elsif address_x = 27 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (27, 9)
			elsif address_x = 28 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (28, 9)
			elsif address_x = 29 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (29, 9)
			elsif address_x = 30 and address_y = 9 then
				rgb_out <= "001100"; -- Coordinate (30, 9)
			elsif address_x = 31 and address_y = 9 then
				rgb_out <= "000100"; -- Coordinate (31, 9)
			elsif address_x = 32 and address_y = 9 then
				rgb_out <= "000100"; -- Coordinate (32, 9)
			elsif address_x = 33 and address_y = 9 then
				rgb_out <= "000100"; -- Coordinate (33, 9)
			elsif address_x = 34 and address_y = 9 then
				rgb_out <= "000100"; -- Coordinate (34, 9)
			elsif address_x = 35 and address_y = 9 then
				rgb_out <= "000100"; -- Coordinate (35, 9)
			elsif address_x = 36 and address_y = 9 then
				rgb_out <= "000100"; -- Coordinate (36, 9)
			elsif address_x = 37 and address_y = 9 then
				rgb_out <= "000100"; -- Coordinate (37, 9)
			elsif address_x = 38 and address_y = 9 then
				rgb_out <= "000100"; -- Coordinate (38, 9)
			elsif address_x = 39 and address_y = 9 then
				rgb_out <= "001000"; -- Coordinate (39, 9)
			elsif address_x = 0 and address_y = 10 then
				rgb_out <= "001000"; -- Coordinate (0, 10)
			elsif address_x = 1 and address_y = 10 then
				rgb_out <= "000100"; -- Coordinate (1, 10)
			elsif address_x = 2 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (2, 10)
			elsif address_x = 3 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (3, 10)
			elsif address_x = 4 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (4, 10)
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
				rgb_out <= "000111"; -- Coordinate (13, 10)
			elsif address_x = 14 and address_y = 10 then
				rgb_out <= "000111"; -- Coordinate (14, 10)
			elsif address_x = 15 and address_y = 10 then
				rgb_out <= "000111"; -- Coordinate (15, 10)
			elsif address_x = 16 and address_y = 10 then
				rgb_out <= "000111"; -- Coordinate (16, 10)
			elsif address_x = 17 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (17, 10)
			elsif address_x = 18 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (18, 10)
			elsif address_x = 19 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (19, 10)
			elsif address_x = 20 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (20, 10)
			elsif address_x = 21 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (21, 10)
			elsif address_x = 22 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (22, 10)
			elsif address_x = 23 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (23, 10)
			elsif address_x = 24 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (24, 10)
			elsif address_x = 25 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (25, 10)
			elsif address_x = 26 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (26, 10)
			elsif address_x = 27 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (27, 10)
			elsif address_x = 28 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (28, 10)
			elsif address_x = 29 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (29, 10)
			elsif address_x = 30 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (30, 10)
			elsif address_x = 31 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (31, 10)
			elsif address_x = 32 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (32, 10)
			elsif address_x = 33 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (33, 10)
			elsif address_x = 34 and address_y = 10 then
				rgb_out <= "001100"; -- Coordinate (34, 10)
			elsif address_x = 35 and address_y = 10 then
				rgb_out <= "000100"; -- Coordinate (35, 10)
			elsif address_x = 36 and address_y = 10 then
				rgb_out <= "000100"; -- Coordinate (36, 10)
			elsif address_x = 37 and address_y = 10 then
				rgb_out <= "000100"; -- Coordinate (37, 10)
			elsif address_x = 38 and address_y = 10 then
				rgb_out <= "000100"; -- Coordinate (38, 10)
			elsif address_x = 39 and address_y = 10 then
				rgb_out <= "001000"; -- Coordinate (39, 10)
			elsif address_x = 0 and address_y = 11 then
				rgb_out <= "001000"; -- Coordinate (0, 11)
			elsif address_x = 1 and address_y = 11 then
				rgb_out <= "000100"; -- Coordinate (1, 11)
			elsif address_x = 2 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (2, 11)
			elsif address_x = 3 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (3, 11)
			elsif address_x = 4 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (4, 11)
			elsif address_x = 5 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (5, 11)
			elsif address_x = 6 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (6, 11)
			elsif address_x = 7 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (7, 11)
			elsif address_x = 8 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (8, 11)
			elsif address_x = 9 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (9, 11)
			elsif address_x = 10 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (10, 11)
			elsif address_x = 11 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (11, 11)
			elsif address_x = 12 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (12, 11)
			elsif address_x = 13 and address_y = 11 then
				rgb_out <= "000111"; -- Coordinate (13, 11)
			elsif address_x = 14 and address_y = 11 then
				rgb_out <= "000111"; -- Coordinate (14, 11)
			elsif address_x = 15 and address_y = 11 then
				rgb_out <= "000111"; -- Coordinate (15, 11)
			elsif address_x = 16 and address_y = 11 then
				rgb_out <= "000111"; -- Coordinate (16, 11)
			elsif address_x = 17 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (17, 11)
			elsif address_x = 18 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (18, 11)
			elsif address_x = 19 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (19, 11)
			elsif address_x = 20 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (20, 11)
			elsif address_x = 21 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (21, 11)
			elsif address_x = 22 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (22, 11)
			elsif address_x = 23 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (23, 11)
			elsif address_x = 24 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (24, 11)
			elsif address_x = 25 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (25, 11)
			elsif address_x = 26 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (26, 11)
			elsif address_x = 27 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (27, 11)
			elsif address_x = 28 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (28, 11)
			elsif address_x = 29 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (29, 11)
			elsif address_x = 30 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (30, 11)
			elsif address_x = 31 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (31, 11)
			elsif address_x = 32 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (32, 11)
			elsif address_x = 33 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (33, 11)
			elsif address_x = 34 and address_y = 11 then
				rgb_out <= "001100"; -- Coordinate (34, 11)
			elsif address_x = 35 and address_y = 11 then
				rgb_out <= "000100"; -- Coordinate (35, 11)
			elsif address_x = 36 and address_y = 11 then
				rgb_out <= "000100"; -- Coordinate (36, 11)
			elsif address_x = 37 and address_y = 11 then
				rgb_out <= "000100"; -- Coordinate (37, 11)
			elsif address_x = 38 and address_y = 11 then
				rgb_out <= "000100"; -- Coordinate (38, 11)
			elsif address_x = 39 and address_y = 11 then
				rgb_out <= "001000"; -- Coordinate (39, 11)
			elsif address_x = 0 and address_y = 12 then
				rgb_out <= "001000"; -- Coordinate (0, 12)
			elsif address_x = 1 and address_y = 12 then
				rgb_out <= "000100"; -- Coordinate (1, 12)
			elsif address_x = 2 and address_y = 12 then
				rgb_out <= "000111"; -- Coordinate (2, 12)
			elsif address_x = 3 and address_y = 12 then
				rgb_out <= "000111"; -- Coordinate (3, 12)
			elsif address_x = 4 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (4, 12)
			elsif address_x = 5 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (5, 12)
			elsif address_x = 6 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (6, 12)
			elsif address_x = 7 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (7, 12)
			elsif address_x = 8 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (8, 12)
			elsif address_x = 9 and address_y = 12 then
				rgb_out <= "000111"; -- Coordinate (9, 12)
			elsif address_x = 10 and address_y = 12 then
				rgb_out <= "000111"; -- Coordinate (10, 12)
			elsif address_x = 11 and address_y = 12 then
				rgb_out <= "000111"; -- Coordinate (11, 12)
			elsif address_x = 12 and address_y = 12 then
				rgb_out <= "000111"; -- Coordinate (12, 12)
			elsif address_x = 13 and address_y = 12 then
				rgb_out <= "000111"; -- Coordinate (13, 12)
			elsif address_x = 14 and address_y = 12 then
				rgb_out <= "000111"; -- Coordinate (14, 12)
			elsif address_x = 15 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (15, 12)
			elsif address_x = 16 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (16, 12)
			elsif address_x = 17 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (17, 12)
			elsif address_x = 18 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (18, 12)
			elsif address_x = 19 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (19, 12)
			elsif address_x = 20 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (20, 12)
			elsif address_x = 21 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (21, 12)
			elsif address_x = 22 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (22, 12)
			elsif address_x = 23 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (23, 12)
			elsif address_x = 24 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (24, 12)
			elsif address_x = 25 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (25, 12)
			elsif address_x = 26 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (26, 12)
			elsif address_x = 27 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (27, 12)
			elsif address_x = 28 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (28, 12)
			elsif address_x = 29 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (29, 12)
			elsif address_x = 30 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (30, 12)
			elsif address_x = 31 and address_y = 12 then
				rgb_out <= "111000"; -- Coordinate (31, 12)
			elsif address_x = 32 and address_y = 12 then
				rgb_out <= "111000"; -- Coordinate (32, 12)
			elsif address_x = 33 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (33, 12)
			elsif address_x = 34 and address_y = 12 then
				rgb_out <= "001100"; -- Coordinate (34, 12)
			elsif address_x = 35 and address_y = 12 then
				rgb_out <= "000100"; -- Coordinate (35, 12)
			elsif address_x = 36 and address_y = 12 then
				rgb_out <= "000100"; -- Coordinate (36, 12)
			elsif address_x = 37 and address_y = 12 then
				rgb_out <= "000100"; -- Coordinate (37, 12)
			elsif address_x = 38 and address_y = 12 then
				rgb_out <= "000100"; -- Coordinate (38, 12)
			elsif address_x = 39 and address_y = 12 then
				rgb_out <= "001000"; -- Coordinate (39, 12)
			elsif address_x = 0 and address_y = 13 then
				rgb_out <= "001000"; -- Coordinate (0, 13)
			elsif address_x = 1 and address_y = 13 then
				rgb_out <= "000100"; -- Coordinate (1, 13)
			elsif address_x = 2 and address_y = 13 then
				rgb_out <= "000111"; -- Coordinate (2, 13)
			elsif address_x = 3 and address_y = 13 then
				rgb_out <= "000111"; -- Coordinate (3, 13)
			elsif address_x = 4 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (4, 13)
			elsif address_x = 5 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (5, 13)
			elsif address_x = 6 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (6, 13)
			elsif address_x = 7 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (7, 13)
			elsif address_x = 8 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (8, 13)
			elsif address_x = 9 and address_y = 13 then
				rgb_out <= "000111"; -- Coordinate (9, 13)
			elsif address_x = 10 and address_y = 13 then
				rgb_out <= "000111"; -- Coordinate (10, 13)
			elsif address_x = 11 and address_y = 13 then
				rgb_out <= "000111"; -- Coordinate (11, 13)
			elsif address_x = 12 and address_y = 13 then
				rgb_out <= "000111"; -- Coordinate (12, 13)
			elsif address_x = 13 and address_y = 13 then
				rgb_out <= "000111"; -- Coordinate (13, 13)
			elsif address_x = 14 and address_y = 13 then
				rgb_out <= "000111"; -- Coordinate (14, 13)
			elsif address_x = 15 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (15, 13)
			elsif address_x = 16 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (16, 13)
			elsif address_x = 17 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (17, 13)
			elsif address_x = 18 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (18, 13)
			elsif address_x = 19 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (19, 13)
			elsif address_x = 20 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (20, 13)
			elsif address_x = 21 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (21, 13)
			elsif address_x = 22 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (22, 13)
			elsif address_x = 23 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (23, 13)
			elsif address_x = 24 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (24, 13)
			elsif address_x = 25 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (25, 13)
			elsif address_x = 26 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (26, 13)
			elsif address_x = 27 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (27, 13)
			elsif address_x = 28 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (28, 13)
			elsif address_x = 29 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (29, 13)
			elsif address_x = 30 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (30, 13)
			elsif address_x = 31 and address_y = 13 then
				rgb_out <= "111000"; -- Coordinate (31, 13)
			elsif address_x = 32 and address_y = 13 then
				rgb_out <= "111000"; -- Coordinate (32, 13)
			elsif address_x = 33 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (33, 13)
			elsif address_x = 34 and address_y = 13 then
				rgb_out <= "001100"; -- Coordinate (34, 13)
			elsif address_x = 35 and address_y = 13 then
				rgb_out <= "000100"; -- Coordinate (35, 13)
			elsif address_x = 36 and address_y = 13 then
				rgb_out <= "000100"; -- Coordinate (36, 13)
			elsif address_x = 37 and address_y = 13 then
				rgb_out <= "000100"; -- Coordinate (37, 13)
			elsif address_x = 38 and address_y = 13 then
				rgb_out <= "000100"; -- Coordinate (38, 13)
			elsif address_x = 39 and address_y = 13 then
				rgb_out <= "001000"; -- Coordinate (39, 13)
			elsif address_x = 0 and address_y = 14 then
				rgb_out <= "001000"; -- Coordinate (0, 14)
			elsif address_x = 1 and address_y = 14 then
				rgb_out <= "000100"; -- Coordinate (1, 14)
			elsif address_x = 2 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (2, 14)
			elsif address_x = 3 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (3, 14)
			elsif address_x = 4 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (4, 14)
			elsif address_x = 5 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (5, 14)
			elsif address_x = 6 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (6, 14)
			elsif address_x = 7 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (7, 14)
			elsif address_x = 8 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (8, 14)
			elsif address_x = 9 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (9, 14)
			elsif address_x = 10 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (10, 14)
			elsif address_x = 11 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (11, 14)
			elsif address_x = 12 and address_y = 14 then
				rgb_out <= "000111"; -- Coordinate (12, 14)
			elsif address_x = 13 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (13, 14)
			elsif address_x = 14 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (14, 14)
			elsif address_x = 15 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (15, 14)
			elsif address_x = 16 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (16, 14)
			elsif address_x = 17 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (17, 14)
			elsif address_x = 18 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (18, 14)
			elsif address_x = 19 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (19, 14)
			elsif address_x = 20 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (20, 14)
			elsif address_x = 21 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (21, 14)
			elsif address_x = 22 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (22, 14)
			elsif address_x = 23 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (23, 14)
			elsif address_x = 24 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (24, 14)
			elsif address_x = 25 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (25, 14)
			elsif address_x = 26 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (26, 14)
			elsif address_x = 27 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (27, 14)
			elsif address_x = 28 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (28, 14)
			elsif address_x = 29 and address_y = 14 then
				rgb_out <= "111000"; -- Coordinate (29, 14)
			elsif address_x = 30 and address_y = 14 then
				rgb_out <= "111000"; -- Coordinate (30, 14)
			elsif address_x = 31 and address_y = 14 then
				rgb_out <= "111000"; -- Coordinate (31, 14)
			elsif address_x = 32 and address_y = 14 then
				rgb_out <= "111000"; -- Coordinate (32, 14)
			elsif address_x = 33 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (33, 14)
			elsif address_x = 34 and address_y = 14 then
				rgb_out <= "001100"; -- Coordinate (34, 14)
			elsif address_x = 35 and address_y = 14 then
				rgb_out <= "000100"; -- Coordinate (35, 14)
			elsif address_x = 36 and address_y = 14 then
				rgb_out <= "000100"; -- Coordinate (36, 14)
			elsif address_x = 37 and address_y = 14 then
				rgb_out <= "000100"; -- Coordinate (37, 14)
			elsif address_x = 38 and address_y = 14 then
				rgb_out <= "000100"; -- Coordinate (38, 14)
			elsif address_x = 39 and address_y = 14 then
				rgb_out <= "001000"; -- Coordinate (39, 14)
			elsif address_x = 0 and address_y = 15 then
				rgb_out <= "001000"; -- Coordinate (0, 15)
			elsif address_x = 1 and address_y = 15 then
				rgb_out <= "000100"; -- Coordinate (1, 15)
			elsif address_x = 2 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (2, 15)
			elsif address_x = 3 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (3, 15)
			elsif address_x = 4 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (4, 15)
			elsif address_x = 5 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (5, 15)
			elsif address_x = 6 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (6, 15)
			elsif address_x = 7 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (7, 15)
			elsif address_x = 8 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (8, 15)
			elsif address_x = 9 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (9, 15)
			elsif address_x = 10 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (10, 15)
			elsif address_x = 11 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (11, 15)
			elsif address_x = 12 and address_y = 15 then
				rgb_out <= "000111"; -- Coordinate (12, 15)
			elsif address_x = 13 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (13, 15)
			elsif address_x = 14 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (14, 15)
			elsif address_x = 15 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (15, 15)
			elsif address_x = 16 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (16, 15)
			elsif address_x = 17 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (17, 15)
			elsif address_x = 18 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (18, 15)
			elsif address_x = 19 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (19, 15)
			elsif address_x = 20 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (20, 15)
			elsif address_x = 21 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (21, 15)
			elsif address_x = 22 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (22, 15)
			elsif address_x = 23 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (23, 15)
			elsif address_x = 24 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (24, 15)
			elsif address_x = 25 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (25, 15)
			elsif address_x = 26 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (26, 15)
			elsif address_x = 27 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (27, 15)
			elsif address_x = 28 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (28, 15)
			elsif address_x = 29 and address_y = 15 then
				rgb_out <= "111000"; -- Coordinate (29, 15)
			elsif address_x = 30 and address_y = 15 then
				rgb_out <= "111000"; -- Coordinate (30, 15)
			elsif address_x = 31 and address_y = 15 then
				rgb_out <= "111000"; -- Coordinate (31, 15)
			elsif address_x = 32 and address_y = 15 then
				rgb_out <= "111000"; -- Coordinate (32, 15)
			elsif address_x = 33 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (33, 15)
			elsif address_x = 34 and address_y = 15 then
				rgb_out <= "001100"; -- Coordinate (34, 15)
			elsif address_x = 35 and address_y = 15 then
				rgb_out <= "000100"; -- Coordinate (35, 15)
			elsif address_x = 36 and address_y = 15 then
				rgb_out <= "000100"; -- Coordinate (36, 15)
			elsif address_x = 37 and address_y = 15 then
				rgb_out <= "000100"; -- Coordinate (37, 15)
			elsif address_x = 38 and address_y = 15 then
				rgb_out <= "000100"; -- Coordinate (38, 15)
			elsif address_x = 39 and address_y = 15 then
				rgb_out <= "001000"; -- Coordinate (39, 15)
			elsif address_x = 0 and address_y = 16 then
				rgb_out <= "001000"; -- Coordinate (0, 16)
			elsif address_x = 1 and address_y = 16 then
				rgb_out <= "000100"; -- Coordinate (1, 16)
			elsif address_x = 2 and address_y = 16 then
				rgb_out <= "000111"; -- Coordinate (2, 16)
			elsif address_x = 3 and address_y = 16 then
				rgb_out <= "000111"; -- Coordinate (3, 16)
			elsif address_x = 4 and address_y = 16 then
				rgb_out <= "000111"; -- Coordinate (4, 16)
			elsif address_x = 5 and address_y = 16 then
				rgb_out <= "000111"; -- Coordinate (5, 16)
			elsif address_x = 6 and address_y = 16 then
				rgb_out <= "000111"; -- Coordinate (6, 16)
			elsif address_x = 7 and address_y = 16 then
				rgb_out <= "000111"; -- Coordinate (7, 16)
			elsif address_x = 8 and address_y = 16 then
				rgb_out <= "000111"; -- Coordinate (8, 16)
			elsif address_x = 9 and address_y = 16 then
				rgb_out <= "000111"; -- Coordinate (9, 16)
			elsif address_x = 10 and address_y = 16 then
				rgb_out <= "000111"; -- Coordinate (10, 16)
			elsif address_x = 11 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (11, 16)
			elsif address_x = 12 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (12, 16)
			elsif address_x = 13 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (13, 16)
			elsif address_x = 14 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (14, 16)
			elsif address_x = 15 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (15, 16)
			elsif address_x = 16 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (16, 16)
			elsif address_x = 17 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (17, 16)
			elsif address_x = 18 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (18, 16)
			elsif address_x = 19 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (19, 16)
			elsif address_x = 20 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (20, 16)
			elsif address_x = 21 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (21, 16)
			elsif address_x = 22 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (22, 16)
			elsif address_x = 23 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (23, 16)
			elsif address_x = 24 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (24, 16)
			elsif address_x = 25 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (25, 16)
			elsif address_x = 26 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (26, 16)
			elsif address_x = 27 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (27, 16)
			elsif address_x = 28 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (28, 16)
			elsif address_x = 29 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (29, 16)
			elsif address_x = 30 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (30, 16)
			elsif address_x = 31 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (31, 16)
			elsif address_x = 32 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (32, 16)
			elsif address_x = 33 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (33, 16)
			elsif address_x = 34 and address_y = 16 then
				rgb_out <= "001100"; -- Coordinate (34, 16)
			elsif address_x = 35 and address_y = 16 then
				rgb_out <= "000100"; -- Coordinate (35, 16)
			elsif address_x = 36 and address_y = 16 then
				rgb_out <= "000100"; -- Coordinate (36, 16)
			elsif address_x = 37 and address_y = 16 then
				rgb_out <= "000100"; -- Coordinate (37, 16)
			elsif address_x = 38 and address_y = 16 then
				rgb_out <= "000100"; -- Coordinate (38, 16)
			elsif address_x = 39 and address_y = 16 then
				rgb_out <= "001000"; -- Coordinate (39, 16)
			elsif address_x = 0 and address_y = 17 then
				rgb_out <= "001000"; -- Coordinate (0, 17)
			elsif address_x = 1 and address_y = 17 then
				rgb_out <= "000100"; -- Coordinate (1, 17)
			elsif address_x = 2 and address_y = 17 then
				rgb_out <= "000111"; -- Coordinate (2, 17)
			elsif address_x = 3 and address_y = 17 then
				rgb_out <= "000111"; -- Coordinate (3, 17)
			elsif address_x = 4 and address_y = 17 then
				rgb_out <= "000111"; -- Coordinate (4, 17)
			elsif address_x = 5 and address_y = 17 then
				rgb_out <= "000111"; -- Coordinate (5, 17)
			elsif address_x = 6 and address_y = 17 then
				rgb_out <= "000111"; -- Coordinate (6, 17)
			elsif address_x = 7 and address_y = 17 then
				rgb_out <= "000111"; -- Coordinate (7, 17)
			elsif address_x = 8 and address_y = 17 then
				rgb_out <= "000111"; -- Coordinate (8, 17)
			elsif address_x = 9 and address_y = 17 then
				rgb_out <= "000111"; -- Coordinate (9, 17)
			elsif address_x = 10 and address_y = 17 then
				rgb_out <= "000111"; -- Coordinate (10, 17)
			elsif address_x = 11 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (11, 17)
			elsif address_x = 12 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (12, 17)
			elsif address_x = 13 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (13, 17)
			elsif address_x = 14 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (14, 17)
			elsif address_x = 15 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (15, 17)
			elsif address_x = 16 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (16, 17)
			elsif address_x = 17 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (17, 17)
			elsif address_x = 18 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (18, 17)
			elsif address_x = 19 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (19, 17)
			elsif address_x = 20 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (20, 17)
			elsif address_x = 21 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (21, 17)
			elsif address_x = 22 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (22, 17)
			elsif address_x = 23 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (23, 17)
			elsif address_x = 24 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (24, 17)
			elsif address_x = 25 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (25, 17)
			elsif address_x = 26 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (26, 17)
			elsif address_x = 27 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (27, 17)
			elsif address_x = 28 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (28, 17)
			elsif address_x = 29 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (29, 17)
			elsif address_x = 30 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (30, 17)
			elsif address_x = 31 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (31, 17)
			elsif address_x = 32 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (32, 17)
			elsif address_x = 33 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (33, 17)
			elsif address_x = 34 and address_y = 17 then
				rgb_out <= "001100"; -- Coordinate (34, 17)
			elsif address_x = 35 and address_y = 17 then
				rgb_out <= "000100"; -- Coordinate (35, 17)
			elsif address_x = 36 and address_y = 17 then
				rgb_out <= "000100"; -- Coordinate (36, 17)
			elsif address_x = 37 and address_y = 17 then
				rgb_out <= "000100"; -- Coordinate (37, 17)
			elsif address_x = 38 and address_y = 17 then
				rgb_out <= "000100"; -- Coordinate (38, 17)
			elsif address_x = 39 and address_y = 17 then
				rgb_out <= "001000"; -- Coordinate (39, 17)
			elsif address_x = 0 and address_y = 18 then
				rgb_out <= "001000"; -- Coordinate (0, 18)
			elsif address_x = 1 and address_y = 18 then
				rgb_out <= "000100"; -- Coordinate (1, 18)
			elsif address_x = 2 and address_y = 18 then
				rgb_out <= "000111"; -- Coordinate (2, 18)
			elsif address_x = 3 and address_y = 18 then
				rgb_out <= "000111"; -- Coordinate (3, 18)
			elsif address_x = 4 and address_y = 18 then
				rgb_out <= "000111"; -- Coordinate (4, 18)
			elsif address_x = 5 and address_y = 18 then
				rgb_out <= "000111"; -- Coordinate (5, 18)
			elsif address_x = 6 and address_y = 18 then
				rgb_out <= "000111"; -- Coordinate (6, 18)
			elsif address_x = 7 and address_y = 18 then
				rgb_out <= "000111"; -- Coordinate (7, 18)
			elsif address_x = 8 and address_y = 18 then
				rgb_out <= "000111"; -- Coordinate (8, 18)
			elsif address_x = 9 and address_y = 18 then
				rgb_out <= "000111"; -- Coordinate (9, 18)
			elsif address_x = 10 and address_y = 18 then
				rgb_out <= "000111"; -- Coordinate (10, 18)
			elsif address_x = 11 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (11, 18)
			elsif address_x = 12 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (12, 18)
			elsif address_x = 13 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (13, 18)
			elsif address_x = 14 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (14, 18)
			elsif address_x = 15 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (15, 18)
			elsif address_x = 16 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (16, 18)
			elsif address_x = 17 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (17, 18)
			elsif address_x = 18 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (18, 18)
			elsif address_x = 19 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (19, 18)
			elsif address_x = 20 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (20, 18)
			elsif address_x = 21 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (21, 18)
			elsif address_x = 22 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (22, 18)
			elsif address_x = 23 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (23, 18)
			elsif address_x = 24 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (24, 18)
			elsif address_x = 25 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (25, 18)
			elsif address_x = 26 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (26, 18)
			elsif address_x = 27 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (27, 18)
			elsif address_x = 28 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (28, 18)
			elsif address_x = 29 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (29, 18)
			elsif address_x = 30 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (30, 18)
			elsif address_x = 31 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (31, 18)
			elsif address_x = 32 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (32, 18)
			elsif address_x = 33 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (33, 18)
			elsif address_x = 34 and address_y = 18 then
				rgb_out <= "001100"; -- Coordinate (34, 18)
			elsif address_x = 35 and address_y = 18 then
				rgb_out <= "000100"; -- Coordinate (35, 18)
			elsif address_x = 36 and address_y = 18 then
				rgb_out <= "000100"; -- Coordinate (36, 18)
			elsif address_x = 37 and address_y = 18 then
				rgb_out <= "000100"; -- Coordinate (37, 18)
			elsif address_x = 38 and address_y = 18 then
				rgb_out <= "000100"; -- Coordinate (38, 18)
			elsif address_x = 39 and address_y = 18 then
				rgb_out <= "001000"; -- Coordinate (39, 18)
			elsif address_x = 0 and address_y = 19 then
				rgb_out <= "001000"; -- Coordinate (0, 19)
			elsif address_x = 1 and address_y = 19 then
				rgb_out <= "000100"; -- Coordinate (1, 19)
			elsif address_x = 2 and address_y = 19 then
				rgb_out <= "000111"; -- Coordinate (2, 19)
			elsif address_x = 3 and address_y = 19 then
				rgb_out <= "000111"; -- Coordinate (3, 19)
			elsif address_x = 4 and address_y = 19 then
				rgb_out <= "000111"; -- Coordinate (4, 19)
			elsif address_x = 5 and address_y = 19 then
				rgb_out <= "000111"; -- Coordinate (5, 19)
			elsif address_x = 6 and address_y = 19 then
				rgb_out <= "000111"; -- Coordinate (6, 19)
			elsif address_x = 7 and address_y = 19 then
				rgb_out <= "000111"; -- Coordinate (7, 19)
			elsif address_x = 8 and address_y = 19 then
				rgb_out <= "000111"; -- Coordinate (8, 19)
			elsif address_x = 9 and address_y = 19 then
				rgb_out <= "000111"; -- Coordinate (9, 19)
			elsif address_x = 10 and address_y = 19 then
				rgb_out <= "000111"; -- Coordinate (10, 19)
			elsif address_x = 11 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (11, 19)
			elsif address_x = 12 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (12, 19)
			elsif address_x = 13 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (13, 19)
			elsif address_x = 14 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (14, 19)
			elsif address_x = 15 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (15, 19)
			elsif address_x = 16 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (16, 19)
			elsif address_x = 17 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (17, 19)
			elsif address_x = 18 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (18, 19)
			elsif address_x = 19 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (19, 19)
			elsif address_x = 20 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (20, 19)
			elsif address_x = 21 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (21, 19)
			elsif address_x = 22 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (22, 19)
			elsif address_x = 23 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (23, 19)
			elsif address_x = 24 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (24, 19)
			elsif address_x = 25 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (25, 19)
			elsif address_x = 26 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (26, 19)
			elsif address_x = 27 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (27, 19)
			elsif address_x = 28 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (28, 19)
			elsif address_x = 29 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (29, 19)
			elsif address_x = 30 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (30, 19)
			elsif address_x = 31 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (31, 19)
			elsif address_x = 32 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (32, 19)
			elsif address_x = 33 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (33, 19)
			elsif address_x = 34 and address_y = 19 then
				rgb_out <= "001100"; -- Coordinate (34, 19)
			elsif address_x = 35 and address_y = 19 then
				rgb_out <= "000100"; -- Coordinate (35, 19)
			elsif address_x = 36 and address_y = 19 then
				rgb_out <= "000100"; -- Coordinate (36, 19)
			elsif address_x = 37 and address_y = 19 then
				rgb_out <= "000100"; -- Coordinate (37, 19)
			elsif address_x = 38 and address_y = 19 then
				rgb_out <= "000100"; -- Coordinate (38, 19)
			elsif address_x = 39 and address_y = 19 then
				rgb_out <= "001000"; -- Coordinate (39, 19)
			elsif address_x = 0 and address_y = 20 then
				rgb_out <= "001000"; -- Coordinate (0, 20)
			elsif address_x = 1 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (1, 20)
			elsif address_x = 2 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (2, 20)
			elsif address_x = 3 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (3, 20)
			elsif address_x = 4 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (4, 20)
			elsif address_x = 5 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (5, 20)
			elsif address_x = 6 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (6, 20)
			elsif address_x = 7 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (7, 20)
			elsif address_x = 8 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (8, 20)
			elsif address_x = 9 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (9, 20)
			elsif address_x = 10 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (10, 20)
			elsif address_x = 11 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (11, 20)
			elsif address_x = 12 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (12, 20)
			elsif address_x = 13 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (13, 20)
			elsif address_x = 14 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (14, 20)
			elsif address_x = 15 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (15, 20)
			elsif address_x = 16 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (16, 20)
			elsif address_x = 17 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (17, 20)
			elsif address_x = 18 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (18, 20)
			elsif address_x = 19 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (19, 20)
			elsif address_x = 20 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (20, 20)
			elsif address_x = 21 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (21, 20)
			elsif address_x = 22 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (22, 20)
			elsif address_x = 23 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (23, 20)
			elsif address_x = 24 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (24, 20)
			elsif address_x = 25 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (25, 20)
			elsif address_x = 26 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (26, 20)
			elsif address_x = 27 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (27, 20)
			elsif address_x = 28 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (28, 20)
			elsif address_x = 29 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (29, 20)
			elsif address_x = 30 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (30, 20)
			elsif address_x = 31 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (31, 20)
			elsif address_x = 32 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (32, 20)
			elsif address_x = 33 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (33, 20)
			elsif address_x = 34 and address_y = 20 then
				rgb_out <= "001100"; -- Coordinate (34, 20)
			elsif address_x = 35 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (35, 20)
			elsif address_x = 36 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (36, 20)
			elsif address_x = 37 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (37, 20)
			elsif address_x = 38 and address_y = 20 then
				rgb_out <= "000100"; -- Coordinate (38, 20)
			elsif address_x = 39 and address_y = 20 then
				rgb_out <= "001000"; -- Coordinate (39, 20)
			elsif address_x = 0 and address_y = 21 then
				rgb_out <= "001000"; -- Coordinate (0, 21)
			elsif address_x = 1 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (1, 21)
			elsif address_x = 2 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (2, 21)
			elsif address_x = 3 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (3, 21)
			elsif address_x = 4 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (4, 21)
			elsif address_x = 5 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (5, 21)
			elsif address_x = 6 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (6, 21)
			elsif address_x = 7 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (7, 21)
			elsif address_x = 8 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (8, 21)
			elsif address_x = 9 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (9, 21)
			elsif address_x = 10 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (10, 21)
			elsif address_x = 11 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (11, 21)
			elsif address_x = 12 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (12, 21)
			elsif address_x = 13 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (13, 21)
			elsif address_x = 14 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (14, 21)
			elsif address_x = 15 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (15, 21)
			elsif address_x = 16 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (16, 21)
			elsif address_x = 17 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (17, 21)
			elsif address_x = 18 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (18, 21)
			elsif address_x = 19 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (19, 21)
			elsif address_x = 20 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (20, 21)
			elsif address_x = 21 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (21, 21)
			elsif address_x = 22 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (22, 21)
			elsif address_x = 23 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (23, 21)
			elsif address_x = 24 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (24, 21)
			elsif address_x = 25 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (25, 21)
			elsif address_x = 26 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (26, 21)
			elsif address_x = 27 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (27, 21)
			elsif address_x = 28 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (28, 21)
			elsif address_x = 29 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (29, 21)
			elsif address_x = 30 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (30, 21)
			elsif address_x = 31 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (31, 21)
			elsif address_x = 32 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (32, 21)
			elsif address_x = 33 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (33, 21)
			elsif address_x = 34 and address_y = 21 then
				rgb_out <= "001100"; -- Coordinate (34, 21)
			elsif address_x = 35 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (35, 21)
			elsif address_x = 36 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (36, 21)
			elsif address_x = 37 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (37, 21)
			elsif address_x = 38 and address_y = 21 then
				rgb_out <= "000100"; -- Coordinate (38, 21)
			elsif address_x = 39 and address_y = 21 then
				rgb_out <= "001000"; -- Coordinate (39, 21)
			elsif address_x = 0 and address_y = 22 then
				rgb_out <= "001000"; -- Coordinate (0, 22)
			elsif address_x = 1 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (1, 22)
			elsif address_x = 2 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (2, 22)
			elsif address_x = 3 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (3, 22)
			elsif address_x = 4 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (4, 22)
			elsif address_x = 5 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (5, 22)
			elsif address_x = 6 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (6, 22)
			elsif address_x = 7 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (7, 22)
			elsif address_x = 8 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (8, 22)
			elsif address_x = 9 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (9, 22)
			elsif address_x = 10 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (10, 22)
			elsif address_x = 11 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (11, 22)
			elsif address_x = 12 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (12, 22)
			elsif address_x = 13 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (13, 22)
			elsif address_x = 14 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (14, 22)
			elsif address_x = 15 and address_y = 22 then
				rgb_out <= "111000"; -- Coordinate (15, 22)
			elsif address_x = 16 and address_y = 22 then
				rgb_out <= "111000"; -- Coordinate (16, 22)
			elsif address_x = 17 and address_y = 22 then
				rgb_out <= "111000"; -- Coordinate (17, 22)
			elsif address_x = 18 and address_y = 22 then
				rgb_out <= "111000"; -- Coordinate (18, 22)
			elsif address_x = 19 and address_y = 22 then
				rgb_out <= "111000"; -- Coordinate (19, 22)
			elsif address_x = 20 and address_y = 22 then
				rgb_out <= "111000"; -- Coordinate (20, 22)
			elsif address_x = 21 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (21, 22)
			elsif address_x = 22 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (22, 22)
			elsif address_x = 23 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (23, 22)
			elsif address_x = 24 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (24, 22)
			elsif address_x = 25 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (25, 22)
			elsif address_x = 26 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (26, 22)
			elsif address_x = 27 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (27, 22)
			elsif address_x = 28 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (28, 22)
			elsif address_x = 29 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (29, 22)
			elsif address_x = 30 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (30, 22)
			elsif address_x = 31 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (31, 22)
			elsif address_x = 32 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (32, 22)
			elsif address_x = 33 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (33, 22)
			elsif address_x = 34 and address_y = 22 then
				rgb_out <= "001100"; -- Coordinate (34, 22)
			elsif address_x = 35 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (35, 22)
			elsif address_x = 36 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (36, 22)
			elsif address_x = 37 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (37, 22)
			elsif address_x = 38 and address_y = 22 then
				rgb_out <= "000100"; -- Coordinate (38, 22)
			elsif address_x = 39 and address_y = 22 then
				rgb_out <= "001000"; -- Coordinate (39, 22)
			elsif address_x = 0 and address_y = 23 then
				rgb_out <= "001000"; -- Coordinate (0, 23)
			elsif address_x = 1 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (1, 23)
			elsif address_x = 2 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (2, 23)
			elsif address_x = 3 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (3, 23)
			elsif address_x = 4 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (4, 23)
			elsif address_x = 5 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (5, 23)
			elsif address_x = 6 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (6, 23)
			elsif address_x = 7 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (7, 23)
			elsif address_x = 8 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (8, 23)
			elsif address_x = 9 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (9, 23)
			elsif address_x = 10 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (10, 23)
			elsif address_x = 11 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (11, 23)
			elsif address_x = 12 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (12, 23)
			elsif address_x = 13 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (13, 23)
			elsif address_x = 14 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (14, 23)
			elsif address_x = 15 and address_y = 23 then
				rgb_out <= "111000"; -- Coordinate (15, 23)
			elsif address_x = 16 and address_y = 23 then
				rgb_out <= "111000"; -- Coordinate (16, 23)
			elsif address_x = 17 and address_y = 23 then
				rgb_out <= "111000"; -- Coordinate (17, 23)
			elsif address_x = 18 and address_y = 23 then
				rgb_out <= "111000"; -- Coordinate (18, 23)
			elsif address_x = 19 and address_y = 23 then
				rgb_out <= "111000"; -- Coordinate (19, 23)
			elsif address_x = 20 and address_y = 23 then
				rgb_out <= "111000"; -- Coordinate (20, 23)
			elsif address_x = 21 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (21, 23)
			elsif address_x = 22 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (22, 23)
			elsif address_x = 23 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (23, 23)
			elsif address_x = 24 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (24, 23)
			elsif address_x = 25 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (25, 23)
			elsif address_x = 26 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (26, 23)
			elsif address_x = 27 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (27, 23)
			elsif address_x = 28 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (28, 23)
			elsif address_x = 29 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (29, 23)
			elsif address_x = 30 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (30, 23)
			elsif address_x = 31 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (31, 23)
			elsif address_x = 32 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (32, 23)
			elsif address_x = 33 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (33, 23)
			elsif address_x = 34 and address_y = 23 then
				rgb_out <= "001100"; -- Coordinate (34, 23)
			elsif address_x = 35 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (35, 23)
			elsif address_x = 36 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (36, 23)
			elsif address_x = 37 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (37, 23)
			elsif address_x = 38 and address_y = 23 then
				rgb_out <= "000100"; -- Coordinate (38, 23)
			elsif address_x = 39 and address_y = 23 then
				rgb_out <= "001000"; -- Coordinate (39, 23)
			elsif address_x = 0 and address_y = 24 then
				rgb_out <= "001000"; -- Coordinate (0, 24)
			elsif address_x = 1 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (1, 24)
			elsif address_x = 2 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (2, 24)
			elsif address_x = 3 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (3, 24)
			elsif address_x = 4 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (4, 24)
			elsif address_x = 5 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (5, 24)
			elsif address_x = 6 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (6, 24)
			elsif address_x = 7 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (7, 24)
			elsif address_x = 8 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (8, 24)
			elsif address_x = 9 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (9, 24)
			elsif address_x = 10 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (10, 24)
			elsif address_x = 11 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (11, 24)
			elsif address_x = 12 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (12, 24)
			elsif address_x = 13 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (13, 24)
			elsif address_x = 14 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (14, 24)
			elsif address_x = 15 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (15, 24)
			elsif address_x = 16 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (16, 24)
			elsif address_x = 17 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (17, 24)
			elsif address_x = 18 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (18, 24)
			elsif address_x = 19 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (19, 24)
			elsif address_x = 20 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (20, 24)
			elsif address_x = 21 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (21, 24)
			elsif address_x = 22 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (22, 24)
			elsif address_x = 23 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (23, 24)
			elsif address_x = 24 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (24, 24)
			elsif address_x = 25 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (25, 24)
			elsif address_x = 26 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (26, 24)
			elsif address_x = 27 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (27, 24)
			elsif address_x = 28 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (28, 24)
			elsif address_x = 29 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (29, 24)
			elsif address_x = 30 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (30, 24)
			elsif address_x = 31 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (31, 24)
			elsif address_x = 32 and address_y = 24 then
				rgb_out <= "001100"; -- Coordinate (32, 24)
			elsif address_x = 33 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (33, 24)
			elsif address_x = 34 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (34, 24)
			elsif address_x = 35 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (35, 24)
			elsif address_x = 36 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (36, 24)
			elsif address_x = 37 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (37, 24)
			elsif address_x = 38 and address_y = 24 then
				rgb_out <= "000100"; -- Coordinate (38, 24)
			elsif address_x = 39 and address_y = 24 then
				rgb_out <= "001000"; -- Coordinate (39, 24)
			elsif address_x = 0 and address_y = 25 then
				rgb_out <= "001000"; -- Coordinate (0, 25)
			elsif address_x = 1 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (1, 25)
			elsif address_x = 2 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (2, 25)
			elsif address_x = 3 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (3, 25)
			elsif address_x = 4 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (4, 25)
			elsif address_x = 5 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (5, 25)
			elsif address_x = 6 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (6, 25)
			elsif address_x = 7 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (7, 25)
			elsif address_x = 8 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (8, 25)
			elsif address_x = 9 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (9, 25)
			elsif address_x = 10 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (10, 25)
			elsif address_x = 11 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (11, 25)
			elsif address_x = 12 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (12, 25)
			elsif address_x = 13 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (13, 25)
			elsif address_x = 14 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (14, 25)
			elsif address_x = 15 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (15, 25)
			elsif address_x = 16 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (16, 25)
			elsif address_x = 17 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (17, 25)
			elsif address_x = 18 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (18, 25)
			elsif address_x = 19 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (19, 25)
			elsif address_x = 20 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (20, 25)
			elsif address_x = 21 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (21, 25)
			elsif address_x = 22 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (22, 25)
			elsif address_x = 23 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (23, 25)
			elsif address_x = 24 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (24, 25)
			elsif address_x = 25 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (25, 25)
			elsif address_x = 26 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (26, 25)
			elsif address_x = 27 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (27, 25)
			elsif address_x = 28 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (28, 25)
			elsif address_x = 29 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (29, 25)
			elsif address_x = 30 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (30, 25)
			elsif address_x = 31 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (31, 25)
			elsif address_x = 32 and address_y = 25 then
				rgb_out <= "001100"; -- Coordinate (32, 25)
			elsif address_x = 33 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (33, 25)
			elsif address_x = 34 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (34, 25)
			elsif address_x = 35 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (35, 25)
			elsif address_x = 36 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (36, 25)
			elsif address_x = 37 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (37, 25)
			elsif address_x = 38 and address_y = 25 then
				rgb_out <= "000100"; -- Coordinate (38, 25)
			elsif address_x = 39 and address_y = 25 then
				rgb_out <= "001000"; -- Coordinate (39, 25)
			elsif address_x = 0 and address_y = 26 then
				rgb_out <= "001000"; -- Coordinate (0, 26)
			elsif address_x = 1 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (1, 26)
			elsif address_x = 2 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (2, 26)
			elsif address_x = 3 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (3, 26)
			elsif address_x = 4 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (4, 26)
			elsif address_x = 5 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (5, 26)
			elsif address_x = 6 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (6, 26)
			elsif address_x = 7 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (7, 26)
			elsif address_x = 8 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (8, 26)
			elsif address_x = 9 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (9, 26)
			elsif address_x = 10 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (10, 26)
			elsif address_x = 11 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (11, 26)
			elsif address_x = 12 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (12, 26)
			elsif address_x = 13 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (13, 26)
			elsif address_x = 14 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (14, 26)
			elsif address_x = 15 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (15, 26)
			elsif address_x = 16 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (16, 26)
			elsif address_x = 17 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (17, 26)
			elsif address_x = 18 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (18, 26)
			elsif address_x = 19 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (19, 26)
			elsif address_x = 20 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (20, 26)
			elsif address_x = 21 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (21, 26)
			elsif address_x = 22 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (22, 26)
			elsif address_x = 23 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (23, 26)
			elsif address_x = 24 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (24, 26)
			elsif address_x = 25 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (25, 26)
			elsif address_x = 26 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (26, 26)
			elsif address_x = 27 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (27, 26)
			elsif address_x = 28 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (28, 26)
			elsif address_x = 29 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (29, 26)
			elsif address_x = 30 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (30, 26)
			elsif address_x = 31 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (31, 26)
			elsif address_x = 32 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (32, 26)
			elsif address_x = 33 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (33, 26)
			elsif address_x = 34 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (34, 26)
			elsif address_x = 35 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (35, 26)
			elsif address_x = 36 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (36, 26)
			elsif address_x = 37 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (37, 26)
			elsif address_x = 38 and address_y = 26 then
				rgb_out <= "000100"; -- Coordinate (38, 26)
			elsif address_x = 39 and address_y = 26 then
				rgb_out <= "001000"; -- Coordinate (39, 26)
			elsif address_x = 0 and address_y = 27 then
				rgb_out <= "001000"; -- Coordinate (0, 27)
			elsif address_x = 1 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (1, 27)
			elsif address_x = 2 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (2, 27)
			elsif address_x = 3 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (3, 27)
			elsif address_x = 4 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (4, 27)
			elsif address_x = 5 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (5, 27)
			elsif address_x = 6 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (6, 27)
			elsif address_x = 7 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (7, 27)
			elsif address_x = 8 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (8, 27)
			elsif address_x = 9 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (9, 27)
			elsif address_x = 10 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (10, 27)
			elsif address_x = 11 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (11, 27)
			elsif address_x = 12 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (12, 27)
			elsif address_x = 13 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (13, 27)
			elsif address_x = 14 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (14, 27)
			elsif address_x = 15 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (15, 27)
			elsif address_x = 16 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (16, 27)
			elsif address_x = 17 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (17, 27)
			elsif address_x = 18 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (18, 27)
			elsif address_x = 19 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (19, 27)
			elsif address_x = 20 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (20, 27)
			elsif address_x = 21 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (21, 27)
			elsif address_x = 22 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (22, 27)
			elsif address_x = 23 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (23, 27)
			elsif address_x = 24 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (24, 27)
			elsif address_x = 25 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (25, 27)
			elsif address_x = 26 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (26, 27)
			elsif address_x = 27 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (27, 27)
			elsif address_x = 28 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (28, 27)
			elsif address_x = 29 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (29, 27)
			elsif address_x = 30 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (30, 27)
			elsif address_x = 31 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (31, 27)
			elsif address_x = 32 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (32, 27)
			elsif address_x = 33 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (33, 27)
			elsif address_x = 34 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (34, 27)
			elsif address_x = 35 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (35, 27)
			elsif address_x = 36 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (36, 27)
			elsif address_x = 37 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (37, 27)
			elsif address_x = 38 and address_y = 27 then
				rgb_out <= "000100"; -- Coordinate (38, 27)
			elsif address_x = 39 and address_y = 27 then
				rgb_out <= "001000"; -- Coordinate (39, 27)
			elsif address_x = 0 and address_y = 28 then
				rgb_out <= "001000"; -- Coordinate (0, 28)
			elsif address_x = 1 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (1, 28)
			elsif address_x = 2 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (2, 28)
			elsif address_x = 3 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (3, 28)
			elsif address_x = 4 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (4, 28)
			elsif address_x = 5 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (5, 28)
			elsif address_x = 6 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (6, 28)
			elsif address_x = 7 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (7, 28)
			elsif address_x = 8 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (8, 28)
			elsif address_x = 9 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (9, 28)
			elsif address_x = 10 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (10, 28)
			elsif address_x = 11 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (11, 28)
			elsif address_x = 12 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (12, 28)
			elsif address_x = 13 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (13, 28)
			elsif address_x = 14 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (14, 28)
			elsif address_x = 15 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (15, 28)
			elsif address_x = 16 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (16, 28)
			elsif address_x = 17 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (17, 28)
			elsif address_x = 18 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (18, 28)
			elsif address_x = 19 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (19, 28)
			elsif address_x = 20 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (20, 28)
			elsif address_x = 21 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (21, 28)
			elsif address_x = 22 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (22, 28)
			elsif address_x = 23 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (23, 28)
			elsif address_x = 24 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (24, 28)
			elsif address_x = 25 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (25, 28)
			elsif address_x = 26 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (26, 28)
			elsif address_x = 27 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (27, 28)
			elsif address_x = 28 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (28, 28)
			elsif address_x = 29 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (29, 28)
			elsif address_x = 30 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (30, 28)
			elsif address_x = 31 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (31, 28)
			elsif address_x = 32 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (32, 28)
			elsif address_x = 33 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (33, 28)
			elsif address_x = 34 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (34, 28)
			elsif address_x = 35 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (35, 28)
			elsif address_x = 36 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (36, 28)
			elsif address_x = 37 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (37, 28)
			elsif address_x = 38 and address_y = 28 then
				rgb_out <= "000100"; -- Coordinate (38, 28)
			elsif address_x = 39 and address_y = 28 then
				rgb_out <= "001000"; -- Coordinate (39, 28)
			elsif address_x = 0 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (0, 29)
			elsif address_x = 1 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (1, 29)
			elsif address_x = 2 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (2, 29)
			elsif address_x = 3 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (3, 29)
			elsif address_x = 4 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (4, 29)
			elsif address_x = 5 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (5, 29)
			elsif address_x = 6 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (6, 29)
			elsif address_x = 7 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (7, 29)
			elsif address_x = 8 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (8, 29)
			elsif address_x = 9 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (9, 29)
			elsif address_x = 10 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (10, 29)
			elsif address_x = 11 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (11, 29)
			elsif address_x = 12 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (12, 29)
			elsif address_x = 13 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (13, 29)
			elsif address_x = 14 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (14, 29)
			elsif address_x = 15 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (15, 29)
			elsif address_x = 16 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (16, 29)
			elsif address_x = 17 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (17, 29)
			elsif address_x = 18 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (18, 29)
			elsif address_x = 19 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (19, 29)
			elsif address_x = 20 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (20, 29)
			elsif address_x = 21 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (21, 29)
			elsif address_x = 22 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (22, 29)
			elsif address_x = 23 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (23, 29)
			elsif address_x = 24 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (24, 29)
			elsif address_x = 25 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (25, 29)
			elsif address_x = 26 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (26, 29)
			elsif address_x = 27 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (27, 29)
			elsif address_x = 28 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (28, 29)
			elsif address_x = 29 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (29, 29)
			elsif address_x = 30 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (30, 29)
			elsif address_x = 31 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (31, 29)
			elsif address_x = 32 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (32, 29)
			elsif address_x = 33 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (33, 29)
			elsif address_x = 34 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (34, 29)
			elsif address_x = 35 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (35, 29)
			elsif address_x = 36 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (36, 29)
			elsif address_x = 37 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (37, 29)
			elsif address_x = 38 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (38, 29)
			elsif address_x = 39 and address_y = 29 then
				rgb_out <= "001000"; -- Coordinate (39, 29)
			else
				rgb_out <= "000000"; -- Default to black
			end if;
		elsif game_state = "10" then 
			-- win screen
		end if;
	end if;
end process;

end synth;
