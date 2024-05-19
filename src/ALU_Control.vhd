library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ALU_Control is
    Port (
        funct : in STD_LOGIC_VECTOR(5 downto 0);  -- Function field of the instruction (for R-type instructions)
        ALUOp : in STD_LOGIC_VECTOR(5 downto 0);   -- ALU operation field (determined by the instruction type)
        ALUControl : out STD_LOGIC_VECTOR(5 downto 0)  -- Control signals for the ALU
    );
end ALU_Control;

architecture Behavioral of ALU_Control is
begin
    process ( funct, ALUOp)
    begin

        -- Control signals based on opcode and ALUOp
        case ALUOp is
            when "000000" =>  -- R-type instruction
                case funct is
                    when "100000" =>  -- ADD
                        ALUControl <= "000010";  -- Addition
                    when "100010" =>  -- SUB
						ALUControl <= "000011";  -- Subtraction	 
					when "100100" =>  -- AND
						ALUControl <= "000000";  -- AND
					when "100101" =>  -- OR
                        ALUControl <= "000001";  -- OR
                    when others =>
                        ALUControl <= "111111";  -- Default (no operation)
                end case;
          --  when "000111" =>  -- Load
			--ALUControl <= "000010";  -- Addition 
			--when "001000" =>	 -- store
			-- ALUControl <= "101010";
          -- when "001001" =>  -- Branch instruction
             --  ALUControl <= "000011";  -- Subtraction
           -- when "001011" =>  -- Jump instruction
              --  ALUControl <= "111111";  -- Default (no operation)
            -- Add more cases as needed for additional ALU operations
           when others =>
               ALUControl <= "000010";  -- Default (no operation)
        end case;
    end process;
end Behavioral;