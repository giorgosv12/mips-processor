`timescale 1ns / 1ps
module PROCESSOR_TB;

	// Inputs
	reg reset;
	reg Clk;
	
	//outputs
	wire [31:0] r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15,r16,r17,r18,r19,m2,m3;

	// Instantiate the Unit Under Test (UUT)
	PROCESSOR uut (
		.reset(reset), 
		.Clk(Clk),
		.r0(r0),
		.r1(r1),
		.r2(r2),
		.r3(r3),
		.r4(r4),.r5(r5),.r6(r6),.r7(r7),.r8(r8),.r9(r9),
		.r10(r10),
		.r11(r11),
		.r12(r12),
		.r13(r13),
		.r14(r14),.r15(r15),.r16(r16),.r17(r17),.r18(r18),.r19(r19),
		.m2(m2), .m3(m3)
	);
	always begin
	#5 Clk =~ Clk;
	end
	initial begin
		reset = 0;
		Clk = 0;
		#10;
       
	reset = 1;
	#10;
	
	reset = 0;
		

	end
      
endmodule

