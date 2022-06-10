library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity simple_alu
port(
    src0,src1 : in std_logic_vector(7 downto 0);
    ctrl: out std_logic_vector(2 downto 0);
    outta : out std_logic_vector(7 donwto 0)
);
end simple_alu;

architecture BeH of simple_alu is 
signal sum,diff,inc : std_logic_vector(7 downto 0);
begin 
inc <= std_logic_vector(signed(src0)+1);
sum <= std_logic_vector(signed(src0)+signed(src1));
diff <= std_logic_vector(signed(src0)-signed(src1));

result <= inc when (ctrl(2) = '0') else
          sum when (ctrl ="100") else
          diff when (ctrl = "101") else
          (src0 and src1) when (ctrl = "110") else
          (src0 or src1)
end BeH;