library ieee;
use ieee.std_logic_1164.all;

entity 74138 is
port(
  A : in std_logic_vector(2 downto 0);
  Out : in std_logic_vector(7 downto 0);
  En : in std_logic_vector(2 downto 0);
);
end 74138

architecture BeH of 74138 is

with A select 
Out <=  "00000001" when ("000" and En = "001"),
        "00000010" when ("001" and En = "001"),
        "00000100" when ("010" and En = "001"),
        "00001000" when ("011" and En = "001"),
        "00010000" when ("100" and En = "001"),
        "00100000" when ("101" and En = "001"),
        "01000000" when ("110" and En = "001"),
        "10000000" when ("111" and En = "001"),
        "00000000" when others;
        
end BeH
