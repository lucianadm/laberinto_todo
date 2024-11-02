--cuando Sensor_bajo presenta un flanco descendente tiene que mantener las salidas 
--como venian (ambas en 1) y actualizar el valor de un registro que se llama ACTUAL (4 bits)
 --segun el valor de otro registro interno llamado SENTIDO (2bits), de la siguiente forma:
 --si SENTIDO=0 entonces ACTUAL=ACTUAL-4, 
 --si SENTIDO=1 entonces ACTUAL=ACTUAL+1 
 --si SENTIDO=2 entonces ACTUAL=ACTUAL+4 
 --y si SENTIDO=· entonces ACTUAL=ACTUAL-1

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity motor_control is
    Port (
        clk        : in  std_logic;
        Sensor_bajo : in  std_logic;
        motor      : out std_logic := '1';
        motor2     : out std_logic := '1'
    );
end motor_control;

architecture Behavioral of motor_control is
    signal ACTUAL   : std_logic_vector(3 downto 0) := "0000";
    signal SENTIDO  : std_logic_vector(1 downto 0) := "00";
    signal Sensor_bajo_prev : std_logic := '1';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            -- Detecta el flanco descendente en Sensor_bajo
            if Sensor_bajo_prev = '1' and Sensor_bajo = '0' then
                -- Mantener motor y motor2 en '1'
                motor <= '1';
                motor2 <= '1';

                -- Actualizar el registro ACTUAL según el valor de SENTIDO
                case SENTIDO is
                    when "00" =>
                        -- SENTIDO = 0 -> ACTUAL = ACTUAL - 4
                        ACTUAL <= ACTUAL - 4;
                    when "01" =>
                        -- SENTIDO = 1 -> ACTUAL = ACTUAL + 1
                        ACTUAL <= ACTUAL + 1;
                    when "10" =>
                        -- SENTIDO = 2 -> ACTUAL = ACTUAL + 4
                        ACTUAL <= ACTUAL + 4;
                    when others =>
                        -- SENTIDO = 3 -> ACTUAL = ACTUAL - 1
                        ACTUAL <= ACTUAL - 1;
                end case;
            end if;

            -- Almacena el valor anterior de Sensor_bajo para la detección de flanco
            Sensor_bajo_prev <= Sensor_bajo;
        end if;
    end process;
end Behavioral;
