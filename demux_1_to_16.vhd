library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Declaración de la entidad
entity demux_1_to_16 is
    Port (
        D   : in  STD_LOGIC;                   -- Entrada de señal
        SEL : in  STD_LOGIC_VECTOR(3 downto 0);  -- Entradas de selección (4 bits)
        Y0  : out STD_LOGIC;
        Y1  : out STD_LOGIC;
        Y2  : out STD_LOGIC;
        Y3  : out STD_LOGIC;
        Y4  : out STD_LOGIC;
        Y5  : out STD_LOGIC;
        Y6  : out STD_LOGIC;
        Y7  : out STD_LOGIC;
        Y8  : out STD_LOGIC;
        Y9  : out STD_LOGIC;
        Y10 : out STD_LOGIC;
        Y11 : out STD_LOGIC;
        Y12 : out STD_LOGIC;
        Y13 : out STD_LOGIC;
        Y14 : out STD_LOGIC;
        Y15 : out STD_LOGIC
    );
end demux_1_to_16;

-- Descripción de la arquitectura
architecture Behavioral of demux_1_to_16 is
begin
    process(D, SEL)
    begin
        -- Inicializamos todas las salidas a '0'
        Y0  <= '0';
        Y1  <= '0';
        Y2  <= '0';
        Y3  <= '0';
        Y4  <= '0';
        Y5  <= '0';
        Y6  <= '0';
        Y7  <= '0';
        Y8  <= '0';
        Y9  <= '0';
        Y10 <= '0';
        Y11 <= '0';
        Y12 <= '0';
        Y13 <= '0';
        Y14 <= '0';
        Y15 <= '0';

        -- Activamos solo la salida seleccionada por 'SEL'
        case SEL is
            when "0000" => Y0  <= D;
            when "0001" => Y1  <= D;
            when "0010" => Y2  <= D;
            when "0011" => Y3  <= D;
            when "0100" => Y4  <= D;
            when "0101" => Y5  <= D;
            when "0110" => Y6  <= D;
            when "0111" => Y7  <= D;
            when "1000" => Y8  <= D;
            when "1001" => Y9  <= D;
            when "1010" => Y10 <= D;
            when "1011" => Y11 <= D;
            when "1100" => Y12 <= D;
            when "1101" => Y13 <= D;
            when "1110" => Y14 <= D;
            when "1111" => Y15 <= D;
            when others => 
                -- En caso de un valor inválido en 'SEL', no activar ninguna salida
                Y0  <= '0';
                Y1  <= '0';
                Y2  <= '0';
                Y3  <= '0';
                Y4  <= '0';
                Y5  <= '0';
                Y6  <= '0';
                Y7  <= '0';
                Y8  <= '0';
                Y9  <= '0';
                Y10 <= '0';
                Y11 <= '0';
                Y12 <= '0';
                Y13 <= '0';
                Y14 <= '0';
                Y15 <= '0';
        end case;
    end process;
end Behavioral;
