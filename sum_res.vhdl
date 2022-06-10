library IEEE;
use ieee.std_logic_1164.all;

entity sum_res is
port(
    A,B : in std_logic_vector(3 downto 0);
    Sout : out std_logic_vector(3 downto 0);
    cin : in std_logic;
    cout : out std_logic
);
end sum_res;

architecture BeH of sum_res is 


signal signal_s : std_logic_vector(3 downto 0);
signal signal_c0 : std_logic_vector(3 downto 0);
signal signal_c1 : std_logic_vector(3 downto 0);
signal signal_Cout : std_logic_vector(2 downto 0);

signal xo0,xo1,xo2,xo3 :  std_logic;

begin 
    
    xo0 <= b(0) xor cin;
    xo1 <= b(1) xor cin;
    xo2 <= b(2) xor cin;
    xo3 <= b(3) xor cin;

    signal_s(0) <= A(0) xor xo0;
    signal_c0(0) <= A(0) and xo0;
    signal_c1(0) <= cin xor signal_s(0);
    signal_Cout(0) <= signal_c0(0) or signal_c1(0);

    signal_s(1) <= A(1) xor xo1;
    signal_c0(1) <= A(1) and xo1;
    signal_c1(1) <= signal_Cout(0) xor signal_s(1);
    signal_Cout(1) <= signal_c0(1) or signal_c1(1);

    signal_s(2) <= A(2) xor xo2;
    signal_c0(2) <= A(2) and xo2;
    signal_c1(2) <= signal_Cout(1) xor signal_s(2);
    signal_Cout(2) <= signal_c0(2) or signal_c1(2);

    signal_s(3) <= A(3) xor xo3;
    signal_c0(3) <= A(3) and xo3;
    signal_c1(3) <= signal_Cout(2) xor signal_s(3);
    
    process(a,b,cin)
    begin
        case cin is 
            when "0" =>
                
                Sout(0) <= cin xor signal_s(0);
                Sout(1) <= signal_Cout(0)  xor signal_s(1);
                Sout(2) <= signal_Cout(1) xor signal_s(2);
                Sout(3) <= signal_Cout(2) xor signal_s(3);
                cout <= signal_c0(3) or signal_c1(3);

            when "1" =>
                if(a < b) then

                
                else
                    Sout(0) <= cin xor signal_s(0);
                    Sout(1) <= signal_Cout(0)  xor signal_s(1);
                    Sout(2) <= signal_Cout(1) xor signal_s(2);
                    Sout(3) <= signal_Cout(2) xor signal_s(3);
                    cout <= signal_c0(3) or signal_c1(3); 
                else 
                others;
                end if;
        end case;
    end process;
end BeH;
