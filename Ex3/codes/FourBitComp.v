module FourBitComp  (input[3:0] a, input[3:0] b,
					output g, e, l);
		wire c [8:0];
		OneBitComp c3(1'b0, 1'b1, 1'b0, a[3], b[3], c[8], c[7], c[6]);
		OneBitComp c2(c[8], c[7], c[6], a[2], b[2], c[5], c[4], c[3]);
		OneBitComp c1(c[5], c[4], c[3], a[1], b[1], c[2], c[1], c[0]);
		OneBitComp c0(c[2], c[1], c[0], a[0], b[0], g, e, l);
endmodule
