library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity top is 
	port(
		HSYNC_top: out std_logic;
		VSYNC_top: out std_logic;
		RGB: out unsigned(5 downto 0);
		ref_clk_i_top: in std_logic;
		sda: inout std_logic;
		scl: inout std_logic;
		nunchuck_clk: in std_logic;
		club_clk: in std_logic;
		reset_n: in std_logic;
		gc: out std_logic;
		current_d_state: inout std_logic_vector(1 downto 0)
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
	signal tile_address: unsigned(11 downto 0);
	signal rgb_s: unsigned(5 downto 0);
	signal rgb_b: unsigned(5 downto 0);
	signal rgb_c: unsigned(5 downto 0);
	signal ball_x : unsigned(9 downto 0):= "0000000000";
	signal ball_y : unsigned(9 downto 0):= "0000000000";
	signal game_state: std_logic_vector(1 downto 0):= "00";
	signal club_graphics: unsigned(1 downto 0);
	
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
			tile     : out unsigned(11 downto 0)      
		);
	end component;
	
	component pixel_tile is
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
	end component;
	
	component golfball_finder is
		port(
			clk         : in  std_logic;             
			valid       : in  std_logic;                
			address_x   : in  unsigned(9 downto 0);  
			address_y   : in  unsigned(9 downto 0);    	
			ball_x : in unsigned(9 downto 0);
			ball_y : in unsigned(9 downto 0);
			rgb_b     : out unsigned(5 downto 0)      
		);
	end component;
	
	component club_display is
	  port(
		clk         : in  std_logic;             
		valid       : in  std_logic;                
		address_x   : in  unsigned(9 downto 0);  
		address_y   : in  unsigned(9 downto 0);
		clubs: in std_logic_vector(1 downto 0);
		rgb_c     : out unsigned(5 downto 0)      
	  );
	end component;
	
	--signal game_clock_top: std_logic;
	
	--component game_clock is 
	--port(
		--clk: in std_logic;
		--rows: in unsigned(9 downto 0);
		--columns: in unsigned(9 downto 0);
		--game_clock: out std_logic
	--); 
	--end component;
	
	
	component game_logic IS
		port (
			clk: IN std_logic;
			reset_n: IN std_logic;
			sda: INOUT STD_LOGIC;
			scl: INOUT STD_LOGIC;
			--ball_x: INOUT unsigned(9 downto 0);
			--ball_y: INOUT unsigned(9 downto 0);
			swing_speed: OUT std_logic_vector(1 Downto 0);
			current_d_state: OUT std_logic_vector(1 Downto 0);
			current_c_state: OUT std_logic_vector(1 Downto 0)
		);
	end component;
	
	signal out_speed: std_logic_vector(1 downto 0);
	--signal current_d_state: std_logic_vector(1 downto 0);
	signal current_c_state: std_logic_vector(1 downto 0);
	
	signal select_btn_top: std_logic := '0';
	
	component club_select is
		port (
			clk: in std_logic; -- game clock
			swing_speed	: in std_logic_vector(1 DOWNTO 0); -- high/med/low
			-- 00 is high, 10 is medium, 10 is high
			current_d_state: in std_logic_vector(1 Downto 0); -- direction
			current_c_state: in std_logic_vector(1 Downto 0); -- club
			ball_x: INOUT unsigned(9 downto 0);
			ball_y: INOUT unsigned(9 downto 0)
		);
	end component;
	
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
			row => rc,
			column => cc,
			game_state => game_state,
			club_state => current_c_state,
			rgb_s => rgb_s
		);	
		
	golfball_finder1: golfball_finder
		port map(
			clk => outglobal_o_top,             
			valid => valid_top,          
			address_x => cc,
			address_y => rc,
			ball_x => ball_x,
			ball_y => ball_y,
			rgb_b => rgb_b 
		);
	
	club_display1: club_display
		port map(
			clk => outglobal_o_top,        
			valid => valid_top,             
			address_x => cc,
			address_y => rc,
			clubs => current_c_state,
			rgb_c => rgb_c 
		);
	
	--game_clock1: game_clock
		--port map(
			--clk => outglobal_o_top,
			--rows => rc,
			--columns => cc,
			--game_clock => game_clock_top
			--);
			
	game_logic1: game_logic
	port map(
		clk => nunchuck_clk,
		reset_n => reset_n,
		sda => sda,
		scl => scl,
		--ball_x => ball_x;
		--ball_y => ball_y;
		swing_speed => out_speed,
		current_d_state => current_d_state,
		current_c_state => current_c_state
	);
	
	
	club_select1: club_select
		port map(
			clk => club_clk,
			swing_speed => out_speed,
			current_d_state => current_d_state,
			current_c_state => current_c_state,
			ball_x => ball_x,
			ball_y => ball_y	
		);
			
		

	RGB <= "111111" when rgb_b = "111111" else 
		"111111" when rgb_c = "111111" else 
		rgb_s;

end; 