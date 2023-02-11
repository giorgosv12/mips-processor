`timescale 1ns / 1ps
module Adder4(
	 output reg [31:0] Dout,
	 input [31:0] Din
    );
	 
	 always @(*) begin
	 Dout = Din + 4;
	 end


endmodule
