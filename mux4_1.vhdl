library IEEE;
use ieee.std_logic_1164.all;

entity mux4_1 is 
port(
    a,b,c,d : in std_logic(7 downto 0);
    x : out std_logic_vector(7 downto 0);
    sel : in std_logic_vector(1 donwto 0)
);
end mux4_1;

architecture BeH of mux4_1 is 
begin 
with sel select
    x <= a when "00",
         b when "01",
         c when "10",
         d when others;
end BeH;