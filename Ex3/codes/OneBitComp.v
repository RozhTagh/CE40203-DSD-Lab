module OneBitComp	(input g, e, l, a, b,
					output g_out, e_out, l_out);
		assign e_out = e & (a == b);
		assign g_out = g | (e & (a > b));
		assign l_out = l | (e & (a < b));
endmodule
