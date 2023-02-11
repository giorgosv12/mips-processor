`timescale 1ns / 1ps


module Adder4_Imm(
	 output reg [31:0] Dout,
	 input [31:0] Din, Imm
    );
	 
	 always @(*) begin
	 Dout = Din + Imm +4 ;
	 end


endmodule
