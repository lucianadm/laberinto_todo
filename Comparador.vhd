library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Para usar "unsigned" y "to_integer"

entity Comparador is
    generic (
        VALOR : integer := 3000 -- Valor de referencia para la comparación (12 bits)
    );
    port (
        reset  : in  STD_LOGIC;        -- Señal de reset
        entrada: in  STD_LOGIC_VECTOR(11 downto 0); -- Entrada de 12 bits
        salida : out STD_LOGIC         -- Salida de 1 bit
    );
end Comparador;

architecture Behavioral of Comparador is
    signal valor_entrada: integer := 0; -- Para convertir la entrada de 12 bits a entero
begin
    process(reset)
    begin
        if reset = '1' then
            salida <= '0'; -- Resetear la salida a 0
        else
            valor_entrada <= to_integer(unsigned(entrada)); -- Convertir la entrada a entero usando "unsigned"
            if valor_entrada < VALOR then
                salida <= '1';
            else
                salida <= '0';
            end if;
        end if;
    end process;
end Behavioral;
