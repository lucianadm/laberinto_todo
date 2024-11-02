library verilog;
use verilog.vl_types.all;
entity casillero_vlg_check_tst is
    port(
        out_value       : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end casillero_vlg_check_tst;
