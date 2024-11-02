library verilog;
use verilog.vl_types.all;
entity casillero_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        C               : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        D               : in     vl_logic_vector(3 downto 0);
        D_in_A          : in     vl_logic;
        D_in_B          : in     vl_logic;
        D_in_C          : in     vl_logic;
        D_in_D          : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end casillero_vlg_sample_tst;
