library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity genera_accion is
    Port (
        -- Tres señales de 4 bits de entrada
        sentido : in std_logic_vector(1 downto 0);  -- recibo de la matriz
        sentido_nw : in std_logic_vector(1 downto 0);  -- recibo de la matriz 
        reset : in std_logic;  -- nueva entrada de reset
        -- Salidas
        accion: out std_logic_vector(1 downto 0)
    );
end genera_accion;

architecture Behavioral of genera_accion is
begin
    process(sentido, sentido_nw, reset)
    begin
        if reset = '1' then  -- Si el reset está activo
            accion <= "11";  -- La salida será "11"
        elsif sentido = "00" then  -- estaba yendo hacia arriba
            case sentido_nw is
                when "00" =>  -- menor para arriba
                    accion <= "11";  -- sigue igual hacia arriba
                when "01" => -- menor para delante
                    accion <= "10";  -- gira derecha
                when "10" => -- menor para abajo
                    accion <= "01";  -- gira 180
                when "11" => -- menor para atrás
                    accion <= "00";   -- gira izq
                when others =>
                    accion <= "00";  -- nunca se va a dar
            end case;
        elsif sentido = "01" then -- estaba yendo adelante
            case sentido_nw is
                when "00" =>  -- menor para arriba
                    accion <= "00";  -- gira izq
                when "01" => -- menor para delante
                    accion <= "11";  -- queda igual
                when "10" => -- menor para abajo
                    accion <= "10";  -- gira derecha
                when "11" => -- menor para atrás
                    accion <= "01";  -- gira 180
                when others =>
                    accion <= "00";  -- nunca se va a dar
            end case;
        elsif sentido = "10" then -- estaba yendo abajo
            case sentido_nw is
                when "00" =>  -- menor para arriba
                    accion <= "01";  -- gira 180
                when "01" => -- menor para delante
                    accion <= "00";  -- gira izq
                when "10" => -- menor para abajo
                    accion <= "11";  -- queda igual
                when "11" => -- menor para atrás
                    accion <= "10";  -- gira derecha
                when others =>
                    accion <= "00";  -- nunca se va a dar
            end case;               
        elsif sentido = "11" then -- estaba yendo atrás
            case sentido_nw is
                when "00" =>  -- menor para arriba
                    accion <= "10";  -- gira derecha
                when "01" => -- menor para delante
                    accion <= "01";  -- gira 180
                when "10" => -- menor para abajo
                    accion <= "00";  -- gira izq
                when "11" => -- menor para atrás
                    accion <= "11";  -- queda igual
                when others =>
                    accion <= "00";  -- nunca se va a dar
            end case;  
        end if;
    end process;  

end Behavioral;
