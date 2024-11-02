library verilog;
use verilog.vl_types.all;
entity actualiza_actual_vlg_sample_tst is
    port(
        hab_actual      : in     vl_logic;
        sentido         : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end actualiza_actual_vlg_sample_tst;
