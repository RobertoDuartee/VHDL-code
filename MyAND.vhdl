library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    --comentaros--

entity MyAND is
    port(
        a:In STD_LOGIC;
        b:in std_logic;
        c:Out STD_LOGIC

    );
end  MyAND;

architecture BeH of MyAND is
    --signals,constants, components, signal types

    begin
        --Behavior

        c<=(a and b);

    end BeH;