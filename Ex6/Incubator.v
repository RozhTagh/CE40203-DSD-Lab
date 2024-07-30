module Incubator(
    input signed [7:0] temprature,
    input clk,
    input rst,
    output reg cooler,
    output reg heater,
    output reg [3:0] fan
);

always @(posedge clk) begin
    if (rst) begin
        cooler = 0;
        heater = 0;
        fan = 0;
    end
	 else begin
        if (~heater && cooler) begin
            if (fan == 4'd6 && $signed(temprature) < $signed(8'd35))begin
					fan = 4'd4;
				end
            else if (fan == 4'd6 && $signed(temprature) > $signed(8'd45)) fan = 4'd8;
            else if (fan == 4'd8 && $signed(temprature) < $signed(8'd40)) fan = 4'd6;
            else if (fan == 4'd4 && $signed(temprature) > $signed(8'd40)) fan = 4'd6;
            else if (fan == 4'd4 && $signed(temprature) < $signed(8'd25)) begin
                fan = 4'd0;
                heater = 0;
                cooler = 0;
            end 
        end
        else if (~heater && ~cooler && $signed(temprature) > $signed(8'd35)) begin
		      fan = 4'd4;
            heater = 0;
            cooler = 1;
        end
        else if (~heater && ~cooler && $signed(temprature) < $signed(8'd15)) begin
            heater = 1;
            cooler = 0;
        end
        else if (heater && ~cooler && $signed(temprature) > $signed(8'd30)) begin
            heater = 0;
            cooler = 0;
        end
    end
end

endmodule