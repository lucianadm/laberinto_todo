library verilog;
use verilog.vl_types.all;
entity control is
    port(
        reset           : in     vl_logic;
        clock           : in     vl_logic;
        Linea           : in     vl_logic;
        Muro            : in     vl_logic;
        Hab_sentido     : out    vl_logic;
        Hab_Actual      : out    vl_logic;
        Hab_muro        : out    vl_logic;
        Hab_accion      : out    vl_logic
    );
end control;
