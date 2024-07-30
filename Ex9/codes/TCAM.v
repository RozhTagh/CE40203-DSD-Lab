`define data_size 16
`define address_line 4

module TCAM (input_data, clk, match_address, match_found);

parameter data_size = `data_size;
parameter address_line = `address_line;

input clk;
input [data_size-1:0] input_data;
output reg [address_line-1:0] match_address;
output reg match_found;

reg [data_size-1:0] register_file [(1 << address_line)-1:0];
reg [data_size-1:0] dont_care_register_file [(1 << address_line)-1:0];
reg [data_size-1:0] data;
reg [data_size-1:0] mask;

initial begin
    register_file[0] = 16'b1010101010101010;
    register_file[1] = 16'b1001001001001001;
    register_file[2] = 16'b1100110011001100;
    register_file[3] = 16'b1110001110001110;
    register_file[4] = 16'b1001110010100011;
    register_file[5] = 16'b0101010101010101;
    register_file[6] = 16'b1111111111111111;
    register_file[7] = 16'b0000000000000000;
    register_file[8] = 16'b1010010110100101;
    register_file[9] = 16'b1001100110011001;
    register_file[10] = 16'b0011110000111100;
    register_file[11] = 16'b1010101001010101;
    register_file[12] = 16'b0011011110110110;
    register_file[13] = 16'b1100111000111100;
    register_file[14] = 16'b1001011001011001;
    register_file[15] = 16'b0011010011010011;

    dont_care_register_file[0] = 16'b1111111111111111;
    dont_care_register_file[1] = 16'b1111111111111111;
    dont_care_register_file[2] = 16'b1100111111001111;
    dont_care_register_file[3] = 16'b1100111111001111;
    dont_care_register_file[4] = 16'b0011110000111100;
    dont_care_register_file[5] = 16'b0011110000111100;
    dont_care_register_file[6] = 16'b1000111110001111;
    dont_care_register_file[7] = 16'b1000111110001111;
    dont_care_register_file[8] = 16'b1111111111111111;
    dont_care_register_file[9] = 16'b1111111111111111;
    dont_care_register_file[10] = 16'b1100111111001111;
    dont_care_register_file[11] = 16'b1100111111001111;
    dont_care_register_file[12] = 16'b0011110000111100;
    dont_care_register_file[13] = 16'b0011110000111100;
    dont_care_register_file[14] = 16'b1000111110001111;
    dont_care_register_file[15] = 16'b1000111110001111;
end

integer i, j, match_count;

always @(posedge clk) begin
    match_address = 4'b0;
    match_found = 0;

    for(i = 0; i < (1 << address_line); i = i+1) begin
        if(!match_found) begin
            match_count = 0;
            data = register_file[i];
            mask = dont_care_register_file[i];

            for (j = 0; j < data_size; j = j+1) begin
                if(!mask[j])
                    match_count = match_count+1;

                else if(data[j] == input_data[j])
                    match_count = match_count+1;
            end

            if(match_count == data_size) begin
                match_address = i;
                match_found = 1;
            end
        end
    end
end

endmodule