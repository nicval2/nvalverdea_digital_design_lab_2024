LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sumado_4bit_TB IS
END sumado_4bit_TB;
 
ARCHITECTURE behavior OF sumado_4bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador_4bit
    PORT(
         iAv : IN  std_logic_vector(3 downto 0);
         iBv : IN  std_logic_vector(3 downto 0);
         iCin : IN  std_logic;
         oCarry : OUT  std_logic;
         ovSuma_4bit : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal iAv : std_logic_vector(3 downto 0) := (others => '0');
   signal iBv : std_logic_vector(3 downto 0) := (others => '0');
   signal iCin : std_logic := '0';

 	--Outputs
   signal oCarry : std_logic;
   signal ovSuma_4bit : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador_4bit PORT MAP (
          iAv => iAv,
          iBv => iBv,
          iCin => iCin,
          oCarry => oCarry,
          ovSuma_4bit => ovSuma_4bit
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		iAv<="0010";
		iBv<="0011";
      wait for 10 ns;	
		iAv<="1010";
		iBv<="0001";
     wait for 10 ns;	
     wait for 10 ns;	
		iAv<="1110";
		iBv<="0101";

      -- insert stimulus here 

      wait;
   end process;

END;