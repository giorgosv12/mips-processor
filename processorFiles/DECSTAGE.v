`timescale 1ns / 1ps

module DECSTAGE(
        input [31:0] Instr,
		  input RF_WrEn,
		  input [31:0] ALU_out, MEM_out,  
		  input RF_WrData_sel, RF_B_sel, Clk,
        output [31:0] Immed, RF_A, RF_B,
		  input [4:0] write_register
		 
    );
	 
	 wire [31:0]  write_data;
	 wire [4:0]   read_reg_2;
	
	 
	 Mux2_to1_5bits mux1 (.in1(Instr[15:11]), .in2(Instr[20:16]), .sel(RF_B_sel), .mout(read_reg_2));
	 Mux2_to1_32bits mux2 (.mout(write_data), .in1(ALU_out), .in2(MEM_out), .sel(RF_WrData_sel));
	 Immem immem (.Instr150(Instr[15:0]), .OpCode(Instr[31:26]), .Imm(Immed));
	 Register_File register_file (.Ard1(Instr[25:21]), .Ard2(read_reg_2), .Awr(write_register), .Dout1(RF_A), .Dout2(RF_B), .Din(write_data), .WrEn(RF_WrEn), .Clk(Clk));
	 
	 


endmodule
