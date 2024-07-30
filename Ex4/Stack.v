module Stack(
	input [3:0] data_in,
	input push,
	input pop,
	input rst,
	input clk,
	output reg [3:0] data_out,
	output reg full,
	output reg empty,
	output reg [3:0] sp
);

reg [3:0] stack_data[7:0];

integer i;
always @(posedge clk) begin
	if(rst == 1) begin
		for(i = 0; i < 8; i = i + 1) begin
			stack_data[i] = 0;
		end
		sp = 0;
		empty = 0;
		full = 0;
		data_out = 0;
	end
	if(push == 1 && full == 0) begin
		stack_data[sp] = data_in;
		sp = sp + 1;
	end
	if(pop == 1 && empty == 1) begin
		sp = sp - 1;
		data_out = stack_data[sp];
	end
	if(sp == 8) begin
		full = 1;
	end else begin
		full = 0;
	end
	if(sp == 0) begin
		empty = 0;
	end else begin
		empty = 1;
	end
end

endmodule