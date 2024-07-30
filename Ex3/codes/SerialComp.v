module SerialComp (input clk , input reset , input a , input b,
output greater_out , output equal_out , output lower_out);
    
    wire greater_in , equal_in , lower_in;
    wire not_greater_out , not_equal_out , not_lower_out;
    wire tmp_not_greater_out, tmp_not_equal_out, tmp_not_lower_out;
    wire tmp_greater_out, tmp_equal_out, tmp_lower_out;

    assign equal_in = reset | (((a == b) & equal_out) & (~reset));
    assign greater_in = (~reset) & (((a > b) & equal_out) | greater_out);
    assign lower_in = (~reset) & (((a < b) & equal_out) | lower_out);

    assign tmp_equal_out = ~(tmp_not_equal_out & ~(~clk & equal_in));
    assign tmp_not_equal_out = ~(tmp_equal_out & ~(~clk & ~(equal_in)));

    assign tmp_greater_out = ~(tmp_not_greater_out & ~(~clk & greater_in));
    assign tmp_not_greater_out = ~(tmp_greater_out & ~(~clk & ~(greater_in)));

    assign tmp_lower_out = ~(tmp_not_lower_out & ~(~clk & lower_in));
    assign tmp_not_lower_out = ~(tmp_lower_out & ~(~clk & ~(lower_in)));

    assign greater_out = clk ? tmp_greater_out : greater_out;
    assign lower_out = clk ? tmp_lower_out : lower_out;
    assign equal_out = clk ? tmp_equal_out : equal_out;
endmodule