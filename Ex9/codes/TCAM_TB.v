
`define data_size 16
`define address_line 4

module TCAM_TB ();

parameter data_size = `data_size;
parameter address_line = `address_line;

reg [data_size-1:0] input_data;
reg clk = 0;
wire [address_line-1:0] match_address;
wire match_found;

TCAM tcam1(input_data, clk, match_address, match_found);

always 
    #5 clk = ~clk;

initial begin
    $dumpfile("TCAM_TB.vcd");
    $dumpvars;
end

initial begin
    input_data = 16'b1111111111111111;
    #10 $display("match address: %d, found: %b", match_address, match_found);

    input_data = 16'b1001001001001001;
    #10 $display("match address: %d, found: %b", match_address, match_found);

    input_data = 16'b0101101001011010;
    #10 $display("match address: %d, found: %b", match_address, match_found);

    input_data = 16'b1111110011001100;
    #10 $display("match address: %d, found: %b", match_address, match_found);

    input_data = 16'b0111000001110000;
    #10 $display("match address: %d, found: %b", match_address, match_found);

    input_data = 16'b1001011010010110;
    #10 $display("match address: %d, found: %b", match_address, match_found);

    input_data = 16'b1010101010101010;
    #10 $display("match address: %d, found: %b", match_address, match_found);

    input_data = 16'b1111001110011110;
    #10 $display("match address: %d, found: %b", match_address, match_found);
    $finish;
end

endmodule

