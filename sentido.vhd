library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sentido is
    Port (
        reset       : in  std_logic;                     -- Señal de reset
        Hab_sentido : in  std_logic;                     -- Señal de habilitación
        sentido_nw  : in  std_logic_vector(1 downto 0);  -- Entrada del nuevo valor de sentido
        sentido_out : out std_logic_vector(1 downto 0)   -- Salida del valor actual de sentido
    );
end sentido;

architecture Behavioral of sentido is
    -- Señal interna para almacenar el valor de sentido_out
    signal sentido_reg : std_logic_vector(1 downto 0) := "01"; -- Inicialización a "01"
begin
    -- Proceso para manejar reset y actualizar el valor de sentido_out en el flanco ascendente de Hab_sentido
    process(reset, Hab_sentido)
    begin
        if reset = '1' then
            -- Si reset está activo, reiniciar sentido_out a "01"
            sentido_reg <= "01";
        elsif rising_edge(Hab_sentido) then
            -- Si hay un flanco ascendente en Hab_sentido, actualizar sentido_reg con sentido_nw
            sentido_reg <= sentido_nw;
        end if;
    end process;

    -- Asignar el valor de la señal interna a la salida
    sentido_out <= sentido_reg;

end Behavioral;
