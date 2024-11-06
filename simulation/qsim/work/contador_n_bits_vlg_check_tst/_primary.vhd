library verilog;
use verilog.vl_types.all;
entity contador_n_bits_vlg_check_tst is
    port(
        max_reached     : in     vl_logic;
        q               : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end contador_n_bits_vlg_check_tst;
