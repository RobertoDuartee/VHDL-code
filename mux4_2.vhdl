library IEEE;
use ieee.std_logic_1164.all;

-- MULTIPLEXER BASED ON A CASE STATEMENT
entity mux4_2 is 
port(
    a,b,c,d : in std_logic(7 downto 0);
    x : out std_logic_vector(7 downto 0);
    sel : in std_logic_vector(1 donwto 0)
);
end mux4_2;

architecture BeH of mux4_2 is 
begin 
    process(a,b,c,d,sel)
    begin
       case sel is
            when "00" =>
                x <= a;
            when "01" =>
                x <= b;
            when "10" =>
                x <= c;
            when others =>
                x <= d;
       end case;
    end process
end BeH;