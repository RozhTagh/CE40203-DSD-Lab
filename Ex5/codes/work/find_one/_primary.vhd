library verilog;
use verilog.vl_types.all;
entity find_one is
    port(
        A               : in     vl_logic_vector(3 downto 0);
        \out\           : out    vl_logic_vector(1 downto 0)
    );
end find_one;
