library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addsub1 is 
port(
    a : in std_logic_vector(4 downto 0);
    b : in std_logic_vector(4 downto 0);
    r : out std_logic_vector(4 downto 0);
    ctrl : in std_logic 
);
end addsub1;

architecture BeH of addsub1 is
signal src0,src1,sum,notsum : signed(4 downto 0);
signal cin : signed(0 downto 0) :="0";

begin 
process(a,b,src0,src1,cin,ctrl,notsum,sum)
begin
    if(a < b) then
		if(ctrl = '0') then
			src0 <= signed(a);
			src1 <= signed(b);
			cin <= "0";
			sum <= src0 + src1 + cin;
			r <= std_logic_vector(sum);
		else
			src0 <= signed(a);
        		src1 <= signed(not b);
			cin <= "1";
			sum <= src0 + src1 + cin;
			notsum <= signed(not sum) + cin;
			r <= std_logic_vector(notsum);
		end if;

   else
		if(ctrl = '0') then
			src0 <= signed(a);
			src1 <= signed(b);
			cin <= "0";
			sum <= src0 + src1 +cin;
			r <= std_logic_vector(sum);
		else
			src0 <= signed(a);
			src1 <= signed(not b);
			cin <= "1";
			sum <= src0 + src1 + cin;
			r <= std_logic_vector(signed(sum));
		end if;

end if;
end process;
end BeH;
