library ieee;
use ieee.std_logic_1164.all;

entity Half_Adder1 is
port(
    A : in std_logic;
    B : in std_logic;
    Cout : out std_logic;
    Sum : out std_logic
);
end Half_Adder1;

architecture BeH of Half_Adder1 is
begin

sum <= A xor B;
Cout <= A and B;

end BeH;