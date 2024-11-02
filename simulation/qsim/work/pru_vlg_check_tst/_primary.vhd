library verilog;
use verilog.vl_types.all;
entity pru_vlg_check_tst is
    port(
        c0              : in     vl_logic_vector(3 downto 0);
        c1              : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end pru_vlg_check_tst;
