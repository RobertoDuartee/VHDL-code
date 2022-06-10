library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE IEEE.NUMERIC_STD.ALL;

entity div_25M is
	port(
		clk_in50MM: in std_logic;
		clk_out25M: out std_logic
		);
end div_25M;

architecture BeH of div_25M is
signal counter: integer;
signal clk_reg: std_logic;
begin
	clk_out25M<=clk_reg;
	process(clk_reg,counter,clk_in50MM)
	begin
	if rising_edge(clk_in50MM) then
			clk_reg<= not clk_reg;
			counter<= counter + 1;
	end if;
	end process;
end BeH;