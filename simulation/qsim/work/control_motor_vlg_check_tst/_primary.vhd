library verilog;
use verilog.vl_types.all;
entity control_motor_vlg_check_tst is
    port(
        H               : in     vl_logic_vector(1 downto 0);
        MD              : in     vl_logic_vector(1 downto 0);
        MI              : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end control_motor_vlg_check_tst;
