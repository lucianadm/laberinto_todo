library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaración de la entidad
entity cero is
    Port (
        Y : out STD_LOGIC_VECTOR(3 downto 0)  -- Salida de 4 bits
    );
end cero;

-- Descripción de la arquitectura
architecture Behavioral of cero is
begin
    -- Asignamos la constante "1111" a la salida
    Y <= "0000";
end Behavioral;
