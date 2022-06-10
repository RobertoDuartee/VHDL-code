library ieee;
use ieee.std_logic_1164.all;

entity Array_Mul_tb is
end Array_Mul_tb;


architecture BeH of Array_Mul_tb is
component Array_Mul is
port(
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    Product : out std_logic_vector(7 downto 0)
);
end component;

signal A,B : std_logic_vector(3 downto 0);
signal Product : std_logic_vector(7 downto 0);


begin

U0 : Array_Mul port map(A=>A,B=>B,Product=>Product);

process
begin

A <= "0001";
B <= "0001";
wait for 200 ns;


A <= "0100";
B <= "1000";
wait for 200 ns;

A <= "0110";
B <= "0001";
wait for 200 ns;


A <= "1000";
B <= "1000";
wait for 200 ns;
end process;
end BeH;


