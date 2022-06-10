library IEEE;
use ieee.std_logic_1164.all;

entity And3_tb is
end And3_tb;

architecture BeH of And3_tb is 
component And3
port(
    a : in std_logic_vector(1 downto 0);
    x : out std_logic
);
end component;

signal a : std_logic_vector(1 downto 0);
signal x : std_logic;

begin 
uut : And3
port map(a => a, x => x);

process
begin 
    x <= "00"
    wait for 200 ns;
    x <= "01";
    wait for 200 ns;
    x <= "10";
    wait for 200 ns;
    x <= "11";
    wait foe 200 ns;
end process;
end BeH;