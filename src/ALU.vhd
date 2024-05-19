library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    Port (	   
        operation : in STD_LOGIC_VECTOR(5 downto 0) ;-- Control input for selecting operation
        operand1 : in STD_LOGIC_VECTOR(31 downto 0); -- First operand
        operand2 : in STD_LOGIC_VECTOR(31 downto 0); -- Second operand
        result : out STD_LOGIC_VECTOR(31 downto 0);  -- Result of the operation
        zero : out STD_LOGIC                         -- Zero flag indicating result is zero
    );
end ALU;

architecture Behavioral of ALU is 
begin
    process (operation, operand1, operand2)
    begin		
        case operation is  -- alu control
            when "000010" =>  -- Addition
                result <= std_logic_vector(signed(operand1) + signed(operand2));
            when "000011" =>  -- Subtraction
                result <= std_logic_vector(signed(operand1) - signed(operand2));
            when "000000" =>  -- Logical AND
                result <= operand1 and operand2;
            when "000001" =>  -- Logical OR
                result <= operand1 or operand2;
            when others =>
                result <= (others => '0');  -- Default to all ones
        end case;
		
		
        -- Set zero flag if result is zero
		if operand1 = operand2 then
        zero <= '1' ;
		else
		zero <= '0'	; 
		end if;	 
    end process;
end Behavioral;