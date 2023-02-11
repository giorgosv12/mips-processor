`timescale 1ns / 1ps
module Control_Register_1( input RF_WrEn, Mem_Out_sel, RF_WrData_sel, Clk,
									input [31:0] ALU_out,
									input [4:0] instr2016,
									output reg RF_WrEn1, Mem_Out_sel1, RF_WrData_sel1,
									output reg [31:0] ALU_out1,
									output reg [4:0] instr2016_1
									);
									
									always @(posedge Clk) begin
									
									
										instr2016_1 = instr2016;
										ALU_out1 = ALU_out;
										RF_WrEn1 = RF_WrEn;
										Mem_Out_sel1 = Mem_Out_sel;
										RF_WrData_sel1 = RF_WrData_sel;
							
									end

endmodule
