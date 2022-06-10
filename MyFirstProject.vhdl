library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    --comentaros--

entity MyFirstProject is
    port(
        a:In STD_LOGIC;
        b:In STD_LOGIC;
        c:In STD_LOGIC;
        c:Out STD_LOGIC

    );
end  MyFirstProject;

architecture BeH of MyFirstProject is
    --signals,constants, components, signal types

    begin
        --Behavior

        d<=(a and b) or (a and c) or (b and c);

    end BeH;