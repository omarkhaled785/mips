library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 

use IEEE.NUMERIC_STD.ALL; -- Use NUMERIC_STD package instead

entity InstructionMemory is
    Port ( 
	clk: in std_logic;
           address : in STD_LOGIC_VECTOR(31 downto 0);
           instruction : out STD_LOGIC_VECTOR(31 downto 0));
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    type InstructionMemoryArray is array (natural range <>) of STD_LOGIC_VECTOR(31 downto 0); -- Assuming 1 MB Instruction Memory
    constant Instructions : InstructionMemoryArray := (
	"000000" & "00001" & "00100" & "00011" & "00000" & "100000",	-- add    reg [3] = reg[1] + reg[4] = 1 + 4 = 5		
	"001000" & "00000" & "00010" & "0000000000000000", -- sw     memory[0] = 2; 
	"001000" & "10000" & "00011" & "0000000000000000", -- sw     memory[16] = 5; 
	"000111" & "00000" & "00001" & "0000000000000000", -- lw     reg[1] = memory[0]
    "000111" & "10000" & "00101" & "0000000000000000", -- lw     reg[5] = memory[16]	
	"000000" & "00001" & "00101" & "01000" & "00000" & "100000", -- add    reg[8] = reg[1] + reg[5] = 2 + 5 = 7
	"000000" & "00001" & "00011" & "01000" & "00000" & "100010", -- sub    reg[8] = reg[1] - reg[3] = 2 - 5 = -3
	"000000" & "00011" & "00011" & "01000" & "00000" & "100010", -- sub    reg[8] = reg[3] - reg[3] = 2 - 2 = 0
	"000000" & "00011" & "01000" & "00111" & "00000" & "100100", -- and    reg[7] = reg[3] & reg[8] = 0 & 5 = 0
	"000000" & "00111" & "00001" & "01111" & "00000" & "100101"  -- or     reg[15] = reg[7] | reg[1] = 0 | 2 = 2

    );

begin
    process(clk, address)
    begin				 
		if(rising_edge(clk)) then
            if(address < std_logic_vector(to_unsigned(64,32))) then
                    instruction <= Instructions(to_integer(unsigned(address))/4);
                else
                    instruction <= (others => '0');
             end if;
			 end if;
    end process;

end Behavioral;