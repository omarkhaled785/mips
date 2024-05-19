library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity SignExtender is
	port (
		SE_in  : in STD_LOGIC_VECTOR(15 downto 0);
		SE_out : out STD_LOGIC_VECTOR(31 downto 0)
	);
end SignExtender;

architecture Behavioral of SignExtender is

begin

	process(SE_in) is
            begin
                if(SE_in(15) = '0') then 
                    SE_out <= (0 to 15 => '0' ) & SE_in;
                else 
                    SE_out <= (0 to 15 => '1' ) & SE_in;
                end if;
            end process;
end Behavioral;