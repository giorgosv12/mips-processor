`timescale 1ns / 1ps

module ALUSTAGE_tb;

	// Inputs
	reg [31:0] RF_A;
	reg [31:0] RF_B;
	reg [31:0] Immed;
	reg [3:0] ALU_func;
	reg ALU_Bin_sel;

	// Outputs
	wire [31:0] ALU_out;

	// Instantiate the Unit Under Test (UUT)
	ALUSTAGE uut (
		.ALU_out(ALU_out), 
		.RF_A(RF_A), 
		.RF_B(RF_B), 
		.Immed(Immed), 
		.ALU_func(ALU_func), 
		.ALU_Bin_sel(ALU_Bin_sel)
	);

	initial begin

		RF_A = 32'b00000000000000000000000000000001;
		RF_B = 32'b00000000000000000000000000000100;
		Immed= 32'b00000000000000000000000000001100;
		ALU_func = 0;
		ALU_Bin_sel = 0;
		#10;            //add rfA and rfB
		
		ALU_func = 0;
		ALU_Bin_sel = 1;
		#10;         //add rfA and Immed
		
		
		ALU_func = 4'b0100;
		ALU_Bin_sel = 0;    // not rfA
		#10;
		
		ALU_func = 4'b0011;
		ALU_Bin_sel = 1;  
		#10;         // rfA or Immed
		
		
		ALU_func = 4'b1101;
		ALU_Bin_sel = 0;
		#10;     //rRight rfA
        


	end
      
endmodule

