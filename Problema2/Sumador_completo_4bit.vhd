library ieee;
use ieee.std_logic_1164.all;

entity Sumador_completo_4bit is
    port(
        A, B : in std_logic_vector(3 downto 0);
        Cin : in std_logic;
        Sum : out std_logic_vector(3 downto 0);
        Cout : out std_logic
    );
end Sumador_completo_4bit;

architecture Behavioral of Sumador_completo_4bit is
    component Sumador_completo__1bit is
        port(
            A, B, Cin : in std_logic;
            Sum, Cout : out std_logic
        );
    end component;

    signal Cout_temp : std_logic_vector(3 downto 0);
begin
    FA0: Sumador_completo_1bit port map(A(0), B(0), Cin, Sum(0), Cout_temp(0));
    FA1: Sumador_completo_1bit port map(A(1), B(1), Cout_temp(0), Sum(1), Cout_temp(1));
    FA2: Sumador_completo_1bit port map(A(2), B(2), Cout_temp(1), Sum(2), Cout_temp(2));
    FA3: Sumador_completo_1bit port map(A(3), B(3), Cout_temp(2), Sum(3), Cout);

end Behavioral;
