library verilog;
use verilog.vl_types.all;
entity control_motor_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        D               : in     vl_logic;
        fin             : in     vl_logic;
        I               : in     vl_logic;
        Llego           : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end control_motor_vlg_sample_tst;
