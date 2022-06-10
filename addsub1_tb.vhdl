library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addsub1_tb is
end addsub1_tb;

architecture BeH of addsub1_tb is
component addsub1
port(
    a : in std_logic_vector(4 downto 0);
    b : in std_logic_vector(4 downto 0);
    r : out std_logic_vector(4 downto 0);
    ctrl : in std_logic
);
end component;

signal a : std_logic_vector(4 downto 0);
signal b : std_logic_vector(4 downto 0);
signal r : std_logic_vector(4 downto 0);
signal ctrl : std_logic;

begin
uut : addsub1 port map(a => a,b => b, r => r, ctrl =>ctrl);

process
begin 
a <= "01100";
b <= "00110";
ctrl <= '0';
wait for 160 ns;

a <= "00001";
b <= "01010";
ctrl <= '1';
wait for 240 ns;

a <= "01000";
b <= "00011";
ctrl <= '1';
wait for 60 ns;

end process;
end BeH;
