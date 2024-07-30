library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        multiplicand    : in     vl_logic_vector(3 downto 0);
        multiplier      : in     vl_logic_vector(3 downto 0);
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        A_shift_amount  : in     vl_logic_vector(2 downto 0);
        B_shift_amount  : in     vl_logic_vector(2 downto 0);
        op              : in     vl_logic;
        done            : in     vl_logic;
        result          : out    vl_logic_vector(7 downto 0);
        B               : out    vl_logic_vector(3 downto 0)
    );
end datapath;
