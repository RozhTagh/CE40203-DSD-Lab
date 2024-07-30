module Processor(
    input wire clk,
    output reg [4:0] pc,
    output wire [31:0] result,
    output wire [15:0] instruction,
    output wire [31:0] data_1,
    output wire [31:0] data_2
);

// Instantiate Instruction Memory
InstructionMemory instr_memory(
	.clk(clk),
    .address(pc),
    .instruction(instruction)
);

// Instantiate Register File
RegisterFile reg_file_inst(
    .clk(clk),
    .read_addr1(instruction[11:8]),
    .read_addr2(instruction[7:4]),
    .write_addr(instruction[3:0]),
    .write_enable(1'b1),
    .write_data(result),
    .read_data1(data_1),
    .read_data2(data_2)
);

// Instantiate ALU
ComplexALU alu(
    .operand1(data_1),
    .operand2(data_2),
    .opcode(instruction[15:12]),
    .result(result)
);

always @(posedge clk) begin
    pc <= pc + 1;
end

endmodule
