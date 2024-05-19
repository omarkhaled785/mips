library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ProgramCounter is
	port (
		CLK    : in STD_LOGIC;
		Reset  : in STD_LOGIC;
		PC_in  : in STD_LOGIC_VECTOR(31 downto 0);
		PC_out : out STD_LOGIC_VECTOR(31 downto 0) := (others => '0') 
	);
end ProgramCounter;

architecture Behavioral of ProgramCounter is	 
begin		  
		process (CLK, Reset)
		begin
			if (Reset = '1') then
				pc_out <= "00000000000000000000000000000000";
			elsif (RISING_EDGE(CLK)) then
				pc_out <= PC_in;
			end if;
		end process;
end Behavioral;