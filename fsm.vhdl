library ieee;
use ieee.std_logic_1164.all;

entity fsm is 
port(
    clk : in std_logic;
    reset : in std_logic;
    x : in std_logic;
    z : out std_logic
    en : in std_logic
    
);
end fsm;

architecture BeH of fsm is
type states is (q1,q2,q3,q4);
signal cu_state,nxt_state : states;
signal rs,rw : std_logic;
signal D : std_logic_vector;

begin 
    process(x,cu_state)
    begin
        z <= '0';
        nxt_state <= cu_state;

        case(cu_state)
            when q0 => 
                rs <= '0';
                rw <= '0';
                d <= "00111000"
                if (en = '1') then nxt_state <= q0;
                else nxt_state <= q1;
                end if;
            when q1 =>   
                rs <= '0';
                rw <= '0';
                d <= "00111000"
                if (en = '1') then nxt_state <= q1;
                else nxt_state <= q2;
                end if;
            when q2 => 
                if(en = '0') then nxt_state <= q4;
                else nxt_state <= q2;
                end if;
            when q3 => 
                if(en = '0') then nxt_state <= q4;
                else nxt_state <= q2;
                end if;
            when q4 =>
                if(en = '0') then nxt_state <= q1;
                else nxt_state <= q3;
                end if;
        end case;
    end process;

process(clk,reset)
begin
    if(reset = '1') then 
        cu_state <= q0;
    elsif(clk'event and clk = '1') then
        cu_state <= nxt_state;
    end if;
end process;
end BeH;


    

