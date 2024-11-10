library verilog;
use verilog.vl_types.all;
entity control_motor is
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        A               : in     vl_logic_vector(1 downto 0);
        fin             : in     vl_logic;
        D               : in     vl_logic;
        I               : in     vl_logic;
        Llego           : in     vl_logic;
        MD              : out    vl_logic_vector(1 downto 0);
        MI              : out    vl_logic_vector(1 downto 0);
        H               : out    vl_logic_vector(1 downto 0)
    );
end control_motor;
