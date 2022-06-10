library ieee;
use ieee.std_logic_1164.all;

entity Sum_Ant is
port(
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    Cin : in std_logic;
    Cout : out std_logic;
    Sum : out std_logic_vector(3 downto 0)
);
end Sum_Ant;

architecture BeH of Sum_Ant is
component full_adder1 is
port(
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    Cout : out std_logic;
    Sum : out std_logic
);
end component;

signal signalCout : std_logic_vector(3 downto 0);
signal signalCin : std_logic_vector(3 downto 0);
signal Cg : std_logic_vector(3 downto 0);
signal Cp : std_logic_vector(3 downto 0);
signal CoutX : std_logic_vector(3 downto 0);

begin
Cg(0) <= A(0) and B(0);
Cg(1) <= A(1) and B(1);
Cg(2) <= A(2) and B(2);
Cg(3) <= A(3) and B(3);

Cp(0) <= A(0) or B(0);
Cp(1) <= A(1) or B(1);
Cp(2) <= A(2) or B(2);
Cp(3) <= A(3) or B(3);


--FIRST FULL-ADDER
signalCout(0) <= Cg(0) or (Cp(0) and Cin);

--SECOND FULL-ADDERS
signalCin(0) <= signalCout(0);
signalCout(1) <= Cg(1) or (Cp(1) and signalCin(0));

--THIRD FULL-ADDERS
signalCin(1) <= signalCout(1);
signalCout(2) <= Cg(2) or (Cp(2) and signalCin(1));

--FOURTH FULL-ADDERS
signalCin(2) <= signalCout(2);
Cout <= Cg(3) or (Cp(3) and signalCin(2));

--4 BIT ADDER
U0 : full_adder1 port map(A(0),B(0),Cin,signalCout(0),Sum(0));
U1 : full_adder1 port map(A(1),B(1),signalCin(0),signalCout(1),Sum(1));
U2 : full_adder1 port map(A(2),B(2),signalCin(1),signalCout(2),Sum(2));
U3 : full_adder1 port map(A(3),B(3),signalCin(2),Cout,Sum(3));

end BeH;




