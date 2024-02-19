library ieee;
use ieee.std_logic_1164.all;

entity Sumador_completo_4bit_tb is
end Sumador_completo_4bit_tb;

architecture Behavioral of Sumador_completo_4bit_tb is
    component Sumador_completo_4bit is
        port(
            A, B : in std_logic_vector(3 downto 0);
            Cin : in std_logic;
            Sum : out std_logic_vector(3 downto 0);
            Cout : out std_logic
        );
    end component;

    signal A_tb, B_tb, Sum_tb : std_logic_vector(3 downto 0);
    signal Cin_tb, Cout_tb : std_logic;
begin
    DUT: Sumador_completo_4bit port map(A_tb, B_tb, Cin_tb, Sum_tb, Cout_tb);

    stimulus: process
    begin
        A_tb <= "0000"; B_tb <= "0000"; Cin_tb <= '0'; wait for 10 ns;
        assert Sum_tb = "0000" and Cout_tb = '0' report "Test 1 Failed" severity error;
        
        A_tb <= "1111"; B_tb <= "0001"; Cin_tb <= '0'; wait for 10 ns;
        assert Sum_tb = "0000" and Cout_tb = '1' report "Test 2 Failed" severity error;
        
        A_tb <= "1001"; B_tb <= "0110"; Cin_tb <= '1'; wait for 10 ns;
        assert Sum_tb = "0000" and Cout_tb = '1' report "Test 3 Failed" severity error;
        
        A_tb <= "1010"; B_tb <= "1010"; Cin_tb <= '0'; wait for 10 ns;
        assert Sum_tb = "10100" and Cout_tb = '0' report "Test 4 Failed" severity error;
        
        wait;
    end process stimulus;
end Behavioral;
