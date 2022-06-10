library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std_logic_unsugned.all;

entity lights is
port(
    clk : in std_logic;
    reset : in std_logic;
    --x : in std_logic;
    z : out std_logic_vector(2 downto 0)
);

Architecture BeH of lights is
type fsm is (S0,S1,S2);
signal current_state,next_state : fsm;

begin 
process(current_state)
begin
case(current_state) is
when S0 => 
z <= "001";

when S1 =>
z <= "010";

when S2 =>
z <= "100";

when others => null;
end case;
end process;

process(clk,reset) begin
if(reset = '1') then 
current_state => S0;
elsif rising_edge(clk) then 
current_state <= next_state;
end if;
end process;




