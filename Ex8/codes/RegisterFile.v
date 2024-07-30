module RegisterFile(
    input wire clk,
    input wire [4:0] read_addr1,
    input wire [4:0] read_addr2,
    input wire [4:0] write_addr,
    input wire write_enable,
    input wire [31:0] write_data,
    output reg [31:0] read_data1,
    output reg [31:0] read_data2
);

reg [31:0] registers [15:0];

initial begin
    registers[0] = 32'h00010002; // Example: Higher 16 bits: 0001, Lower 16 bits: 0002
    registers[1] = 32'h00030004; // Example: Higher 16 bits: 0003, Lower 16 bits: 0004
end

always @(*) begin
	read_data1 <= registers[read_addr1];
    read_data2 <= registers[read_addr2];
end

always @(posedge clk) begin
	if (write_enable) begin
        registers[write_addr] <= write_data;
    end
end


endmodule
