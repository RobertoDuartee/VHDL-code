library ieee;
use ieee.std_logic_1164.all;

entity sumadorBCD is 
port(
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    Cin : in std_logic;
    Cout : out std_logic;
    Sum : out std_logic_vector(3 downto 0);
    HEX1 : out std_logic_vector(6 downto 0)
);
end sumadorBCD;

architecture BeH of sumadorBCD is

signal sum_signal : std_logic_vector(3 downto 0);
signal cout_signal : std_logic_vector(2 downto 0);

component full_adder1 is
port(
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    Cout : out std_logic;
    Sum : out std_logic
);
end component;



begin



U0 : full_adder1 port map (A(0),B(0),Cin,cout_signal(0),Sum(0));
U1 : full_adder1 port map (A(1),B(1),Cin,cout_signal(1),Sum(1));
U2 : full_adder1 port map (A(2),B(2),Cin,cout_signal(2),Sum(2));
U3 : full_adder1 port map (A(3),B(3),Cin,Cout,Sum(3));

sum_signal <= Sum;

process(sum_signal)
    case(sum_signal) is
        when "0000" =>
            HEX1 <= "1000000";
            when "0001" =>
            HEX1 <= "1111001";
            when "0010" =>
            HEX1 <= "0100100";
            when "0011" =>
            HEX1 <= "0110000";
            when "0100" =>
            HEX1 <= "0011001";
            when "0101" =>
            HEX1 <= "0010010";
            when "0110" =>
            HEX1 <= "0000010";
            when "0111" =>
            HEX1 <= "1111000";
            when "1000" =>
            HEX1 <= "0000000";
            when "1001" =>
            HEX1 <= "0011000";
            when others =>
            null;
            end case;
        end process;




end BeH;