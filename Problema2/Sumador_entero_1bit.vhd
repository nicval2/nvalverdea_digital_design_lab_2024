library ieee;
use ieee.std_logic_1164.all;

entity Sumador_entero_1bit is
    port(
        A, B, Cin : in std_logic;
        Sum, Cout : out std_logic
    );
end Sumador_entero_1bit;

architecture Behavioral of Sumador_entero_1bit is
begin
    Sum <= A xor B xor Cin;
    Cout <= (A and B) or (Cin and (A xor B));
end Behavioral;
