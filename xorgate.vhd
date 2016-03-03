library ieee;
use ieee.std_logic_1164.all;

entity xorgate is 
   port (
	  clk   : in std_logic;
	  input : in std_logic_vector(13 downto 0);
	 output : out std_logic_vector(13 downto 0)
	      );
end entity;

architecture sinalsemsinal of  xorgate is
--signal temp_out: std_logic_vector(13 downto 0); 
begin
process(clk)
begin
if rising_edge(clk) then
output <= (input) xor ("10000000000000") ;
end if;
end process;

end sinalsemsinal;
	