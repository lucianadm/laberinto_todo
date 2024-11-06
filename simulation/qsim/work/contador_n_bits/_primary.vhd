library verilog;
use verilog.vl_types.all;
entity contador_n_bits is
    port(
        altera_reserved_tms: in     vl_logic;
        altera_reserved_tck: in     vl_logic;
        altera_reserved_tdi: in     vl_logic;
        altera_reserved_tdo: out    vl_logic;
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        max_reached     : out    vl_logic;
        q               : out    vl_logic_vector(4 downto 0)
    );
end contador_n_bits;
