`timescale 1ns / 1ps


module IMEM1(
	input clk,
	input [9:0] addr,
	output reg [31:0] dout
    );
	 
	 reg [31:0] ROM [1023:0];
	 
	 initial
	 begin
	 $readmemb("rom.data", ROM);
	 end
	 
	 always @(posedge clk)
	 begin
	 dout <= ROM[addr];
	 end
	 


endmodule
