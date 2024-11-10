library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity actualiza_muro is
    Port (
	    reset: in  std_logic;  
        sentido  : in  std_logic_vector(1 downto 0);  -- Entrada de 2 bits
        clk      : in  std_logic;                     -- Señal de reloj
        Ar, Ad, Ab, At       : out std_logic;         -- Salidas de direcciones
        ena_Ar, ena_Ad, ena_Ab, ena_At : out std_logic -- Señales enable
    );
end actualiza_muro;

architecture Behavioral of actualiza_muro is
    -- Señales internas
    --signal Ar_i, Ad_i, Ab_i, At_i      : std_logic := '0';
    --signal ena_Ar_i, ena_Ad_i, ena_Ab_i, ena_At_i : std_logic := '0';
begin

    Ar <= '1' when sentido = "00" else '0';
    Ad <= '1' when sentido = "01" else '0';
    Ab <= '1' when sentido = "10" else '0';
    At <= '1' when sentido = "11" else '0';
    -- Proceso para controlar las señales internas según el valor de sentido
    process(sentido,clk)
    begin

       if reset = '1' then
        ena_Ar <= '0';
        ena_Ad <= '0';
        ena_Ab <= '0';
        ena_At <= '0';
        elsif rising_edge(clk) then
        case sentido is
            when "00" =>
                ena_Ar <= '1';
					 ena_Ad <= '0';
					 ena_Ab <= '0';
					 ena_At <= '0';
            when "01" =>
                ena_Ad <= '1';
					 ena_Ar <= '0';
					 ena_Ab <= '0';
					 ena_At <= '0';
            when "10" =>
                ena_Ab <= '1';
					 ena_Ad <= '0';
					 ena_Ar <= '0';
					 ena_At <= '0';
            when "11" =>
                ena_At <= '1';
					 ena_Ad <= '0';
					 ena_Ab <= '0';
					 ena_Ar <= '0';
            when others =>
                -- No hacer nada por defecto, señales ya están inicializadas en '0'
                null;
        end case;
		   end if;
    end process;

    -- Proceso sincronizado con el flanco descendente del clk


end Behavioral;
