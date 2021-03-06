Library IEEE;
use IEEE.std_logic_1164.all;
entity VGA is
port(
		VGA_R,VGA_G,VGA_B: out std_logic_vector(7 downto 0);
		VGA_BLANK_N: out std_logic;
		VGA_SYNC_N: out std_logic;
		VGA_HS: out std_logic;
		start: out std_logic;
		VGA_clk: out std_logic;
		VGA_VS: out std_logic;
		horD: in std_logic;
		horI: in std_logic;
		verU: in std_logic;
		verD: in std_logic;
		ver: in std_logic_vector(1 downto 0);
		clk: in std_logic
	);
end VGA;

architecture BeH of VGA is
signal h,v: integer range 0 to 800:=0;
signal Tdisplay: std_logic;
component div_25M is
port(
		clk_in50MM: in std_logic;
		clk_out25M: out std_logic
	);
end component;
signal clk_in50MM: std_logic;
signal d: integer range 0 to 800:=300;
signal A: integer range 0 to 800:=350;
signal i:integer range 0 to 800:=0;
signal o:integer range 0 to 800:=0;
signal clk_out25M: std_logic;
signal x: integer range 0 to 10:=0;
signal y: integer range 0 to 9:=0;
signal Tdispx,Tdispy: std_logic;
begin
	clk_in50MM<= clk;
	U0: div_25M port map(clk_in50MM,clk_out25M);
	VGA_clk<=clk_out25M;
	 VGA_BLANK_N<='1';
	 VGA_SYNC_N<='0';
	 
	process(clk_out25M,h,v,horD)
	begin
		if rising_edge(clk_out25M) then
			h<=h+1;
			if (h<48) then
				VGA_HS<='0';
				Tdispx<='0';
			elsif (h<688) then 
				VGA_HS<='1';
				Tdispx<='1';
				x<=x+1;
			elsif (h<704) then
				VGA_HS<='1';
				Tdispx<='0';
			elsif (h< 800) then
				VGA_HS<='1';
				Tdispx<='0';
				x<=0;
				h<=0;
				v<=v+1;
			end if;
			if (v<48) then
				VGA_VS<='0';
				Tdispy<='0';
			elsif (v<688) then 
				VGA_VS<='1';
				start<=clk_out25M;
				Tdispy<='1';
				y<=y+1;
			elsif (v<704) then
				VGA_VS<='1';
				Tdispy<='0';
			elsif (v< 800) then
				VGA_VS<='0';
				Tdispy<='0';
				y<=0;
				v<=0;
			end if;
		end if;
		Tdisplay<= Tdispx and Tdispy;
		if rising_edge(horD) then
			d<=d+1;
		end if;
		if rising_edge(horI) then
			i<=i+1;
		end if;
		if rising_edge(verU) then
			A<=A+1;
			end if;
		if rising_edge(verD) then
			o<=o+1;
			end if;
		
			if((h>d-i and h<(d+5)-i) or (v>A-o and v<(A+5)-o)) then
					VGA_R<="01111001";
					VGA_G<="00110001";
					VGA_B<="00000000";
				else
					VGA_R <="10010010";
					VGA_G <="00000000";
					VGA_B <="00010101";
			end if;
	end process;
--	process(y, Tdisplay)
--	begin
--		if ((Tdisplay='0')) then
--			VGA_R<="01111001"; --136 ROJO NO MUESTRA CUANDO 1
--			VGA_G<="00110001";
--			VGA_B<="00000000";
--		end if;
--	end process;
end BeH;
		