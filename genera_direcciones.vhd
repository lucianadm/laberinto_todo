
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Para operaciones con números con signo (signed)

entity genera_direcciones is
    Port (
	     sentido     : in  std_logic_vector(1 downto 0); -- Entrada ACTUAL de 4 bits
        actual       : in  std_logic_vector(3 downto 0); -- Entrada ACTUAL de 4 bits
        dir_Arriba   : out std_logic_vector(3 downto 0); -- Salida DIR_ARRIBA de 4 bits
        dir_Adelante : out std_logic_vector(3 downto 0); -- Salida DIR_ADELANTE de 4 bits
        dir_Abajo    : out std_logic_vector(3 downto 0); -- Salida DIR_ABAJO de 4 bits
        dir_Atras    : out std_logic_vector(3 downto 0)  -- Salida DIR_ATRAS de 4 bits
    );
end genera_direcciones;

architecture Behavioral of genera_direcciones is
    signal Act : signed(4 downto 0);  -- Entrada ACT con un bit más para cálculos
begin
    -- Convertir la entrada actual de 4 bits a una señal signed de 5 bits
    process(actual)
    begin
        Act <= signed('0' & actual);  -- Concatenar un bit 0 al inicio para hacerla de 5 bits
    end process;

    -- Proceso para calcular y asignar los valores de Ar, Ad, Ab y At
    process(Act)
        variable Ar_var, Ad_var, Ab_var, At_var : signed(4 downto 0);  -- Variables locales para cálculos
    begin
        -- Realizar las operaciones aritméticas
        Ar_var := Act - 4;  -- Act - 4
        Ad_var := Act + 1;  -- Act + 1
        Ab_var := Act + 4;  -- Act + 4
        At_var := Act - 1;  -- Act - 1

        -- Comprobar si los resultados son negativos y asignar Act si es así
        if Ar_var < 0 then
            Ar_var := "00000";
        end if;
        if Ad_var = 4 or Ad_var = 8 or Ad_var = 12 then
            Ad_var :=  "00000";
        end if;
        if Ab_var > 15 then
            Ab_var :=  "00000";
        end if;
        if At_var < 0 or At_var = 3 or At_var = 7 or At_var = 3 or At_var = 11 then
            At_var :=  "00000";
        end if;

          case sentido is
            when "00" =>   --arriba
					dir_Arriba   <= std_logic_vector(At_var(3 downto 0));  -- Los 4 bits menos significativos de Ar
					dir_Adelante <= std_logic_vector(Ar_var(3 downto 0));  -- Los 4 bits menos significativos de Ad
					dir_Abajo    <= std_logic_vector(Ad_var(3 downto 0));  -- Los 4 bits menos significativos de Ab
					dir_Atras    <= std_logic_vector(Ab_var(3 downto 0));  -- Los 4 bits menos significativos de At
            when "01" => --> adelante
					dir_Arriba   <= std_logic_vector(Ar_var(3 downto 0));  -- Los 4 bits menos significativos de Ar
					dir_Adelante <= std_logic_vector(Ad_var(3 downto 0));  -- Los 4 bits menos significativos de Ad
					dir_Abajo    <= std_logic_vector(Ab_var(3 downto 0));  -- Los 4 bits menos significativos de Ab
					dir_Atras    <= std_logic_vector(At_var(3 downto 0));  -- Los 4 bits menos significativos de At
            when "10" => --hacia abajo
					dir_Arriba   <= std_logic_vector(At_var(3 downto 0));  -- Los 4 bits menos significativos de Ar
					dir_Adelante <= std_logic_vector(Ab_var(3 downto 0));  -- Los 4 bits menos significativos de Ad
					dir_Abajo    <= std_logic_vector(Ad_var(3 downto 0));  -- Los 4 bits menos significativos de Ab
					dir_Atras    <= std_logic_vector(Ar_var(3 downto 0));  -- Los 4 bits menos significativos de At
            when "11" =>
					dir_Arriba   <= std_logic_vector(Ar_var(3 downto 0));  -- Los 4 bits menos significativos de Ar
					dir_Adelante <= std_logic_vector(At_var(3 downto 0));  -- Los 4 bits menos significativos de Ad
					dir_Abajo    <= std_logic_vector(Ab_var(3 downto 0));  -- Los 4 bits menos significativos de Ab
					dir_Atras    <= std_logic_vector(Ad_var(3 downto 0));  -- Los 4 bits menos significativos de At
            when others =>
                -- No hacer nada por defecto, señales ya están inicializadas en '0'
                null;
        end case;
		  

    end process;

end Behavioral;
