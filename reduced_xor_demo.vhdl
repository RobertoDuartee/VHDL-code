library ieee;
use ieee.std_logic_1164.all;

entity reduced_xor_demo is
port(
    a :  in std_logic_vector(3 downto 0);
    y : out std_logic
);
end reduced_xor_demo;

architecture BeH of reduced_xor_demo is
constant width : integer := 4;
signal tmp : std_logic_vector(width-1 downto 0);

begin
process(a,tmp)
begin 
tmp(0) <= a(0);
for i in 1 to (width-1) loop
tmp(i) <= a(i) xor tmp(i-1); 
end loop;
end process;
y <= tmp(widt-1);
end BeH;
