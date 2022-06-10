library ieee;
use ieee.std_logic_1164.all;

entity bit_xor is
port(
    a,b :  in std_logic;
    y : out std_logic
);
end bit_xor;

architecture BeH of bit_xor is
constant width : integer := 4;

begin
process(a,b)
begin 
for i in (width-1) downto 0 loop
y(i)  <= a(i) xor b(i);
end loop;
end process;
end BeH;
