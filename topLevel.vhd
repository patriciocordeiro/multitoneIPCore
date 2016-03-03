library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity topLevel is
port
(
clk : in   std_logic;
cnt: out integer range 0 to 24;
t_out : out  integer range -8192 to 8191 
);
end topLevel;

architecture rtl of topLevel is
signal phInCnt: integer range 0 to 24:=0;

component moduloCounter
	port
	(
		clk: in std_logic;
		cnt: out integer range 0 to 24
	);
end component;
	
	
component sineLUT
port
(
clk : in   std_logic;
phaseInc : integer range 0 to 24;
sine : out  integer range -8192 to 8191 
);
end component;



begin
conter: moduloCounter port map(
		clk=>clk,
		cnt=>phInCnt);
lut: sineLUT port map(
		clk=>clk,
		phaseInc=>phInCnt,
		sine=>t_out);
end rtl;

