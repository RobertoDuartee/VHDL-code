library IEEE;
    use IEEE.STD_LOGIC_1164.all;
    --comentaros--

entity StructuralComponent is
    port(
        door: in std_logic;
        ignition: in std_logic;
        sbelt: in std_logic;
        swarning: out std_logic
     
    );
end  StructuralComponent;

architecture BeH of StructuralComponent is
    --signals,constants, components, signal types
    signal door_not: std_logic := '0';
    signal sbelt_not: std_logic;
    signal s1_and: std_logic;
    signal s2_and: std_logic;

    component MyAND is
        port(
            a:In STD_LOGIC;
            b:in std_logic;
            c:Out STD_LOGIC
    
        );
    end  component;

    component MyOR is
        port(
            a:In STD_LOGIC;
            b:in std_logic;
            c:Out STD_LOGIC
    
        );
    end  component;

    component MyNOT is
        port(
            a:In STD_LOGIC;
            b:Out STD_LOGIC
    
        );
    end  component;


    begin
        --Behavior
        U0: MyNOT port map(door,door_not);
        U1: MyNOt port map(sbelt,sbelt_not);
        U2: MyAND port map(door_not,ignition,s1);
        U3: MyAND port map(sbelt_not,ignition,s2);
        U4: MyOR port map(s1_and,s2_and,swarning);



    end BeH;