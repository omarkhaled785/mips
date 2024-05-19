library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity andgate is
	port (
	a, b: in std_logic;
	c: out std_logic
	);
end andgate;

architecture forandgate of andgate is

begin

	c <= a and b;

end forandgate;