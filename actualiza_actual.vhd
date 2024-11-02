library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity actualiza_actual is
    Port (
        hab_actual  : in  std_logic;        -- Habilitador del registro ACTUAL
        sentido     : in  std_logic_vector(1 downto 0); -- Entrada de 2 bits (SENTIDO)
        actual_out  : out std_logic_vector(3 downto 0)  -- Salida del valor actual
    );
end actualiza_actual;

architecture Behavioral of actualiza_actual is
    signal actual : std_logic_vector(3 downto 0) := "0000"; -- Registro ACTUAL
    signal ca2    : std_logic_vector(3 downto 0); -- Valor calculado en complemento a 2

begin

    -- Proceso para calcular el valor en ca2 dependiendo del valor de SENTIDO
    process(sentido)
    begin
        case sentido is
            when "00" => ca2 <= "1100";  -- -4 en complemento a 2 ARRIBA
            when "01" => ca2 <= "0001";  -- 1 en complemento a 2 ADELANTE
            when "10" => ca2 <= "0100";  -- +4 en complemento a 2 ABAJO
            when "11" => ca2 <= "1111";  -- -1 en complemento a 2 ATRAS
            when others => ca2 <= "0000"; -- Por defecto, valor 0
        end case;
    end process;

    -- Proceso para actualizar el registro ACTUAL en cada flanco ascendente del reloj
    process(hab_actual)
    begin
        if rising_edge(hab_actual) then
                -- Suma el valor de ca2 al registro actual y lo almacena
                actual <= actual + ca2;
            end if;
    end process;

    -- Asignar el valor de salida al registro ACTUAL
    actual_out <= actual;

end Behavioral;
