library verilog;
use verilog.vl_types.all;
entity decoder4to16_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        EN              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end decoder4to16_vlg_sample_tst;
