library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sineLUTOneQV2 is
port
(
clk : in   std_logic;
phaseInc : integer range 0 to 15;
output : out  integer range -8192 to 8191; 
ax_count: out integer range 0 to 4
);
end entity;
architecture rtl of sineLUTOneQV2 is 
signal sine: integer range -8192 to 8191; 
begin
process(clk)
   variable cnt_temp: integer range 0 to 15:=0;
   variable aux_cnt: integer range 0 to 4:=0;
	variable flag: std_logic:='0';
begin
 if rising_edge(clk) then
	if (cnt_temp=0) then
		flag := '0';
		if (aux_cnt < 2) then
		  aux_cnt := aux_cnt+1;
		else 
		  aux_cnt := 1;
		end if;
	end if;
	
	if (cnt_temp>=0 AND cnt_temp<4 AND flag='0') then
		cnt_temp := cnt_temp + 1;
	else 
		flag:='1';
		cnt_temp := cnt_temp - 1;
  end if;

case cnt_temp is
 when 0 => sine <= 0;
 when 1 => sine <= 3135;
 when 2 => sine <= 5792;
 when 3 => sine <= 7567;
 when 4 => sine <= 8191;
 when others => sine <=0;
end case;
if (aux_cnt<2) then
output <= sine;
else
output <= -sine;
end if;
ax_count <= aux_cnt;
end if;

end process;
end rtl;
