Library IEEE;
Use IEEE.std_logic_1164.all;
entity Inicializacion is
port(
			E: out std_logic;
			RS:out std_logic;
			RW:out std_logic;
		btn: in std_logic;
		clk_inn: in std_logic;
		fg_finish: out std_logic;
		DB: out std_logic_vector(7 downto 0)
	);
end Inicializacion;
architecture BeH of Inicializacion is
type FSM is(S0,S1,S2,S3,S4,S5);
signal current_state, next_state: FSM;
begin
	process(clk_inn,btn)
	begin
	if (btn='0') then
		if rising_edge(clk_inn) then 
			current_state<=next_state;
		end if;
	end if;
end process;
process(current_state)
begin
	case current_state is 
		when S0 =>
			E<='1';
			RS<='0';
			RW<='0';
			fg_finish<='0';
			DB<="001110--";
			next_state<=S1;
		when S1=>
			E<='0';
			RS<='0';
			RW<='0';
			fg_finish<='0';
			DB<="001110--";
			next_state<=S2;
		when S2=>
			E<='1';
			RS<='0';
			RW<='0';
			fg_finish<='0';
			DB<="00001111";
			next_state<=S3;
		when S3=>
			E<='0';
			RS<='0';
			RW<='0';
			fg_finish<='0';
			DB<="00001111";
			next_state<=S4;
		when S4=>
			E<='1';
			RS<='0';
			RW<='0';
			fg_finish<='0';
			DB<="00000001";
			next_state<=S5;
		when S5=>
			E<='0';
			RS<='0';
			RW<='0';
			fg_finish<='1';
			DB<="00000001";
			next_state<=S0;
		when others=>
			null;
	end case;
end process;	
end BeH;