`timescale 1ns / 1ps
module MEMSTAGE_tb;

	// Inputs
	reg clk;
	reg Mem_WrEn;
	reg [31:0] ALU_MEM_Addr;
	reg [31:0] MEM_DataIn;

	// Outputs
	wire [31:0] MEM_DataOut;

	// Instantiate the Unit Under Test (UUT)
	MEMSTAGE uut (
		.clk(clk), 
		.Mem_WrEn(Mem_WrEn), 
		.ALU_MEM_Addr(ALU_MEM_Addr), 
		.MEM_DataIn(MEM_DataIn), 
		.MEM_DataOut(MEM_DataOut)
	);
	always begin
	#10 clk = ~clk;
	end

	initial begin

		clk = 1;
		
		Mem_WrEn = 1;                   //write the first 4 addresses of the ram 
		ALU_MEM_Addr = 10'b0000000100;  //the address increases by 4
		MEM_DataIn = 10'b0000000001;
		#20;
		
		Mem_WrEn = 1;
		ALU_MEM_Addr = 10'b0000001000;
		MEM_DataIn = 10'b0000000010;
		#20;
		
		Mem_WrEn = 1;
		ALU_MEM_Addr = 10'b0000001100;
		MEM_DataIn = 10'b0000000011;
		#20;
		
		Mem_WrEn = 1;
		ALU_MEM_Addr = 10'b0000010000;
		MEM_DataIn = 10'b0000000100;
		#20;
		
		
		Mem_WrEn = 0;                    //read the first 4 addreses of the ram
		ALU_MEM_Addr = 10'b0000000100;
		#20;
		
		Mem_WrEn = 0;
		ALU_MEM_Addr = 10'b0000001000;
		#20;
		
		Mem_WrEn = 0;
		ALU_MEM_Addr = 10'b0000001100;
		#20;
		
		Mem_WrEn = 0;
		ALU_MEM_Addr = 10'b0000010000;
		#20;

	end
 endmodule