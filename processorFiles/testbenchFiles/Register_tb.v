`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:41:44 12/27/2021
// Design Name:   Register
// Module Name:   /home/ise/Desktop/hw1_ergasia/Register_tb.v
// Project Name:  hw1_ergasia
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Register
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Register_tb;

	// Inputs
	reg CLK;
	reg WE;
	reg [31:0] Data;

	// Outputs
	wire [31:0] Dout;

	// Instantiate the Unit Under Test (UUT)
	Register uut (
		.Dout(Dout), 
		.CLK(CLK), 
		.WE(WE), 
		.Data(Data)
	);
	
	always begin
		#10 CLK = ~CLK;
	end

	initial begin
		// Initialize Inputs
		CLK = 0;

		Data = 32'b00000000000000000000000000000001;
		WE = 1'b1;
		
		#20;
		
		Data = 32'b00000000000000000000000000000011;
		WE = 1'b0;
		
		#20;
		
		Data = 32'b00000000000000000000000000000011;
		WE = 1'b1;
		
		
      

	end
      
endmodule

