library verilog;
use verilog.vl_types.all;
entity matriz_pru is
    port(
        C0              : out    vl_logic_vector(3 downto 0);
        D_in_A          : in     vl_logic;
        D_in_B          : in     vl_logic;
        D_in_C          : in     vl_logic;
        D_in_D          : in     vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        ena             : in     vl_logic;
        CE              : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0)
    );
end matriz_pru;
