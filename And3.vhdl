library IEEE;
use ieee.std_logic_1164.all;

entity And3 is
port(
    a,b : in std_logic;
    x : out std_logic
);
end And3;

architecture BeH of And3 is 
begin 
    x <= a and b;
end BeH;