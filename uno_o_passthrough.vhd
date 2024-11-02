library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity uno_o_passthrough is
    Port (
	    in_bits : in STD_LOGIC_VECTOR(3 downto 0) ;
        in_bit : in  STD_LOGIC;                   -- Entrada de 1 bit
        out_bits : out STD_LOGIC_VECTOR(3 downto 0) -- Salida de 4 bits
    );
end uno_o_passthrough;

architecture Behavioral of uno_o_passthrough is
begin
    process (in_bit)
    begin
        if (in_bit = '1') then
            out_bits <= "1111";  -- Si recibe un '1', entrega cuatro '1's
        else
            out_bits <= in_bits; -- Si recibe un '0', pasa la entrada a la salida (4 bits)
        end if;
    end process;
end Behavioral;

