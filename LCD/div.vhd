library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
USE IEEE.NUMERIC_STD.ALL;

entity div is
	port(
		clk_in50MM: in std_logic;
		clk_out1k: out std_logic
		);
end div;

architecture BeH of div is
signal counter: integer;
signal clk_reg: std_logic;
begin
	clk_out1k<=clk_reg;
	process(clk_reg,counter,clk_in50MM)
	begin
	if rising_edge(clk_in50MM) then
		if(counter=24999) then
			clk_reg<= not clk_reg;
			counter<=0;
		else
			counter<= counter + 1;
			clk_reg<= clk_reg;
		end if;
	end if;
	end process;
end BeH;