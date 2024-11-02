library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity casillero is
    Port (
        -- Entradas de 4 bits cada una (con valor predeterminado "1111" cuando no están conectadas)
        --A, B, C, D : in std_logic_vector(3 downto 0);
		    Arriba, Adelante, Abajo, Atras : in std_logic_vector(3 downto 0);
        -- Entradas de los flip-flops D (para controlar la selección de los multiplexores)
        D_Arriba, D_Adelante, D_Abajo, D_Atras : in std_logic :='0';
			ena_Ar,ena_Ad,ena_Ab,ena_At : in std_logic;
        -- Reloj para los flip-flops D
        clk : in std_logic;

        -- Señal de reset
        reset : in std_logic;
        -- Señal de habilitacion
        
        -- Salida de 4 bits
        out_value : out std_logic_vector(3 downto 0)
    );
end casillero;

architecture Behavioral of casillero is

    -- Señales internas para las salidas de los multiplexores
    --signal mux_A_out, mux_B_out, mux_C_out, mux_D_out,inA,inB,inC,inD : unsigned(3 downto 0);
	   signal mux_Arriba, mux_Adelante, mux_Abajo, mux_Atras,inArriba,inAdelante,inAbajo,inAtras : unsigned(3 downto 0);

    -- Señales internas para los flip-flops D (usadas como señales de selección)
    signal sel_Arriba, sel_Adelante, sel_Abajo, sel_Atras : std_logic;

    -- Señal para almacenar el valor mínimo
    signal min_value : unsigned(3 downto 0);
  signal registro,min_suma : STD_LOGIC_VECTOR(3 downto 0); 
begin

    process(Arriba, reset)
    begin
        if reset = '0' then
            inArriba <= unsigned(Arriba);  -- Selecciona la entrada A si sel es '0'
        else
            inArriba <= "1100";  -- Selecciona la entrada B si sel es '1'
        end if;
    end process;
	 
    process(Adelante, reset)
    begin
        if reset = '0' then
            inAdelante <= unsigned(Adelante);  -- Selecciona la entrada A si sel es '0'
        else
            inAdelante <= "1100";  -- Selecciona la entrada B si sel es '1'
        end if;
    end process;
	 
    process(Abajo, reset)
    begin
        if reset = '0' then
            inAbajo <= unsigned(Abajo);   -- Selecciona la entrada A si sel es '0'
        else
            inAbajo <= "1100";  -- Selecciona la entrada B si sel es '1'
        end if;
    end process;
	 
    process(Atras, reset)
    begin
        if reset = '0' then
            inAtras <=unsigned(Atras);   -- Selecciona la entrada A si sel es '0'
        else
            inAtras <= "1100";  -- Selecciona la entrada B si sel es '1'
        end if;
    end process;	 
	 
    -- MUX para la entrada A----------------
    process(inArriba, sel_Arriba)
    begin
        if sel_Arriba = '1' then
            mux_Arriba <= "1100";  -- Cuatro unos
        else
            mux_Arriba <=  inArriba; -- Entradas reales
        end if;
    end process;

    -- MUX para la entrada B
    process(inAdelante, sel_Adelante)
    begin
        if sel_Adelante = '1' then
            mux_Adelante <= "1100";
        else
            mux_Adelante <=  inAdelante; 
        end if;
    end process;

    -- MUX para la entrada C
    process(inAbajo, sel_Abajo)
    begin
        if sel_Abajo = '1' then
            mux_Abajo <= "1100";
        else
            mux_Abajo <=  inAbajo; 
        end if;
    end process;

    -- MUX para la entrada D
    process(inAtras, sel_Atras)
    begin
        if sel_Atras = '1' then
            mux_Atras <= "1100";
        else
            mux_Atras <= inAtras; 
        end if;
    end process;
	--clk_reset<=clk and reset;
    -- Flip-flop D para controlar la selección de los multiplexores con reset asíncrono
    process(clk, reset)
    begin
        if reset = '1' then
            -- Inicializa todos los flip-flops a '0' cuando reset está activo
            sel_Arriba <= '0';
            sel_Adelante <= '0';
            sel_Abajo <= '0';
            sel_Atras <= '0';
        elsif rising_edge(clk) then
		  if ena_Ar = '1' then
            -- Actualiza los flip-flops en el borde de subida del reloj
            sel_Arriba <= D_Arriba;
     		elsif ena_Ad = '1' then
			   sel_Adelante <= D_Adelante;
			elsif ena_Ab = '1' then
			    sel_Abajo <= D_Abajo;
			elsif ena_At = '1' then
            sel_Atras <= D_Atras;			
			end if;
        end if;
    end process;
	 

 min_value <= mux_Arriba when (mux_Arriba <= mux_Adelante) and (mux_Arriba <= mux_Abajo) and (mux_Arriba <= mux_Atras) else
              mux_Adelante when (mux_Adelante <= mux_Arriba) and (mux_Adelante <= mux_Abajo) and (mux_Adelante<= mux_Atras) else
              mux_Abajo when (mux_Abajo <= mux_Arriba) and (mux_Abajo <= mux_Adelante) and (mux_Abajo <= mux_Atras) else
              mux_Atras; 
    -- Sumar 1 al valor mínimo y asignar a la salida
    min_suma <= std_logic_vector(min_value + to_unsigned(1, 4));
	 

    process(clk, reset)
    begin
        if reset = '1' then
            -- Resetear el registro a 0 cuando rst está activo
            registro <= "1100";
        elsif rising_edge(clk) then
            -- Al flanco de subida del reloj, registrar la entrada combinacional
            registro <=  min_suma;
        end if;
    end process;

    -- Atsignar el valor registrado a la salida
    out_value <= registro;
	 
--
    --out_value <= std_logic_vector(min_value);
end Behavioral;
