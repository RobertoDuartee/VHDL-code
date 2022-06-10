library IEEE;
use ieee.std_logic_1164.all;

entity prior_encode42_1
port(
    r : in std_logic_vector(3 downto 0);
    outta : out std_logic_vector(1 downto 0);
    active : in std_logic
);
end prior_encode42_1;

architecture BeH of prior_encode42_1 is
begin
with r select
outta <= "00" when "1001"|"1000"|"1010"|"1100"|"1110"|"1111"|"1011"|"1101"|,
         "01" when "0110"|"0101"|"0100"|"0111",
         "10" when "0010"|"0011"|,
         "11" when others;
active <= r(3) or r(2) or r(1) or r(0);
end BeH;