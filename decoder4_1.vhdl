library IEEE;
use ieee.std_logic_1164.all;

entity decoder4_1 is
port(
    a : in std_logic_vector(1 downto 0);
    Outta: out std_logic_vector(3 downto 0)
);
end decoder4_1;

architecture BeH of decoder4_1 is 
begin
with a select
outta <= "0001" when "00",
         "0010" when "01",
         "0100" when "10",
         "1000" when others;
end BeH;