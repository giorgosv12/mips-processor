`timescale 1ns / 1ps


module Register(
	output reg [31:0] Dout,
	input CLK, WE,
	input [31:0] Data
    );
	 
	 always @(posedge CLK)
	 begin
	 if (WE)
		begin
		Dout <= Data;
		end
	 end


endmodule
