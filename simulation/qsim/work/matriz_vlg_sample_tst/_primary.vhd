library verilog;
use verilog.vl_types.all;
entity matriz_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        Linea           : in     vl_logic;
        Muro            : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end matriz_vlg_sample_tst;
