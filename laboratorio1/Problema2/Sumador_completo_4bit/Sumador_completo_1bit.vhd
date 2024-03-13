library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Sumador_completo_1bit is
    Port ( iA : in  STD_LOGIC;
           iB : in  STD_LOGIC;
           iCarry : in  STD_LOGIC;
           oCarry : out  STD_LOGIC;
           oSuma_1bit : out  STD_LOGIC);
end Sumador_completo_1bit;

architecture Behavioral of Sumador_completo_1bit is

begin

	oSuma_1bit<=iA xor iB xor iCarry;
	oCarry <= (iA and iB) or (iCarry and iA) or (iCarry and iB);

end Behavioral;
