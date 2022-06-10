Library IEEE;
Use IEEE.std_logic_1164.all;
entity mux is
port(
		In0: in std_logic_vector(7 downto 0);
		In1: in std_logic_vector(7 downto 0);
		S: in std_logic;
		O: out std_logic_vector( 7 downto 0)
	);
end mux;
architecture BeH of mux is
begin
	O<= In0 when S='0' else
		In1 when S='1';
end BeH;