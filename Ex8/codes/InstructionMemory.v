module InstructionMemory(
	input clk,
    input wire [4:0] address,
    output reg [15:0] instruction
);

reg [15:0] memory [31:0];

initial begin
	memory[0] = 16'h0013;
    memory[1] = 16'h1304; // Instruction at address 0
    memory[2] = 16'h2016; // Instruction at address 0
end

always @(*) begin
    instruction <= memory[address];
end

endmodule
