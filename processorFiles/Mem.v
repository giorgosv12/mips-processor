`timescale 1ns / 1ps
module Mem(
    output reg [31:0] dout,
	 input clk, we,
	 input [9:0] addr,
	 input [31:0] din
    );
	 
	 reg [31:0] RAM [1023:0];
	 always @(posedge clk) begin
	     if(we)
		      RAM[addr] = din;
		  else
		      dout = RAM[addr];
	 end
endmodule
