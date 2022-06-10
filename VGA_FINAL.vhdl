library ieee;
use ieee.std_logic_1164.all;

entity VGA_FINAL is
   
generic(
    H_TDISP : integer := 640; --HORIZONTAL DISPLAY TIME
    H_TPW : integer := 96; --HPRIZONAL PULSE WIDTH TIME
    H_TFP : integer := 16; --HORIZONTAL FRONT PORCH TIME
    H_TBP : integer := 48; --HORIZONTAL BACK PORCH TIME

    V_TDISP : integer := 480; --VERTICAL DISPLAY TIME
    V_TPW : integer := 2; --VERTICAL PULSE WIDTH TIME
    V_TFP : integer := 10; --VERTICAL FRONT PORCH TIME
    V_TBP : integer := 33 --VERTICA BACK PORCH TIME
);
port(
    CLK : in std_logic;
    RESET : in std_logic;
    VGA_HS : out std_logic;
    VGA_VS : out std_logic;
    VGA_BLANK : out std_logic;
    VGA_SYNC : out std_logic;

    --COLOR PROCESS COMPONENTS
    VGA_R : out std_logic_vector(7 downto 0);
    VGA_G : out std_logic_vector(7 downto 0);
    VGA_B : out std_logic_vector(7 downto 0);
    DISP : inout std_logic;
    COLUMN : inout integer;
    ROW : inout integer
);
end VGA_FINAL;




architecture BeH of VGA_FINAL is

--COMPONENT VGA COLOR
component VGA_COLOR_FINAL is
    port(
        ROW1 : in integer;
        COLUMN1 : in integer;
        VGA_R1 : out std_logic_vector(7 downto 0);
        VGA_G1 : out std_logic_vector(7 downto 0);
        VGA_B1 : out std_logic_vector(7 downto 0);
        DISP1 : in std_logic
    );
end component;

constant H_SYNCPT : integer := 800; --HORIZONTAL PERIOD = (H_TDISP + H_TPW + H_TFP + H_TBP)
constant V_SYNCPT : integer := 525; --VERTICAL PERIOD = (V_TDISP + V_TPW + V_TPF + V_TBP)
signal clk_out : std_logic := '0';
signal temp : std_logic;

--CLOCK
begin
    process(CLK,RESET)
    begin
        if(RESET = '1') then
            temp <= '0';
        elsif(CLK'event and CLK = '1') then
            temp <= not temp;
        end if;
        clk_out <= temp;
    end process;


    process(clk_out,RESET)
    variable H_PIXCNTR : integer range 0 to H_SYNCPT - 1 := 0; --HORIZONTAL PIXEL COUNTER
    variable V_PIXCNTR : integer range 0 to V_SYNCPT - 1 := 0; --VERTICAL PIXEL COUNTER
    begin
        if(RESET = '0') then
            H_PIXCNTR := 0;
            V_PIXCNTR := 0;
            VGA_R <= (others => '0');
            VGA_G <= (others => '0');
            VGA_B <= (others => '0');
            VGA_HS <= '1';
            VGA_VS <= '1';
            DISP <= '0';
            COLUMN <= 0;
            ROW <= 0;
        elsif(clk_out'event and clk_out = '1') then
        --PIXEL COUNTER
            if(H_PIXCNTR < H_SYNCPT - 1) then
                H_PIXCNTR := H_PIXCNTR + 1;
            else
                H_PIXCNTR :=0;
                if(V_PIXCNTR < V_SYNCPT - 1) then
                    V_PIXCNTR := V_PIXCNTR +1;
                else
                    V_PIXCNTR := 0;
                end if;
            end if;

            --Horizontal sync, GAP BETWEEN THE FRONT PORCH AND THE BACK PORCH
            --
            if(H_PIXCNTR < H_TDISP + H_TFP or H_PIXCNTR >= H_TDISP + H_TFP + H_SYNCPT) then
                VGA_HS <= '1';
            else
                VGA_HS <= '1';
            end if;

            --Vertical sync, GAP BETWEEN THE FRONT PORCH AND THE BACK PORCH
            if(V_PIXCNTR < V_TDISP + V_TFP or V_PIXCNTR >= V_TDISP + V_TFP + V_SYNCPT) then
                VGA_VS <= '1';
            else
                VGA_VS <= '1';
            end if;

            --coordinates
            if(H_PIXCNTR < H_TDISP) then
                COLUMN <= H_PIXCNTR;
            end if;
            if(V_PIXCNTR < V_TDISP) then
                ROW <= V_PIXCNTR;
            end if;

            --ENABLE DISPLAY
            if(H_PIXCNTR < H_TDISP and V_PIXCNTR < V_TDISP) then
                DISP <= '1';
            else
                DISP <= '0';
            end if;
        end if;
    end process;
    
VGA_BLANK <= '1';
VGA_SYNC <= '0'; 

    --COLOR PROCESS
U0 : VGA_COLOR_FINAL 
port map(
    ROW,
    COLUMN,
    VGA_R,
    VGA_G,
    VGA_B,
    DISP
);

    
end BeH;