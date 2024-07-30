module booth (
input [3:0] multiplicand,
input [3:0] multiplier,
input rst,
input clk,
output [7:0] result, 
output done);

wire [2:0] A_shift_amount;
wire [2:0] B_shift_amount; 
wire [3:0] B;

controlUnit CU (B, rst, clk, A_shift_amount, B_shift_amount, op, done);
datapath DP (multiplicand, multiplier, rst, clk, A_shift_amount, B_shift_amount, op, done, result, B); 

endmodule
