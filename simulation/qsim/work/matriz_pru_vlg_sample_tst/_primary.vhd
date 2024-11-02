library verilog;
use verilog.vl_types.all;
entity matriz_pru_vlg_sample_tst is
    port(
        B               : in     vl_logic_vector(3 downto 0);
        CE              : in     vl_logic_vector(3 downto 0);
        clk             : in     vl_logic;
        D_in_A          : in     vl_logic;
        D_in_B          : in     vl_logic;
        D_in_C          : in     vl_logic;
        D_in_D          : in     vl_logic;
        ena             : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end matriz_pru_vlg_sample_tst;
