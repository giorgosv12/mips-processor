`timescale 1ns / 1ps
module register_file_tb;

	// Inputs
	reg [4:0] Ard1;
	reg [4:0] Ard2;
	reg [4:0] Awr;
	reg [31:0] Din;
	reg WrEn;
	reg Clk;

	// Outputs
	wire [31:0] Dout1;
	wire [31:0] Dout2;

	// Instantiate the Unit Under Test (UUT)
	Register_File uut (
		.Ard1(Ard1), 
		.Ard2(Ard2), 
		.Awr(Awr), 
		.Dout1(Dout1), 
		.Dout2(Dout2), 
		.Din(Din), 
		.WrEn(WrEn), 
		.Clk(Clk)
	);
	always begin
	#10 Clk =~ Clk;
	end

	initial begin
	
		Ard1 = 0;
		Ard2 = 0;
		Awr = 5'b00001;
		Din = 32'b00000000000000000000000000000001;
		WrEn = 1;
		Clk = 1;
		#20; //Cycle1
		
		Ard1 = 5'b00001;
		WrEn = 0;
		#20; //Cycle2
		
		Awr = 5'b00010;
		Din = 32'b00000000000000000000000000000010;
		WrEn = 1;
		Ard2 = 5'b00010;
		#20; // Cycle3
		
		WrEn = 0;
		#20; //Cycle4
		
		Awr = 5'b00011;
		Din = 32'b00000000000000000000000000000011;
		WrEn = 1;
		 #20; //Cycle5
		
		Ard1 = 5'b00011;
		Ard2 = 5'b00010;
		WrEn = 0;
		#20;
		
		Awr = 5'b11111;
		Din = 32'b11111111111111111111111111111111;
		WrEn = 1;
		#20; //Cycle6
		
		Ard1 = 5'b00011;
		Ard2 = 5'b11111;
		WrEn = 0;
		#20; //Cycle7
		
		Ard1 = 5'b00000;
		#20;
		
	end
      
endmodule
