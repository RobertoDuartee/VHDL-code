library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter is
port(
    clk ,reset : in std_logic;
    clr, load, pause :  in std_logic;
    d : in std_logic_vector(3 downto 0);
    q : out std_logic_vector(3 downto 0)
);
end counter;

architecture BeH of counter is 
signal reg : unsigend(3 downto 0);
signal next :  unsigned(3 downto 0);

begin 

process(clk, reset)
begin 
if (reset = '1') then 
reg <= (others => '0');
elsif (clk' event and clk = '1') then
reg <= next;
end if;
end process;

next <= (others => '0') when clr = '1' else
unsigned(d) when load = '1' else
reg + 1  when pause = '1' else
reg;

q <= std_logic_vector(reg);
end BeH;