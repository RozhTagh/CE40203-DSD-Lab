module datapath (
input [3:0] multiplicand,
input [3:0] multiplier,
input rst,
input clk,
input [2:0] A_shift_amount,
input [2:0] B_shift_amount,
input op,
input done,
output reg [7:0] result,
output reg [3:0] B);

reg[7:0] A;

always @(posedge clk) begin
    if (rst) begin
        A <= {{4{multiplicand[3]}}, multiplicand}; 
        B <= {{4{multiplier[3]}}, multiplier};
        result <= 0;
    end 
    
    else if (~done) begin
        B <= B >> B_shift_amount; 
        if(op == 1)
            result <= result + (A << A_shift_amount);
        if(op == 0)
            result <= result - (A << A_shift_amount);
    end
end 

endmodule