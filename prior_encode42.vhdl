library IEEE;
use ieee.std_logic_1164.all;

entity prior_encode42
port(
    r : in std_logic_vector(3 downto 0);
    outta : out std_logic_vector(1 downto 0);
    active : in std_logic
);
end prior_encode42;

architecture BeH of prior_encode42 is
outta <= "00" when (r(3) = '1') else
         "01" when (r(2) = '1') else
         "10" when (r(1) = '1') else
         "11";
active <= r(3) or r(2) or r(1) or r(0);
end BeH;