Library IEEE;
Use IEEE.std_logic_1164.all;
entity Escritura is
port(
		start: in std_logic;
		en,rss,rww: out std_logic;
		salida: out std_logic_vector(7 downto 0);
		clk_e: in std_logic
	);
end Escritura;
architecture BeH of Escritura is
	type FSM is(S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12,S13);
	signal current_state, next_state: FSM;
begin
	process(clk_e)
	begin
		if (start='1') then
		if rising_edge(clk_e) then 
			current_state<=next_state;
		end if;
		end if;
end process;

process(current_state)
begin
	case current_state is 
		when S0=>
			en<='1';
			rss<='0';
			rww<='0';
			salida<="11000000";
			next_state<=S1;
		when S1=>
			en<='0';
			rss<='0';
			rww<='0';
			salida<="11000000";
			next_state<=S2;
		when S2=>
			en<='1';
			rss<='1';
			rww<='0';
			salida<="01000001";
			next_state<=S3;
		when S3=>
			en<='0';
			rss<='1';
			rww<='0';
			salida<="01000001";
			next_state<=S4;
		when S4=>
			en<='1';
			rss<='1';
			rww<='0';
			salida<="01010011";
			next_state<=S5;
		when S5=>
			en<='0';
			rss<='1';
			rww<='0';
			salida<="01010011";
			next_state<=S6;
		when S6=>
			en<='1';
			rss<='1';
			rww<='0';
			salida<="01001010";
			next_state<=S7;
		when S7=>
			en<='0';
			rss<='1';
			rww<='0';
			salida<="01001010";
			next_state<=S8;
		when S8=>
			en<='1';
			rss<='1';
			rww<='0';
			salida<="01000001";
			next_state<=S9;
		when S9=>
			en<='0';
			rss<='1';
			rww<='0';
			salida<="01000001";
			next_state<=S10;
		when S10=>
			en<='1';
			rss<='1';
			rww<='0';
			salida<="01010011";
			next_state<=S11;
		when S11=>
			en<='0';
			rss<='1';
			rww<='0';
			salida<="01010011";
			next_state<=S12;
		when S12=>
			en<='1';
			rss<='1';
			rww<='0';
			salida<="01001010";
			next_state<=S13;
		when S13=>
			en<='0';
			rss<='1';
			rww<='0';
			salida<="01001010";
			next_state<=S0;
		when others=>
			null;
	end case;
end process;	
end BeH;
