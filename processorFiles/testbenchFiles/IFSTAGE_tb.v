`timescale 1ns / 1ps

module IFSTAGE_tb;

	// Inputs
	reg PC_sel;
	reg PC_LdEn;
	reg Reset;
	reg Clk;
	reg [31:0] PC_Immed;

	// Outputs
	wire [31:0] Instr;

	// Instantiate the Unit Under Test (UUT)
	IFSTAGE uut (
		.Instr(Instr), 
		.PC_sel(PC_sel), 
		.PC_LdEn(PC_LdEn), 
		.Reset(Reset), 
		.Clk(Clk), 
		.PC_Immed(PC_Immed)
	);
	
	always begin
	#10 Clk = ~Clk;
	end

	initial begin
		// Initialize Inputs
		PC_sel = 0;
		PC_LdEn = 1;
		Reset = 1;
		Clk = 0;
		PC_Immed = 0;		
		#20;
		
		Reset = 0;
		
		#60;
		PC_Immed = 32'b00000000000000000000000000001100;
		PC_sel = 1;
		
		#40;
		PC_sel = 0;
		
		
		

	end
      
endmodule

