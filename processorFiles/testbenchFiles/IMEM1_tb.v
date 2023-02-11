`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:26:06 12/27/2021
// Design Name:   IMEM1
// Module Name:   /home/ise/Desktop/hw1_ergasia/IMEM1_tb.v
// Project Name:  hw1_ergasia
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IMEM1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IMEM1_tb;

	// Inputs
	reg clk;
	reg [9:0] addr;

	// Outputs
	wire [31:0] dout;

	// Instantiate the Unit Under Test (UUT)
	IMEM1 uut (
		.clk(clk), 
		.addr(addr), 
		.dout(dout)
	);
	always begin
	#10 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		clk = 0;
		addr = 0;
		#20;
		
		
		addr = 10'b0000000001;
		#20;
		
		addr = 10'b0000000010;
		#20;
        


	end
      
endmodule

