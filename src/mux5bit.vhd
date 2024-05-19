library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mux5bit is	 
	port(
	a,b: in std_logic_vector(4 downto 0);
	s:in std_logic:='0';
	c : out std_logic_vector(4 downto 0)
	);
end mux5bit;

architecture mux5bit of mux5bit is
begin 
       c <= a when s = '0' else b;
end mux5bit;