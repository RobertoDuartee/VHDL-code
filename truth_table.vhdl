library IEEE;
use ieee.std_logic_1164.all;

entity truth_table is
port(
    a,b: in std_logic;
    x : out std_logic
);
end truth_table;

architecture BeH of truth_table is 
signal tmp : std_logic_vector(1 donwto 0);

begin 
with tmp select
x <= "0" when "00",
     "1" when "01",
     "1" when "10",
     "1" when others;
end BeH;