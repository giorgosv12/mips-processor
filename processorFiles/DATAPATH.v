`timescale 1ns / 1ps
module DATAPATH( output [31:0] InstrIF,
					  input [3:0] ALU_func,
					  input ALU_Bin_sel, RF_B_sel, RF_WrData_sel, RF_WrEn, MEM_WrEn, Mem_Out_sel, Mem_DataIn_sel, b, beq, bne, Clk, reset,
					  PC_LdEn
					);
		wire [31:0] Instr, ALU_out1, MEM_out1, Immed,  RF_A, RF_B, ALU_out, RF_B1, MEM_out;
		wire PC_Sel, RF_WrEn1, zero, Mem_Out_sel1, RF_WrData_sel1; 
		wire [4:0] instr2016_1;
		
		IFSTAGE ifstage(.PC_sel(PC_Sel),.PC_LdEn(PC_LdEn), .PC_Immed(Immed), .Instr(InstrIF), .Reset(reset), .Clk(Clk));
		
		Register regInstr (.WE(1'b1), .CLK(Clk), .Data(InstrIF), .Dout(Instr));
		
		DECSTAGE decstage(.Instr(Instr), .RF_WrEn(RF_WrEn1), .ALU_out(ALU_out1), .MEM_out(MEM_out1), .RF_WrData_sel(RF_WrData_sel1), 
								.RF_B_sel(RF_B_sel), .Clk(Clk), .Immed(Immed), .RF_A(RF_A), .RF_B(RF_B), .write_register(instr2016_1));
								

		ALUSTAGE alustage(.RF_A(RF_A), .RF_B(RF_B), .Immed(Immed), .ALU_Bin_sel(ALU_Bin_sel),
								.ALU_func(ALU_func), .ALU_out(ALU_out), .zero(zero));
								
		Mux_word_byte mux_word_byte1(.in(RF_B), .sel(Mem_DataIn_sel), .out(RF_B1));
		
		Branch_Module branch_module(.reset(reset), .beq(beq), .bne(bne), .b(b), .zero(zero), .PC_sel(PC_Sel));
	
		Control_Register_1 control_register_1(.RF_WrEn(RF_WrEn), .Mem_Out_sel(Mem_Out_sel), .RF_WrData_sel(RF_WrData_sel),
														  .Clk(Clk), .ALU_out(ALU_out),.instr2016(Instr[20:16]), .RF_WrEn1(RF_WrEn1),
														  .Mem_Out_sel1(Mem_Out_sel1) , .RF_WrData_sel1(RF_WrData_sel1), .ALU_out1(ALU_out1),
														  .instr2016_1(instr2016_1));
		
		MEMSTAGE memstage(.clk(Clk), .Mem_WrEn(MEM_WrEn), .ALU_MEM_Addr(ALU_out), .MEM_DataIn(RF_B1), .MEM_DataOut(MEM_out));
		
		Mux_word_byte mux_word_byte2(.in(MEM_out), .sel(Mem_Out_sel1), .out(MEM_out1));
		
endmodule
