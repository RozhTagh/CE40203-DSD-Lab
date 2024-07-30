module controlUnit (
input [3:0] B,
input rst,
input clk,
output [2:0] A_shift_amount, output [2:0] B_shift_amount, output op,
output done);

reg [2:0] shifted;
reg first_clock;
wire [1:0] one_index;
wire [2:0] zero_index;

find_one first_one(B,one_index);
find_zero first_zero (B, zero_index);

assign op = B[0] & (~first_clock);
assign B_shift_amount = op ? zero_index : {1'b0, one_index};
assign A_shift_amount = shifted + B_shift_amount;
assign done = shifted + B_shift_amount >= 4;

always @(posedge clk) begin
    if (rst) begin 
        shifted <= 0; 
        first_clock <= 1;
    end 
    else begin
        first_clock <= 0;
        shifted <= shifted + B_shift_amount;
    end 
end

endmodule