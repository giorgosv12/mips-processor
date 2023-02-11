`timescale 1ns / 1ps
module Mux32to1_32bits(input wire [31:0] Din0, Din1, Din2, Din3, Din4, Din5, Din6, Din7, Din8, Din9, Din10, Din11, Din12, Din13, Din14, Din15, Din16, Din17, Din18, Din19, Din20, Din21, Din22, Din23, Din24, Din25, Din26, Din27, Din28, Din29, Din30, Din31,
						input wire [4:0] sel,
						output reg  [31:0] out
    );
	 
	 always @ (*) begin 
	 case(sel)
	 5'b00000 : out = Din0;
	 5'b00001 : out = Din1;
	 5'b00010 : out = Din2;
	 5'b00011 : out = Din3;
	 5'b00100 : out = Din4;
	 5'b00101 : out = Din5;
	 5'b00110 : out = Din6;
	 5'b00111 : out = Din7;
	 5'b01000 : out = Din8;
	 5'b01001 : out = Din9;
	 5'b01010 : out = Din10;
	 5'b01011 : out = Din11;
	 5'b01100 : out = Din12;
	 5'b01101 : out = Din13;
	 5'b01110 : out = Din14;
	 5'b01111 : out = Din15;
	 5'b10000 : out = Din16;
	 5'b10001 : out = Din17;
	 5'b10010 : out = Din18;
	 5'b10011 : out = Din19;
	 5'b10100 : out = Din20;
	 5'b10101 : out = Din21;
	 5'b10110 : out = Din22;
	 5'b10111 : out = Din23;
	 5'b11000 : out = Din24;
	 5'b11001 : out = Din25;
	 5'b11010 : out = Din26;
	 5'b11011 : out = Din27;
	 5'b11100 : out = Din28;
	 5'b11101 : out = Din29;
	 5'b11110 : out = Din30;
	 5'b11111 : out = Din31;
	 default  : out = 32'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX; 
	 
	 endcase
	 end

endmodule