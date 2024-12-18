library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vga is 
	port(
		clock: in std_logic;
		VSYNC: out std_logic;
		HSYNC: out std_logic;
		column_counter: out unsigned(9 downto 0);
		row_counter: out unsigned(9 downto 0);
		valid_vga: out std_logic
	); 
end;

architecture synth of vga is
signal col_count: unsigned(9 downto 0) := "0000000000";
signal row_count: unsigned(9 downto 0) := "0000000000";
signal first_time: std_logic := '0';
begin 
--col_count <= "0000000000";
--row_count <= "0000000000";

process (clock) begin
	if (rising_edge(clock)) then 
		--if (first_time = '0') then
			--col_count <= "0000000000";
			--row_count <= "0000000000";
			--first_time <= '1';
		--elsif (col_count = 799) then
			--col_count <= "0000000000";
			--if (row_count = 524) then
				--row_count <= "0000000000";
			--else
				--row_count <= row_count + 1;
			--end if;
		--else 
			--col_count <= col_count + 1;
		--end if;
		if col_count = 799 then
			row_count <= row_count + 1;
			col_count <= "0000000000";
		elsif row_count = 524 then 
			row_count <= "0000000000";
			col_count <= "0000000000";
		else
			col_count <= col_count + 1;
		end if;
	end if; 
end process; 

column_counter <= col_count;
row_counter <= row_count;
valid_vga <= '1' when (col_count < 640 and row_count < 480) else '0';


HSYNC <= '1' when (col_count < 656 or col_count >= 752) else '0';
VSYNC <= '1' when (row_count < 489 or row_count >= 491) else '0';

end;