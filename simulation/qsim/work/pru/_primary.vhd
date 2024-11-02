library verilog;
use verilog.vl_types.all;
entity pru is
    port(
        c0              : out    vl_logic_vector(3 downto 0);
        D_in_A          : in     vl_logic;
        D_in_B          : in     vl_logic;
        D_in_C          : in     vl_logic;
        D_in_D          : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        c1              : out    vl_logic_vector(3 downto 0)
    );
end pru;
