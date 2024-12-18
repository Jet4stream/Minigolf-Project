library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is 
	port(
		HSYNC_top: out std_logic;
		VSYNC_top: out std_logic;
		RGB: out unsigned(5 downto 0);
		ref_clk_i_top: in std_logic;
		gc: out std_logic
	); 
end;

architecture synth of top is
	signal count: unsigned(25 downto 0);
	signal first_time: std_logic := '0';
	signal outcore_o_top: std_logic;
	signal outglobal_o_top: std_logic;
	signal cc: unsigned(9 downto 0);
	signal rc: unsigned(9 downto 0);	
	signal valid_top: std_logic;
	signal tile_address: unsigned(9 downto 0);
	signal rgb_s: unsigned(5 downto 0);
	signal rgb_b: unsigned(5 downto 0);
	
	component mypll is
    port(
        ref_clk_i: in std_logic;
        rst_n_i: in std_logic;
        outcore_o: out std_logic;
        outglobal_o: out std_logic
    );
	end component;

	signal clk: std_logic;
	
	component vga is
		port(
			clock: in std_logic;
			VSYNC: out std_logic;
			HSYNC: out std_logic;
			column_counter: out unsigned(9 downto 0);
			row_counter: out unsigned(9 downto 0);
			valid_vga: out std_logic
		);
	end component;
	
	component tile_finder is
		port(
			clk         : in  std_logic;             
			address_x   : in  unsigned(9 downto 0);    
			address_y   : in  unsigned(9 downto 0);     
			tile     : out unsigned(9 downto 0)      
		);
	end component;
	
	component pixel_tile is
		port(
			clk         : in  std_logic;             
			valid       : in  std_logic;                
			address   : in  unsigned(9 downto 0);    
			rgb_s     : out unsigned(5 downto 0)      
		  );
	end component;
	
	component golfball_finder is
		port(
			clk         : in  std_logic;             
			valid       : in  std_logic;                
			address   : in  unsigned(9 downto 0);    
			rgb_b     : out unsigned(5 downto 0)      
		);
	end component;
	
	signal game_clock_top: std_logic;
	
	component game_clock is 
	port(
		rows: in unsigned(9 downto 0);
		columns: in unsigned(9 downto 0);
		game_clock: out std_logic
	); 
	end component;
	
	signal select_btn_top: std_logic := '0';
	
begin
	
	pll : mypll 
		port map(
			ref_clk_i => ref_clk_i_top,
			rst_n_i => '1',
			outcore_o => outcore_o_top,
			outglobal_o => outglobal_o_top
		);
	
	vga1: vga
		port map(
			clock => outglobal_o_top,
			VSYNC => VSYNC_top,
			HSYNC => HSYNC_top,
			column_counter => cc,
			row_counter => rc,
			valid_vga => valid_top
		);
		
	--game_renderer1: game_renderer
		--port map( 
			--clk => outglobal_o_top,           
			--reset => valid_top,               
			--address_x => cc, 
			--address_y => rc,    
			--rgb_out => RGB
		--);
		
	
	tile_finder1: tile_finder
		port map(
			clk => outglobal_o_top,
			address_x => cc,
			address_y => rc,
			tile => tile_address     
		);
	
	pixel_tile1: pixel_tile
		port map(
			clk => outglobal_o_top,            
			valid => valid_top,
			address =>  tile_address,
			rgb_s => rgb_s    
		);	
		
	golfball_finder1: golfball_finder
		port map(
			clk => outglobal_o_top,             
			valid => valid_top,              
			address => tile_address, 
			rgb_b => rgb_b     
		);
		
	game_clock1: game_clock
		port map(
			rows => rc,
			columns => cc,
			game_clock => game_clock_top
			);
			
	gc <= game_clock_top;
	
	RGB <= "111111" when rgb_b = "111111" else rgb_s;

end; 
