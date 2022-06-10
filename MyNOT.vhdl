library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    --comentaros--

entity MyNOT is
    port(
        a:In STD_LOGIC;
        b:Out STD_LOGIC

    );
end  MyNOT;

architecture BeH of MyNOT is
    --signals,constants, components, signal types

    begin
        --Behavior

        b <= not a;

    end BeH;