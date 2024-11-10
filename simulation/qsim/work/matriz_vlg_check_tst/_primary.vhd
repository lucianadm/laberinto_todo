library verilog;
use verilog.vl_types.all;
entity matriz_vlg_check_tst is
    port(
        Ab              : in     vl_logic_vector(3 downto 0);
        Abajo           : in     vl_logic_vector(3 downto 0);
        accion_out      : in     vl_logic_vector(1 downto 0);
        actual          : in     vl_logic_vector(3 downto 0);
        Ad              : in     vl_logic_vector(3 downto 0);
        ADC_CS_N        : in     vl_logic;
        ADC_DIN         : in     vl_logic;
        ADC_SCLK        : in     vl_logic;
        Adelante        : in     vl_logic_vector(3 downto 0);
        Ar              : in     vl_logic_vector(3 downto 0);
        Arriba          : in     vl_logic_vector(3 downto 0);
        At              : in     vl_logic_vector(3 downto 0);
        Atras           : in     vl_logic_vector(3 downto 0);
        c2              : in     vl_logic;
        C10             : in     vl_logic_vector(3 downto 0);
        C11             : in     vl_logic_vector(3 downto 0);
        C12             : in     vl_logic_vector(3 downto 0);
        C13             : in     vl_logic_vector(3 downto 0);
        CH0             : in     vl_logic_vector(11 downto 0);
        CH1             : in     vl_logic_vector(11 downto 0);
        D_Abajo         : in     vl_logic;
        D_Adelante      : in     vl_logic;
        D_Arriba        : in     vl_logic;
        D_Atras         : in     vl_logic;
        Der_cerca       : in     vl_logic;
        dir_Abajo       : in     vl_logic_vector(3 downto 0);
        dir_Adelante    : in     vl_logic_vector(3 downto 0);
        dir_Arriba      : in     vl_logic_vector(3 downto 0);
        dir_Atras       : in     vl_logic_vector(3 downto 0);
        ena_Ab          : in     vl_logic;
        ena_Ad          : in     vl_logic;
        ena_Ar          : in     vl_logic;
        ena_At          : in     vl_logic;
        fin             : in     vl_logic;
        H               : in     vl_logic_vector(1 downto 0);
        Hab_accion      : in     vl_logic;
        Hab_Actual      : in     vl_logic;
        Hab_muro        : in     vl_logic;
        Hab_sentido     : in     vl_logic;
        Izq_cerca       : in     vl_logic;
        locked          : in     vl_logic;
        m_Ab            : in     vl_logic;
        m_Ad            : in     vl_logic;
        m_Ar            : in     vl_logic;
        m_At            : in     vl_logic;
        MD              : in     vl_logic_vector(1 downto 0);
        MI              : in     vl_logic_vector(1 downto 0);
        quieto          : in     vl_logic;
        sentido         : in     vl_logic_vector(1 downto 0);
        sentido_nw      : in     vl_logic_vector(1 downto 0);
        velD            : in     vl_logic;
        velI            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end matriz_vlg_check_tst;
