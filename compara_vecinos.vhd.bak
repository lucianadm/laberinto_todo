library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity compara_vecinos is
    Port (
        -- Tres señales de 4 bits de entrada
        A : in std_logic_vector(3 downto 0);  -- Primera señal
        B : in std_logic_vector(3 downto 0);  -- Segunda señal
        C : in std_logic_vector(3 downto 0);  -- Tercera señal

        -- Salida de 2 bits
        resultado : out std_logic_vector(1 downto 0)  -- 00: A menor, 01: B menor, 10: C menor
    );
end compara_vecinos;

architecture Behavioral of compara_vecinos is
begin

    -- Proceso para comparar las tres señales
    process(A, B, C)
    begin
        if A < B and A < C then
            -- A es la menor
            resultado <= "00";
        elsif B < A and B < C then
            -- B es la menor
            resultado <= "01";
        else
            -- C es la menor
            resultado <= "10";
        end if;
    end process;

end Behavioral;
