library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Sum_4_bits is;
port(

    C_in: in std_logic;
    A0,A1,A2,A3: in std_logic;
    B0,B1,B2,B3: in std_logic;
    SUM0,SUM1,SUM2,SUM3: out std_logic;
    C_out: out std_logic

);
end Sum_4_bits;

architecture BeH of Sum_4_bits is

signal signal_s0,signal_s1,signal_s2,signal_s3: std_logic;
signal signal_c0_0,signal_c1_0,signal_c2_0,signal_c3_0: std_logic;
signal signal_c0_1,signal_c1_1,signal_c2_1,signal_c3_1: std_logic;
signal signal_C_out_0,signal_C_out_1,signal_C_out_2: std_logic;

begin
signal_s0 <= A0 xor B0;
signal_c0_0 <= A0 and B0;
SUM0 <= C_in xor signal_s0;
signal_c0_1 <= C_in xor signal_s0;
signal_C_out_0 <= signal_c0_0 or signal_c0_1;

signal_s1 <= A1 xor B1;
signal_c1_0 <= A1 and B1;
SUM1 <= signal_C_out_0  xor signal_s1;
signal_c1_1 <= signal_C_out_0 xor signal_s1;
signal_C_out_1 <= signal_c1_0 or signal_c1_1;

signal_s2 <= A2 xor B2;
signal_c2_0 <= A2 and B2;
SUM2 <= signal_C_out_1 xor signal_s2;
signal_c2_1 <= signal_C_out_1 xor signal_s2;
signal_C_out_2 <= signal_c2_0 or signal_c2_1;

signal_s3 <= A3 xor B3;
signal_c3_0 <= A3 and B3;
SUM3 <= signal_C_out_2 xor signal_s3;
signal_c3_1 <= signal_C_out_2 xor signal_s3;
C_out <= signal_c3_0 or signal_c3_1;

end BeH;

