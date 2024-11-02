library verilog;
use verilog.vl_types.all;
entity control_vlg_check_tst is
    port(
        Hab_accion      : in     vl_logic;
        Hab_Actual      : in     vl_logic;
        Hab_muro        : in     vl_logic;
        Hab_sentido     : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end control_vlg_check_tst;
