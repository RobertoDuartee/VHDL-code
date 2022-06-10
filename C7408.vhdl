library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity C7408 is
    port(
        in0: in std_logic;
        in1: in std_logic;
        in2: in std_logic;
        in3: in std_logic;
        in4: in std_logic;
        in5: in std_logic;
        in6: in std_logic;
        in7: in std_logic;
        out0: out std_logic;
        out1: out std_logic;
        out3: out std_logic;
        out4: out std_logic
    );
end;

architecture BeH of C7408 is
    
    component MyAND is
        port(
            a:In STD_LOGIC;
            b:in std_logic;
            c:Out STD_LOGIC
    
        );
    end  component;

    begin
        U0: MyAND port map(in0,in1,out0);
        U1: MyAND port map(in2,in3,out1);
        U2: MyAND port map(in4,in5,out2);
        U3: MyAND port map(in6,in7,out3);
    end BeH;