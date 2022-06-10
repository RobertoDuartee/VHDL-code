library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
 
entity Decoder38_2 is
   port
   (Enable : in std_logic;
        In_vec : in std_logic_vector(2 downto 0);
        Out_vec : out std_logic_vector(7 downto 0));
end Decoder38_2;
 
architecture BeH of Decoder38_2 is
begin
   
   Out_vec <= "11111111" when E='0' else
        "11111110" when Enable='1' and In_vec="000" else
        "11111101" when Enable='1' and In_vec="001" else
        "11111011" when Enable='1' and In_vec="010" else
        "11110111" when Enable='1' and In_vec="011" else
        "11101111" when Enable='1' and In_vec="100" else
        "11011111" when Enable='1' and In_vec="101" else
        "10111111" when Enable='1' and In_vec="110" else
        "01111111" when Enable='1' and In_vec="111";

end BeH;