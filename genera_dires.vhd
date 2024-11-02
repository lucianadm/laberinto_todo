library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity genera_dires is
    Port (
        -- Tres señales de 4 bits de entrada
		   Actual : in std_logic_vector(3 downto 0);  --recibo de la matriz
        -- Salidas
       	dir_Arriba : out std_logic_vector(3 downto 0);  --recibo de la matriz
         dir_Adelante : out std_logic_vector(3 downto 0);  --recibo de la matriz 
			dir_Abajo : out std_logic_vector(3 downto 0);   --recibo de la matriz
         dir_Atras :  out std_logic_vector(3 downto 0)   --recibo de la matriz
    );
end genera_dires;

architecture Behavioral of genera_dires is
  
begin
        -- Tres señales de 4 bits de entrada
    -- Proceso para comparar las tres señales
    process(Actual)
    begin
        if Arriba < Adelante and Arriba < Abajo and Arriba < Atras then
            -- A es la menor
            sentido_nw <= "00";   --nuevo sentido arriba
        elsif Adelante < Arriba and Adelante < Abajo and Adelante < Atras then
            -- B es la menor
            sentido_nw <= "01";  --nuevo sentido adelante
			elsif Abajo < Arriba and Abajo < Adelante and Abajo < Atras then
            -- B es la menor
            sentido_nw <= "10"; --nuevo sentido abajo
        else
            -- Atras es el menor
           sentido_nw <= "11"; --nuevo sentido atras
        end if;
    end process;

end Behavioral;

