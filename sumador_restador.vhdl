library ieee;
use ieee.std_logic_1164.all;

entity sumador_restador is 
port(
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    Cin : in std_logic;
    Cout : out std_logic;
    Sum : out std_logic_vector(3 downto 0)
);
end sumador_restador;

architecture BeH of sumador_restador is

component full_adder1 is
port(
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    Cout : out std_logic;
    Sum : out std_logic
);
end component;

signal xor_signal : std_logic_vector(3 downto 0);
signal cout_signal : std_logic_vector(2 downto 0);

begin

xor_signal(0) <= B(0) xor Cin;
xor_signal(1) <= B(1) xor Cin;
xor_signal(2) <= B(2) xor Cin;
xor_signal(3) <= B(3) xor Cin;


U0 : full_adder1 port map (A(0),xor_signal(0),Cin,cout_signal(0),Sum(0));
U1 : full_adder1 port map (A(1),xor_signal(1),Cin,cout_signal(1),Sum(1));
U2 : full_adder1 port map (A(2),xor_signal(2),Cin,cout_signal(2),Sum(2));
U3 : full_adder1 port map (A(3),xor_signal(3),Cin,Cout,Sum(3));

end BeH;