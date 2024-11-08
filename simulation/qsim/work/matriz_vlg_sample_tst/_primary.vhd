library verilog;
use verilog.vl_types.all;
entity matriz_vlg_sample_tst is
    port(
        ADC_DOUT        : in     vl_logic;
        clk             : in     vl_logic;
        Der_Cerc        : in     vl_logic;
        El_reset        : in     vl_logic;
        Izq_Cerc        : in     vl_logic;
        Linea           : in     vl_logic;
        Muro            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end matriz_vlg_sample_tst;
