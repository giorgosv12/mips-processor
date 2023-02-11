`timescale 1ns / 1ps
module Mux2_to1_32bits(
	output reg [31:0] mout,
	input [31:0] in1, in2,
	input sel
    );
	 
	 always @(*) begin
	 if (sel == 0) begin
	     mout <= in1;
	 end
	 else begin
	     mout <= in2;
	 end
	 
	 
	 end


endmodule
