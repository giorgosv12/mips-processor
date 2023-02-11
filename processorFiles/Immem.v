`timescale 1ns / 1ps
module Immem(
				  input wire [15:0] Instr150,
				  input wire [5:0] OpCode,
				  output reg [31:0] Imm
				);
				
	 
			always@(*) 
			begin
			if ((OpCode== 6'b111000) || (OpCode== 6'b110000) || (OpCode== 6'b000011) || (OpCode== 6'b000111) || (OpCode== 6'b001111) || (OpCode== 6'b011111)) //SignExtend
			begin
				if (Instr150[15] == 1) 
				begin
				Imm = {16'b1111111111111111,Instr150[15:0]};
				end
				else
				begin 
				Imm = {16'b0000000000000000,Instr150[15:0]};
				end
				end
			
			
			else if((OpCode == 6'b111001) || (OpCode== 6'b110010) || (OpCode== 6'b110011))  //Zerofill
			begin 
			Imm = {16'b0000000000000000,Instr150[15:0]};
			end
			
			 
			else if((OpCode== 6'b111111) || (OpCode== 6'b000000)  || (OpCode== 6'b000001) )  //shift2 and signextend
			begin
			
			if (Instr150[15] == 1) 
				begin
				Imm = {16'b1111111111111111,Instr150[15:0]};
				Imm = Imm <<2;
				end
				else
				begin 
				Imm = {16'b0000000000000000,Instr150[15:0]};
				Imm = Imm<<2;
				end
				
			end
				else 
			begin
			Imm = 32'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
			end
			end
				
	endmodule