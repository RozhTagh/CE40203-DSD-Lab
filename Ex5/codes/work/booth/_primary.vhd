library verilog;
use verilog.vl_types.all;
entity booth is
    port(
        multiplicand    : in     vl_logic_vector(3 downto 0);
        multiplier      : in     vl_logic_vector(3 downto 0);
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        result          : out    vl_logic_vector(7 downto 0);
        done            : out    vl_logic
    );
end booth;
