library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder4to16 is
    Port (
        A  : in  STD_LOGIC_VECTOR(3 downto 0); -- Entrada de 4 bits
        EN : in  STD_LOGIC;                    -- Señal de habilitación
        Y0 : out STD_LOGIC;
        Y1 : out STD_LOGIC;
        Y2 : out STD_LOGIC;
        Y3 : out STD_LOGIC;
        Y4 : out STD_LOGIC;
        Y5 : out STD_LOGIC;
        Y6 : out STD_LOGIC;
        Y7 : out STD_LOGIC;
        Y8 : out STD_LOGIC;
        Y9 : out STD_LOGIC;
        Y10 : out STD_LOGIC;
        Y11 : out STD_LOGIC;
        Y12 : out STD_LOGIC;
        Y13 : out STD_LOGIC;
        Y14 : out STD_LOGIC;
        Y15 : out STD_LOGIC
    );
end decoder4to16;

architecture Behavioral of decoder4to16 is
begin
    process (A, EN)
    begin
        -- Inicializar todas las salidas a '0'
        Y0 <= '0';
        Y1 <= '0';
        Y2 <= '0';
        Y3 <= '0';
        Y4 <= '0';
        Y5 <= '0';
        Y6 <= '0';
        Y7 <= '0';
        Y8 <= '0';
        Y9 <= '0';
        Y10 <= '0';
        Y11 <= '0';
        Y12 <= '0';
        Y13 <= '0';
        Y14 <= '0';
        Y15 <= '0';
        
        if EN = '1' then
            -- Activar una de las salidas basadas en el valor de la entrada A
            case A is
                when "0000" => Y0  <= '1';
                when "0001" => Y1  <= '1';
                when "0010" => Y2  <= '1';
                when "0011" => Y3  <= '1';
                when "0100" => Y4  <= '1';
                when "0101" => Y5  <= '1';
                when "0110" => Y6  <= '1';
                when "0111" => Y7  <= '1';
                when "1000" => Y8  <= '1';
                when "1001" => Y9  <= '1';
                when "1010" => Y10 <= '1';
                when "1011" => Y11 <= '1';
                when "1100" => Y12 <= '1';
                when "1101" => Y13 <= '1';
                when "1110" => Y14 <= '1';
                when "1111" => Y15 <= '1';
                when others => null; -- No hacer nada para otras entradas
            end case;
        end if;
    end process;
end Behavioral;
