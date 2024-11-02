library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity compara_vecinos is
    Port (
        -- Tres señales de 4 bits de entrada
		   Arriba : in std_logic_vector(3 downto 0);  --recibo de la matriz
         Adelante : in std_logic_vector(3 downto 0);  --recibo de la matriz 
			Abajo : in std_logic_vector(3 downto 0);   --recibo de la matriz
         Atras :  in std_logic_vector(3 downto 0);   --recibo de la matriz
        -- Salidas
        sentido_nw: out std_logic_vector(1 downto 0)  -- 00: A menor, 01: B menor, 10: C menor
    );
end compara_vecinos;

architecture Behavioral of compara_vecinos is
  
begin
    -- Proceso para comparar las cuatro señales
 process(Arriba, Adelante, Abajo, Atras)
    begin
        -- Convertimos las señales a tipo unsigned para poder compararlas
        if unsigned(Arriba) <= unsigned(Adelante) and unsigned(Arriba) <= unsigned(Abajo) and unsigned(Arriba) <= unsigned(Atras) then
            -- Arriba es la menor o hay empate con otras señales, pero se prioriza Arriba
            sentido_nw <= "00";   -- Nuevo sentido Arriba
        elsif unsigned(Adelante) <= unsigned(Abajo) and unsigned(Adelante) <= unsigned(Atras) then
            -- Adelante es la menor o hay empate con Abajo o Atras, pero se prioriza Adelante
            sentido_nw <= "01";   -- Nuevo sentido Adelante
        elsif unsigned(Abajo) <= unsigned(Atras) then
            -- Abajo es la menor o hay empate con Atras, pero se prioriza Abajo
            sentido_nw <= "10";   -- Nuevo sentido Abajo
        else
            -- Atras es la menor
            sentido_nw <= "11";   -- Nuevo sentido Atras
        end if;
    end process;


end Behavioral;

