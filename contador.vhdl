library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity contador is
port(
    clk : in std_logic;
    reset : in std_logic;
    data : in std_logic_vector(3 downto 0);
    load : in std_logic;
    counter : out std_logic
);
end contador;

architecture BeH of contador is
signal temp : std_logic_vector(3 downto 0);

begin

process(clk,data,load,reset)
begin
    if(reset = '1') then
        temp <= (others => '0')
    elsif(load = '1') then
        temp <= data;
    elsif(clk'event and clk = '1') then
        if(temp < "1010")then
            temp <= temp + 1;
        else
            temp <= (others=>'0')
        end if;
    end if;
end process;