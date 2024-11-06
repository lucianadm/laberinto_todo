library verilog;
use verilog.vl_types.all;
entity matriz is
    port(
        ena_Ar          : out    vl_logic;
        Hab_muro        : out    vl_logic;
        El_reset        : in     vl_logic;
        clk             : in     vl_logic;
        Linea           : in     vl_logic;
        Muro            : in     vl_logic;
        sentido         : out    vl_logic_vector(1 downto 0);
        Hab_sentido     : out    vl_logic;
        D_Abajo         : out    vl_logic;
        D_Arriba        : out    vl_logic;
        D_Adelante      : out    vl_logic;
        D_Atras         : out    vl_logic;
        actual          : out    vl_logic_vector(3 downto 0);
        Hab_Actual      : out    vl_logic;
        ena_Ad          : out    vl_logic;
        ena_Ab          : out    vl_logic;
        ena_At          : out    vl_logic;
        CE1             : out    vl_logic_vector(3 downto 0);
        C10             : out    vl_logic_vector(3 downto 0);
        C11             : out    vl_logic_vector(3 downto 0);
        C12             : out    vl_logic_vector(3 downto 0);
        C13             : out    vl_logic_vector(3 downto 0);
        C23             : out    vl_logic;
        C22             : out    vl_logic;
        C21             : out    vl_logic;
        C20             : out    vl_logic;
        C3              : out    vl_logic_vector(3 downto 0);
        C4              : out    vl_logic_vector(3 downto 0);
        C5              : out    vl_logic_vector(3 downto 0);
        C6              : out    vl_logic_vector(3 downto 0);
        C7              : out    vl_logic_vector(3 downto 0);
        C8              : out    vl_logic_vector(3 downto 0);
        C9              : out    vl_logic_vector(3 downto 0);
        dir_Abajo       : out    vl_logic_vector(3 downto 0);
        dir_Adelante    : out    vl_logic_vector(3 downto 0);
        dir_Arriba      : out    vl_logic_vector(3 downto 0);
        dir_Atras       : out    vl_logic_vector(3 downto 0);
        fin             : out    vl_logic;
        H               : out    vl_logic_vector(1 downto 0);
        ADC_DOUT        : in     vl_logic;
        Hab_accion      : out    vl_logic;
        locked          : out    vl_logic;
        velD            : out    vl_logic;
        velI            : out    vl_logic;
        ADC_SCLK        : out    vl_logic;
        ADC_CS_N        : out    vl_logic;
        ADC_DIN         : out    vl_logic;
        Izq_cerca       : out    vl_logic;
        Der_cerca       : out    vl_logic;
        C2              : out    vl_logic;
        accion_out      : out    vl_logic_vector(1 downto 0);
        CH0             : out    vl_logic_vector(11 downto 0);
        CH1             : out    vl_logic_vector(11 downto 0);
        MD              : out    vl_logic_vector(1 downto 0);
        MI              : out    vl_logic_vector(1 downto 0);
        sentido_nw      : out    vl_logic_vector(1 downto 0)
    );
end matriz;
