library ieee;
use ieee.std_logic_1164.all;

entity Sum_Ant_tb is
end Sum_Ant_tb;



architecture BeH of Sum_Ant_tb is

    component Sum_Ant is
        port(
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            Cout : out std_logic;
            Sum : out std_logic_vector(3 downto 0)
        );
        end component;

signal A,B,Sum : std_logic_vector(3 downto 0);
signal Cin : std_logic;
signal Cout : std_logic;

begin

U0 : Sum_Ant port map(A=>A,B=>B,Cin=>Cin,Cout=>Cout,Sum=>Sum);

process
begin
Cin <= '0';
A <= "0001";
B <= "0001";
wait for 200 ns;

Cin <= '0';
A <= "0100";
B <= "1000";
wait for 200 ns;

Cin <= '0';
A <= "0110";
B <= "0001";
wait for 200 ns;

Cin <= '0';
A <= "1000";
B <= "1000";
wait for 200 ns;
end process;
end BeH;