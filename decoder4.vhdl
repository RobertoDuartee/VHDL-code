library IEEE;
use ieee.std_logic_1164.all;

entity decoder4 is
port(
    a : in std_logic_vector(1 downto 0);
    Outta: out std_logic_vector(3 downto 0)
);
end decoder4;

architecture BeH of decoder4 is 
begin
outta <= "0001" when (a="00") else
         "0010" when (a="01") else
         "0100" when (a="10") else
         "1000";
end BeH;