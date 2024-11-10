library verilog;
use verilog.vl_types.all;
entity decoder4to16 is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        EN              : in     vl_logic;
        Y0              : out    vl_logic;
        Y1              : out    vl_logic;
        Y2              : out    vl_logic;
        Y3              : out    vl_logic;
        Y4              : out    vl_logic;
        Y5              : out    vl_logic;
        Y6              : out    vl_logic;
        Y7              : out    vl_logic;
        Y8              : out    vl_logic;
        Y9              : out    vl_logic;
        Y10             : out    vl_logic;
        Y11             : out    vl_logic;
        Y12             : out    vl_logic;
        Y13             : out    vl_logic;
        Y14             : out    vl_logic;
        Y15             : out    vl_logic
    );
end decoder4to16;
