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
    -- Configura todas las salidas a '0' cuando EN es '0'
    Y0 <= '1' when (EN = '1' and A = "0000") else '0';
    Y1 <= '1' when (EN = '1' and A = "0001") else '0';
    Y2 <= '1' when (EN = '1' and A = "0010") else '0';
    Y3 <= '1' when (EN = '1' and A = "0011") else '0';
    Y4 <= '1' when (EN = '1' and A = "0100") else '0';
    Y5 <= '1' when (EN = '1' and A = "0101") else '0';
    Y6 <= '1' when (EN = '1' and A = "0110") else '0';
    Y7 <= '1' when (EN = '1' and A = "0111") else '0';
    Y8 <= '1' when (EN = '1' and A = "1000") else '0';
    Y9 <= '1' when (EN = '1' and A = "1001") else '0';
    Y10 <= '1' when (EN = '1' and A = "1010") else '0';
    Y11 <= '1' when (EN = '1' and A = "1011") else '0';
    Y12 <= '1' when (EN = '1' and A = "1100") else '0';
    Y13 <= '1' when (EN = '1' and A = "1101") else '0';
    Y14 <= '1' when (EN = '1' and A = "1110") else '0';
    Y15 <= '1' when (EN = '1' and A = "1111") else '0';

end Behavioral;
