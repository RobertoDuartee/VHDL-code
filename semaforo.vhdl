library ieee;
use ieeestd_logic_1164.all;

entity semaforo is 
port(
    clk : in std_logic;
    reset : in std_logic;
    red : out std_logic;
    green : out std_logic;
    yellow : in std_logic
);
end semaforo;

architecture BeH of semaforo is

constant max : integer := 50000000;
signal counter : integer range 0 to max;
signal counter2 : integer range 0 to 29
signal clk_out : std_logic := '0' ;

begin
    process(clk,counter)
    begin
        if(reset = '1') then
            counter <= '0';
        elsif(clk'event and clk = '1') then
            if(counter < max) then
                counter <= counter +1;
            else
                clk_out <= not clk_out;
                counter <= 0;
            end if;
        end if;
    end process;

process(clk_out,counter2)
    if(clk_out'event and clk_out = '1') then
        counter2 <= counter2 + 1;
    end if;
end process;

process(counter2)
if(counter2 < 15) then
    green <= '1';
elsif(counter2 >= 15 and counter2 < 20) then
    yellow <= '1';
elsif(counter2 >= 20 )then
    red <= '1';
end if;
end process;
end BeH;

        

