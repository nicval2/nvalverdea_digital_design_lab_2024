LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Sumador_1bit_TB IS
END Sumador_1bit_TB;
 
ARCHITECTURE behavior OF Sumador_1bit_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sumador_completo_1bit
    PORT(
         iA : IN  std_logic;
         iB : IN  std_logic;
         iCarry : IN  std_logic;
         oCarry : OUT  std_logic;
         oSuma_1bit : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal iA : std_logic := '0';
   signal iB : std_logic := '0';
   signal iCarry : std_logic := '0';

 	--Outputs
   signal oCarry : std_logic;
   signal oSuma_1bit : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	signal cuenta : INTEGER :=0;
	signal cuenta_STV :std_logic_vector(2 Downto 0) :="000";
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sumador_completo_1bit PORT MAP (
          iA => iA,
          iB => iB,
          iCarry => iCarry,
          oCarry => oCarry,
          oSuma_1bit => oSuma_1bit
        );

 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
  

		wait for 100 ns;	
		iA <= '0';
		iB <= '0';
		iCarry <= '0';
		wait for 10 ns;	
		iA <= '1';
		iB <= '0';
--
		wait for 10 ns;	
		iA <= '0';
		iB <= '1';
--
		wait for 10 ns;	
		iA <= '1';
		iB <= '1';
--
		wait for 10 ns;	
		iA <= '0';
		iB <='0';
--
		wait for 50 ns;	
		iCarry <= '1';
		
		wait for 100 ns;	
		iA <= '0';
		iB <= '0';
	
		wait for 10 ns;	
		iA <= '1';
		iB <= '0';
--
		wait for 10 ns;	
		iA <= '0';
		iB <= '1';
--
		wait for 10 ns;	
		iA <= '1';
		iB <= '1';
--
		wait for 10 ns;	
		iA <= '0';
		iB <='0';
		iCarry <='0';
--
      -- insert stimulus here 
		wait for 300 ns;	


---------------------------------------------------------------------
--------------------------------------------------------------------

		cuenta<=0;
		cuenta_STV<="000";
		
		for cuenta in 0 to 7 loop
			iA<= cuenta_STV(0);
			iB<= cuenta_STV(1);
			iCarry<= cuenta_STV(2);
			cuenta_STV<=cuenta_STV + "001";
			wait for 50 ns;	
		end loop;
			

		wait for 100 ns;	



      wait;
   end process;

END;