library verilog;
use verilog.vl_types.all;
entity pru_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        D_in_A          : in     vl_logic;
        D_in_B          : in     vl_logic;
        D_in_C          : in     vl_logic;
        D_in_D          : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end pru_vlg_sample_tst;
