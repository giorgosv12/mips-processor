`timescale 1ns / 1ps
module PROCESSOR( input reset, Clk,
						output reg [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,m2,m3
					  );
		wire [31:0] Instr;
		wire ALU_Bin_sel, RF_B_sel, RF_WrData_sel, RF_WrEn, 
		     MEM_WrEn, Mem_Out_sel, Mem_DataIn_sel, b, beq, bne, PC_LdEn; 
		wire [3:0] ALU_func;				
						
		CONTROL control(.Instr(Instr), .Clk(Clk), .reset(reset),.ALU_func(ALU_func), .ALU_Bin_sel(ALU_Bin_sel), .RF_B_sel(RF_B_sel),
		.RF_WrData_sel(RF_WrData_sel), 
		.RF_WrEn(RF_WrEn), .MEM_WrEn(MEM_WrEn), .Mem_Out_sel(Mem_Out_sel), .Mem_DataIn_sel(Mem_DataIn_sel), .b(b), .beq(beq),
		.bne(bne), .PC_LdEn(PC_LdEn));
		
		
		DATAPATH datapath(.InstrIF(Instr), .ALU_func(ALU_func), .ALU_Bin_sel(ALU_Bin_sel), .RF_B_sel(RF_B_sel), .RF_WrData_sel(RF_WrData_sel), 
		.RF_WrEn(RF_WrEn), .MEM_WrEn(MEM_WrEn), .Mem_Out_sel(Mem_Out_sel), .Mem_DataIn_sel(Mem_DataIn_sel), .b(b), .beq(beq),
		.bne(bne), .Clk(Clk), .reset(reset), .PC_LdEn(PC_LdEn));
			

      always @(posedge Clk) begin
		    r0 = datapath.decstage.register_file.Dout[0];
          r1 = datapath.decstage.register_file.Dout[1];
			 r2 = datapath.decstage.register_file.Dout[2];
			 r3 = datapath.decstage.register_file.Dout[3];
			 r4 = datapath.decstage.register_file.Dout[4];
			 r5 = datapath.decstage.register_file.Dout[5];
			 r6 = datapath.decstage.register_file.Dout[6];
			 r7 = datapath.decstage.register_file.Dout[7];
			 r8 = datapath.decstage.register_file.Dout[8];
			 r9 = datapath.decstage.register_file.Dout[9];
			 r10 = datapath.decstage.register_file.Dout[10];
			 r11 = datapath.decstage.register_file.Dout[11];
			 r12 = datapath.decstage.register_file.Dout[12];
			 r13 = datapath.decstage.register_file.Dout[13];
			 r14 = datapath.decstage.register_file.Dout[14];
			 r15 = datapath.decstage.register_file.Dout[15];
			 r16 = datapath.decstage.register_file.Dout[16];
			 r17 = datapath.decstage.register_file.Dout[17];
			 r18 = datapath.decstage.register_file.Dout[18];
			 r19 = datapath.decstage.register_file.Dout[19];
			 m2 = datapath.memstage.Ram.RAM[2];
			 m3 = datapath.memstage.Ram.RAM[3];
			 
      end		
endmodule
