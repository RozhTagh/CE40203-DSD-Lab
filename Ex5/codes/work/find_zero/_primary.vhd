library verilog;
use verilog.vl_types.all;
entity find_zero is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(2 downto 0)
    );
end find_zero;
