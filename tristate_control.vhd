library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tristate_control is
    Port (
        -- Entradas de 16 puertos de 4 bits
        input_0  : in  std_logic_vector(3 downto 0);
        input_1  : in  std_logic_vector(3 downto 0);
        input_2  : in  std_logic_vector(3 downto 0);
        input_3  : in  std_logic_vector(3 downto 0);
        input_4  : in  std_logic_vector(3 downto 0);
        input_5  : in  std_logic_vector(3 downto 0);
        input_6  : in  std_logic_vector(3 downto 0);
        input_7  : in  std_logic_vector(3 downto 0);
        input_8  : in  std_logic_vector(3 downto 0);
        input_9  : in  std_logic_vector(3 downto 0);
        input_10 : in  std_logic_vector(3 downto 0);
        input_11 : in  std_logic_vector(3 downto 0);
        input_12 : in  std_logic_vector(3 downto 0);
        input_13 : in  std_logic_vector(3 downto 0);
        input_14 : in  std_logic_vector(3 downto 0);
        input_15 : in  std_logic_vector(3 downto 0);

        -- Líneas de selección de 4 bits
        select_line : in  std_logic_vector(3 downto 0);

        -- Salida triestado de 4 bits
        output_data : out std_logic_vector(3 downto 0)
        
    );
end tristate_control;

architecture Behavioral of tristate_control is
begin
    process(select_line)
    begin
            case select_line is
                when "0000" => output_data <= input_0;
                when "0001" => output_data <= input_1;
                when "0010" => output_data <= input_2;
                when "0011" => output_data <= input_3;
                when "0100" => output_data <= input_4;
                when "0101" => output_data <= input_5;
                when "0110" => output_data <= input_6;
                when "0111" => output_data <= input_7;
                when "1000" => output_data <= input_8;
                when "1001" => output_data <= input_9;
                when "1010" => output_data <= input_10;
                when "1011" => output_data <= input_11;
                when "1100" => output_data <= input_12;
                when "1101" => output_data <= input_13;
                when "1110" => output_data <= input_14;
                when "1111" => output_data <= input_15;
                when others => output_data <= "ZZZZ"; -- Alta impedancia
            end case;
    end process;
end Behavioral;
