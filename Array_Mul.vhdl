library ieee;
use ieee.std_logic_1164.all;

entity Array_Mul is
port(
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    Product : out std_logic_vector(7 downto 0)
);
end Array_Mul;


architecture BeH of Array_Mul is

--FULL ADDER
component full_adder1 is
port(
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    Cout : out std_logic;
    Sum : out std_logic
);
end component;

--HALF ADDER
component Half_Adder1 is
    port(
        A : in std_logic;
        B : in std_logic;
        Cout : out std_logic;
        Sum : out std_logic
    );
end component;

--FIRST ARRAY SIGNALS
signal c1 : std_logic_vector(2 downto 0);
signal s1 : std_logic_vector(2 downto 0);
signal mul1 : std_logic_vector(5 downto 0);

--SECOND ARRAY SIGNALS
signal c2 : std_logic_vector(2 downto 0);
signal s2 : std_logic_vector(2 downto 0);
signal mul2 : std_logic_vector(2 downto 0);

--THIRD ARRAY SIGNALS
signal c3 : std_logic_vector(2 downto 0);
signal s3 : std_logic_vector(2 downto 0);
signal mul3 : std_logic_vector(2 downto 0);

--FOURTH ARRAY SIGNALS
signal c4 : std_logic_vector(2 downto 0);
signal s4 : std_logic_vector(2 downto 0);
signal mul4 : std_logic_vector(2 downto 0);

begin
--FIRST LINE OPERATIONS
Product(0) <= A(0) and B(0);
    --first hallf-adder
mul1(0) <= A(1) and B(0);
mul1(1) <= A(0) and B(1);
U0 : Half_Adder1 port map(mul1(0),mul1(1),c1(0),s1(0));
Product(1) <= s1(0);
    --second full-adder
mul1(2) <= A(1) and B(1);
mul1(3) <= A(2) and B(0);
U1 : full_adder1 port map(mul1(2),mul1(3),c1(0),c1(1),s1(1));
    --third full-adder
mul1(4) <= A(3) and B(0);
mul1(5) <= A(2) and B(1);
U2 : full_adder1 port map(mul1(4),mul1(5),c1(1),c1(2),s1(2));

--SECOND LINE OPERATIONS
    --first half-adder
mul2(0) <= A(0) and B(2);
U3 : Half_Adder1 port map(mul2(0),s1(1),c2(0),s2(0));
Product(2) <= s1(0);
    --second half-adder
mul2(1) <= A(1) and B(2);
U4 : full_adder1 port map(mul2(1),s1(2),c2(0),c2(1),s2(1));
    --third half-adder
mul2(2) <= A(2) and B(1);
U5 : full_adder1 port map(mul2(2),c1(2),c2(1),c2(2),s2(2));

--THIRD LINE OPERATIONS
    --first half-adder
mul3(0) <= A(0) and B(3);
U6 : Half_Adder1 port map(mul3(0),s2(1),c3(0),s3(0));
Product(3) <= s3(0);
    --second half-adder
mul3(1) <= A(2) and B(2);
U7 : full_adder1 port map(mul3(1),s2(2),c3(0),c3(1),s3(1));
    --third half-adder
mul3(2) <= A(3) and B(2);
U8 : full_adder1 port map(mul3(2),c2(2),c3(1),c3(2),s3(2));

--FOURTH LINE OPERATIONS
    --first half-adder
mul4(0) <= A(1) and B(3);
U9 : Half_Adder1 port map(mul4(0),s3(1),c4(0),s4(0));
Product(4) <= s4(0);
    --second half-adder
mul4(1) <= A(2) and B(3);
U10 : full_adder1 port map(mul4(1),s3(2),c4(0),c4(1),s4(1));
Product(5) <= s4(1);
    --thir half-adder
mul4(2) <= A(3) and B(3);
U11 : full_adder1 port map(mul4(2),c3(2),c4(1),c4(2),s4(2));
Product(6) <= s4(2);
Product(7) <= c4(2);
end BeH;
