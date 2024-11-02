library verilog;
use verilog.vl_types.all;
entity control_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        Linea           : in     vl_logic;
        Muro            : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end control_vlg_sample_tst;
