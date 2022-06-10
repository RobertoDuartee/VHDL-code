library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
entity decoder38 is
 port(
 In_vec : in STD_LOGIC_VECTOR(2 downto 0);
 Out_vec : out STD_LOGIC_VECTOR(7 downto 0)
 );
end decoder38;
 
architecture BeH of decoder38 is
begin
 
Out_vec(0)  <= not  In_vec(0) and not  In_vec(1) and not In_vec(2);
Out_vec(1)  <= not  In_vec(0) and not  In_vec(1) and In_vec(2);
Out_vec(2)  <= not  In_vec(0) and In_vec(1) and not In_vec(2);
Out_vec(3)  <= not  In_vec(0) and In_vec(1) and In_vec(2);
Out_vec(4)  <= In_vec(0) and not  In_vec(1) and not In_vec(2);
Out_vec(5)  <= In_vec(0) and not  In_vec(1) and In_vect(2);
Out_vec(6)  <= In_vec(0) and In_vec(1) and not In_vec(2);
Out_vec(7)  <= In_vec(0) and In_vec(1) and In_vec(2);
 
end BeH;
