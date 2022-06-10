library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
port(
    a : in std_logic;
    b : in std_logic;
    cin : in std_logic;
    cout : out syd_logic;
    sum : out std_logic
);
end full_adder;

architecture BeH of full_adder is
signal xor1 : std_logic;
signal and0 : std_logic;
signal and1 : std_logic;

begin 

xor1 <= a xor b;
sum <= cin xor xor1;
and0 <= cin and xor1;
and1 <= a and b;
cout <= and0 or and1;
end BeH;