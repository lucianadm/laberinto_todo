library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity accion is
    Port (
        Hab_sentido: in std_logic;
        reset      : in std_logic;  -- Entrada de reset asíncrono
        accion_nw  : in std_logic_vector(1 downto 0); -- Habilitador del registro ACTUAL
        accion_out : out std_logic_vector(1 downto 0) -- Salida del valor actual
    );
end accion;

architecture Behavioral of accion is
begin

    -- Proceso para calcular el valor en ca2 dependiendo del valor de SENTIDO
    process(Hab_sentido, reset)
    begin
        -- Verificar si el reset está activo
        if reset = '1' then
            accion_out <= "11";  -- Salida 11 cuando el reset está activo
        elsif rising_edge(Hab_sentido) then
            accion_out <= accion_nw;  -- Almacena el valor de accion_nw cuando Hab_sentido tiene flanco de subida
        end if;
    end process;

end Behavioral;
