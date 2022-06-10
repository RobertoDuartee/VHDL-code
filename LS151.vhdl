library ieee;
use ieee.std_logic_1164.all;

entity LS151 is
port(
    S : in std_logic_vector(3 downto 0);
    En : in std_logic;
    I : in std_logic_vector(7 downto 0);
    Z : out std_logic;
    notZ : out std_logic
);
end LS151;

architecture BeH of LS151 is
begin

Z <=    I(0) when (sel = "000" and En = "0") else
        I(1) when (sel = "001" and En = "0") else
        I(2) when (sel = "010" and En = "0") else
        I(3) when (sel = "011" and En = "0") else
        I(4) when (sel = "100" and En = "0") else
        I(5) when (sel = "101" and En = "0") else
        I(6) when (sel = "110" and En = "0") else
        I(7);
notZ <= not Z;


end BeH;