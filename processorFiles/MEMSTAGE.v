`timescale 1ns / 1ps

module MEMSTAGE(
    input clk, Mem_WrEn,
	 input [31:0] ALU_MEM_Addr, MEM_DataIn,
	 output [31:0] MEM_DataOut
    );
	 
	 Mem Ram (.dout(MEM_DataOut), .clk(clk), .we(Mem_WrEn), .addr(ALU_MEM_Addr[11:2]), .din(MEM_DataIn));


endmodule
