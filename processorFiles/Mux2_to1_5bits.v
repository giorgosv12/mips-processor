`timescale 1ns / 1ps
module Mux2_to1_5bits(
	output reg [4:0] mout,
	input [4:0] in1, in2,
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

