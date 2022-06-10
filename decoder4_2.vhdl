library ieee;
use ieee.std_logic_1164.all;

entity decoder4_2 is
port(
    a : in std_logic_vector(1 downto 0);
    Outta: out std_logic_vector(3 downto 0)
);
end decoder4_2;

architecture BeH of decoder4_2 is 
begin
    process(a)
    begin 
    case s is
        when "00" => 
            x <= "0001";
        when "01" => 
            x <= "0010";
        when "10" => 
            x <= "0100";
        when others => 
            x <= "1000";
        end case;
    end process;
end BeH;