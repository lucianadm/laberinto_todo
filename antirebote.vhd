library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity antirebote is
    Port (
        clk       : in  std_logic;  -- Reloj del sistema
        reset     : in  std_logic;  -- Reset del sistema
        pulsador  : in  std_logic;  -- Entrada del pulsador
        salida    : out std_logic   -- Salida sin rebotes
    );
end antirebote;

architecture Behavioral of antirebote is
    signal estado_actual  : std_logic := '0';
    signal estado_anterior : std_logic := '0';
    signal contador       : integer range 0 to 5 := 0; -- Ajusta este rango para el tiempo de antirrebote
    constant umbral       : integer := 5; -- Ajusta según el tiempo de antirrebote necesario
begin

    process(clk, reset)
    begin
        if reset = '1' then
            estado_actual <= '0';
            estado_anterior <= '0';
            contador <= 0;
            salida <= '0';
        elsif rising_edge(clk) then
            -- Verifica si la señal del pulsador ha cambiado
            if pulsador /= estado_anterior then
                estado_anterior <= pulsador;
                contador <= 0; -- Reinicia el contador cuando hay un cambio
            else
                if contador < umbral then
                    contador <= contador + 1; -- Incrementa el contador mientras no alcance el umbral
                else
                    estado_actual <= estado_anterior; -- Actualiza el estado cuando el contador alcanza el umbral
                end if;
            end if;

            salida <= estado_actual; -- Actualiza la salida con el estado filtrado
        end if;
    end process;

end Behavioral;
