module find_one (input [3:0] A, output [1:0] out);

assign out[1] = ~(A[1] | A[0]);
assign out[0] = ~A[0] & (A[1] | ~A[2]);

endmodule