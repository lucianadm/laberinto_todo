library verilog;
use verilog.vl_types.all;
entity actualiza_actual is
    port(
        hab_actual      : in     vl_logic;
        sentido         : in     vl_logic_vector(1 downto 0);
        actual_out      : out    vl_logic_vector(3 downto 0)
    );
end actualiza_actual;
