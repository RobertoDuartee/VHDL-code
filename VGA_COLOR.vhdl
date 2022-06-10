library ieee;
use ieee.std_logic_1164.all;

entity VGA_COLOR_FINAL is
port(
    ROW1 : in integer;
    COLUMN1 : in integer;
    VGA_R1 : out std_logic_vector(7 downto 0);
    VGA_G1 : out std_logic_vector(7 downto 0);
    VGA_B1 : out std_logic_vector(7 downto 0);
    DISP1 : in std_logic
);
end VGA_COLOR_FINAL;

architecture BeH of VGA_COLOR_FINAL is

begin
    process(ROW1,COLUMN1,DISP1)
    begin
        if(DISP1 = '0') then
            VGA_R1 <= (others => '0');
            VGA_G1 <= (others => '0');
            VGA_B1 <= (others => '0');
        else
            if((ROW1 < 297 or ROW1 >= 303)  AND (COLUMN1 < 238 or COLUMN1 >= 242)) then
                VGA_R1 <= "01001100";
                VGA_G1 <= "11011001";
                VGA_B1 <= "11110001";
            else
                VGA_R1 <= (others => '0');
                VGA_G1 <= (others => '0');
                VGA_B1 <= (others => '0');
            end if;
        end if;
    end process;
end BeH;


