module booth_TB ();
reg signed [3:0] A; 
reg signed [3:0] B; 
reg reset = 0, clk = 1;
wire signed [7:0] result;
wire done;

booth MUL (A, B, reset, clk, result, done);

always #10 
    clk = ~clk;

initial begin
    #20; 
    A=-5; B=4; reset = 1;
    #20 reset = 0;
    wait (done);
    $display("%d * %d = %d", A, B, result);

    #20;
    A=7; B=2; reset = 1;
    #20 reset = 0;
    wait (done);
    $display("%d * %d = %d", A, B, result);

    #20;
    A=-8; B=-7; reset = 1;
    #20 reset = 0; 
    wait (done);
    $display("%d * %d = %d", A, B, result);

    #20;
    A=6; B=-1; reset = 1;
    #20 reset = 0;
    wait (done);
    $display("%d * %d = %d", A, B, result);

    #20;
    A=0; B=2; reset = 1;
    #20 reset = 0; 
    wait (done);
    $display("%d * %d = %d", A, B, result);

    $stop;
    $finish;
end
endmodule