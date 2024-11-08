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
    signal Ar_i, Ad_i, Ab_i, At_i      : std_logic := '0';
    signal ena_Ar_i, ena_Ad_i, ena_Ab_i, ena_At_i : std_logic := '0';
begin
    -- Proceso para controlar las señales internas según el valor de sentido
    process(sentido)
    begin

       if reset = '1' then
        Ar_i <= '0';
        Ad_i <= '0';
        Ab_i <= '0';
        At_i <= '0';
        ena_Ar_i <= '0';
        ena_Ad_i <= '0';
        ena_Ab_i <= '0';
        ena_At_i <= '0';
        else
        -- Comportamiento basado en el valor de sentido
        case sentido is
            when "00" =>
                Ar_i <= '1';
                ena_Ar_i <= '1';
            when "01" =>
                Ad_i <= '1';
                ena_Ad_i <= '1';
            when "10" =>
                Ab_i <= '1';
                ena_Ab_i <= '1';
            when "11" =>
                At_i <= '1';
                ena_At_i <= '1';
            when others =>
                -- No hacer nada por defecto, señales ya están inicializadas en '0'
                null;
        end case;
		   end if;
    end process;

    -- Proceso sincronizado con el flanco descendente del clk
    process(reset,clk)
    begin
	         if reset = '1' then
            -- Inicializa todos los flip-flops a '0' cuando reset está activo
            Ar     <= '0';
            Ad     <= '0';
            Ab     <= '0';
            At     <= '0';
            ena_Ar <= '0';
            ena_Ad <= '0';
            ena_Ab <= '0';
            ena_At <= '0';
        elsif rising_edge(clk) then
            -- Transferir los valores de las señales internas a las salidas
            Ar     <= Ar_i;
            Ad     <= Ad_i;
            Ab     <= Ab_i;
            At     <= At_i;
            ena_Ar <= ena_Ar_i;
            ena_Ad <= ena_Ad_i;
            ena_Ab <= ena_Ab_i;
            ena_At <= ena_At_i;
        end if;
    end process;

end Behavioral;
