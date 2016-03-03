library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sineOneQLUT is
port
(
clk : in   std_logic;
phaseInc : integer range 0 to 15;
sine : out  integer range -8192 to 8191 
);
end entity;
architecture rtl of sineOneQLUT is 
begin
process(clk)
   variable cnt_temp: integer range 0 to 15:=0;
begin
 if rising_edge(clk) then
  if (cnt_temp=15) then
  cnt_temp := 0;
  else
  cnt_temp := cnt_temp + 1;
  end if;

case cnt_temp is
 when 0 | 8 => sine <= 0;
 when 1 | 7 | 9 | 15  => 
    if(cnt_temp = 1 OR cnt_temp= 7) then 
      sine <= 3135;
    else
      sine <= -3135;
    end if;
 when 2 | 6 | 10 | 14 => 
  if(cnt_temp= 2 OR  cnt_temp= 6) then 
    sine <= 5792;
  else
      sine <= -5792;
  end if;
 
 when 3 | 5 | 11 | 13 => 
      if(cnt_temp= 3 OR cnt_temp= 5) then sine <= 7567;
        else sine <= -7567;
      end if;
 when 4 | 12 =>
  if(cnt_temp = 4) then sine <= 8191;
      else sine <= -8191;
  end if;
 when others => sine <=0;
end case;
end if;
end process;
end rtl;

