Library IEEE;
Use IEEE.std_logic_1164.all;
entity Main is
port (
		enn: out std_logic;
		pro: out std_logic;
		rewr: out std_logic;
		rrs: out std_logic;
		boton: in std_logic;
		seleccion: in std_logic;
		txt: out std_logic_vector(7 downto 0);
		clk_50M: in std_logic
	);
end Main;

architecture BeH of Main is
component div is
port(
		clk_in50MM: in std_logic;
		clk_out1k: out std_logic
	);
end component;
signal clk_in50MM: std_logic;
signal clk_out1k: std_logic;

component Escritura is
port(
		start: in std_logic;
		en,rss,rww: out std_logic;
		salida: out std_logic_vector(7 downto 0);
		clk_e: in std_logic
	);
end component;
signal en,rss,rww:std_logic;
signal salida: std_logic_vector(7 downto 0);
signal clk_e: std_logic;
signal start: std_logic;
component Inicializacion is
port(
			E: out std_logic;
			RS:out std_logic;
			RW:out std_logic;
		btn: in std_logic;
		clk_inn: in std_logic;
		fg_finish: out std_logic;
		DB: out std_logic_vector(7 downto 0)
	);
end component;
signal E: std_logic;
signal RS: std_logic;
signal RW: std_logic;
signal btn: std_logic;
signal clk_inn: std_logic;
signal fg_finish: std_logic;
signal DB: std_logic_vector(7 downto 0);

component mux is
port(
		In0: in std_logic_vector(7 downto 0);
		In1: in std_logic_vector(7 downto 0);
		S: in std_logic;
		O: out std_logic_vector( 7 downto 0)
	);
end component;
signal In0: std_logic_vector(7 downto 0);
signal In1: std_logic_vector(7 downto 0);
signal S: std_logic;
signal O: std_logic_vector(7 downto 0);

begin
	clk_in50MM<= clk_50M;
	U0:div port map(clk_in50MM,clk_out1k);
	
	btn<=boton;
	clk_inn<=clk_out1k;
	pro<=clk_out1k;
	U1: Inicializacion port map(E,RS,RW,btn,clk_inn,fg_finish,DB);
	
	start<=fg_finish;
	clk_e<=clk_out1k;
	U2: Escritura port map(start,en,rss,rww,salida,clk_e);
	
	In0<= DB;
	In1<=salida;
	S<=seleccion;
	U3: mux port map(In0,In1,S,O);
	
	txt<=O;
	
	process(seleccion)
	begin
		if seleccion='0' then
			enn<= E;
			rewr<= RW;
			rrs<= RS;
		else
			enn<=en;
			rewr<=rww;
			rrs<=rss;
		end if;
	end process;
	
end BeH;