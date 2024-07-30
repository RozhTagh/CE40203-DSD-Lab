library verilog;
use verilog.vl_types.all;
entity controlUnit is
    port(
        B               : in     vl_logic_vector(3 downto 0);
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        A_shift_amount  : out    vl_logic_vector(2 downto 0);
        B_shift_amount  : out    vl_logic_vector(2 downto 0);
        op              : out    vl_logic;
        done            : out    vl_logic
    );
end controlUnit;
