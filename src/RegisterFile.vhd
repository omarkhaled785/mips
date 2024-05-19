 library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity RegisterFile is
    Port (
        clkr,clkw : in STD_LOGIC;
        regWrite : in STD_LOGIC;
		
        writeReg : in STD_LOGIC_VECTOR(4 downto 0);   
		
        writeData : in STD_LOGIC_VECTOR(31 downto 0);  
		
        readReg1 : in STD_LOGIC_VECTOR(4 downto 0);
        readReg2 : in STD_LOGIC_VECTOR(4 downto 0); 	
		
        readData1 : out STD_LOGIC_VECTOR(31 downto 0);
        readData2 : out STD_LOGIC_VECTOR(31 downto 0)
    );
end RegisterFile;

architecture Behavioral of RegisterFile is

type RegisterArrayType is array (0 to 31) of STD_LOGIC_VECTOR(31 downto 0);-- ?? BAQOLK HENA LAZEM AMLA EL REGISTERS ELI 3NDI 
signal Instructions : RegisterArrayType := (
       	"00000000000000000000000000000000", 
        "00000000000000000000000000000001", 
        "00000000000000000000000000000010", 
        "00000000000000000000000000000011", 
        "00000000000000000000000000000100", 
        "00000000000000000000000000000101", 
        "00000000000000000000000000000110", 
        "00000000000000000000000000000111", 
        "00000000000000000000000000001000", 
        "00000000000000000000000000001001",   
		"00000000000000000000000000001010",
		"00000000000000000000000000001011",	 
		"00000000000000000000000000001100",
		"00000000000000000000000000001101",
		"00000000000000000000000000001110",
		"00000000000000000000000000001111",
		"00000000000000000000000000010000",
		"00000000000000000000000000010001",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111",
		"00000000000000000000000000001111"
       
    );		
	
begin
    process(clkr) is
        begin
            if(rising_edge(clkr)) then 
                readData1 <= Instructions(to_integer(unsigned(readReg1)));
                readData2 <= Instructions(to_integer(unsigned(readReg2)));
            end if;
        end process;
      process(clkw) is
            begin
                if(rising_edge(clkw)) then 
                    if(regWrite = '1') then
                    Instructions(to_integer(unsigned(writeReg))) <= writeData;
                    end if;
                end if;
        end process;
end Behavioral;