library ieee;
use ieee.std_logic_1164.all;

entity full_adder1 is
port(
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    Cout : out std_logic;
    Sum : out std_logic
);
end full_adder1;

architecture BeH of full_adder1 is
begin

sum <= (A xor B) xor Cin;
Cout <= (A and B) or ((A xor B) and Cin);

end BeH;
