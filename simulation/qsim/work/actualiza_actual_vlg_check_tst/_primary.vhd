library verilog;
use verilog.vl_types.all;
entity actualiza_actual_vlg_check_tst is
    port(
        actual_out      : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end actualiza_actual_vlg_check_tst;
