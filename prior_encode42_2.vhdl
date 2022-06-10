library IEEE;
use ieee.std_logic_1164.all;

entity prior_encode42_2
port(
    r : in std_logic_vector(3 downto 0);
    outta : out std_logic_vector(1 downto 0);
    active : in std_logic
);
end prior_encode42_2;

architecture BeH of prior_encode42_2 is
begin 
process(r)
begin 
case r is 
when "1000"|"1001"|"1010"|"1011"|
"1100"|"1101"|"1110"|"1111" =>
outta <= "11";
when "0100"|"0101"|"0110"|"0111" =>
outta <= "10";
when "0010"|"0011" => 
outta <= "01";
when others =>
outta <= "00"
end case;
end process;
active <= r(3) or r(2) or r(1) or r(0);
end BeH;