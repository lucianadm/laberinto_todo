library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contador_n_bits is
    generic (
        N : integer := 8  -- Número de bits del contador
    );
    port (
        clk        : in  std_logic;
        enable     : in  std_logic;
        reset      : in  std_logic;
        max_reached : out std_logic
    );
end contador_n_bits;

architecture Behavioral of contador_n_bits is
    signal contador : std_logic_vector(N-1 downto 0) := (others => '0');
    signal max_value : std_logic_vector(N-1 downto 0) := (others => '1'); -- Valor máximo de cuenta
begin

    process(clk, reset)
    begin
        if reset = '1' then
            contador <= (others => '0');        -- Reiniciar el contador
            max_reached <= '0';                 -- Reiniciar la señal de cuenta máxima
        elsif rising_edge(clk) then
            if enable = '1' then
                if contador = max_value then    -- Si alcanza el valor máximo
                    contador <= (others => '0'); -- Reiniciar el contador
                    max_reached <= '1';         -- Señalizar que alcanzó el valor máximo
                else
                    contador <= contador + 1;   -- Incrementar el contador
                    max_reached <= '0';         -- Mantener la señal de cuenta máxima en 0
                end if;
            end if;
        end if;
    end process;

end Behavioral;