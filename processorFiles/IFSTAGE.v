`timescale 1ns / 1ps


module IFSTAGE(
   input [31:0] PC_Immed,
	input PC_sel, PC_LdEn, Reset, Clk,
	output wire [31:0] Instr
    );
	 
	 wire [31:0] pcin, PC, wire0, wire1;
	 
	 	 
	 IMEM1 Rom (.dout(Instr), .clk(Clk), .addr(PC[11:2]));
	 Adder4 Add0 (.Din(PC), .Dout(wire0));
	 Adder4_Imm Add1 (.Din(PC), .Imm(PC_Immed), .Dout(wire1));
	 Mux2_to1_32bits Mux (.mout(pcin), .in1(wire0), .in2(wire1), .sel(PC_sel));
	 Register_Reset Reg (.Rout(PC), .Rin(pcin), .CLK(Clk), .WE(PC_LdEn), .Reset(Reset));
	 
	 
	 
endmodule
