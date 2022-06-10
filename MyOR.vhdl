library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    --comentaros--

entity MyOR is
    port(
        a:In STD_LOGIC;
        b:in std_logic;
        c:Out STD_LOGIC

    );
end  MyOR;

architecture BeH of MyOR is
    --signals,constants, components, signal types

    begin
        --Behavior

        c<=(a or b);

    end BeH;