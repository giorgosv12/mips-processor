`timescale 1ns / 1ps
module alu(output reg [31:0] Out,
				output reg Zero,
				input  wire [31:0] A, B,
				input wire [3:0] Op);


	reg [31:0] shift_right_A;
	reg Sign;
	
												
	always @(*) begin
	    shift_right_A = A >> 1;
		 Sign = A[31];
	    case (Op)
			 4'b0000 : Out = A+B;
			 4'b0001 : Out = A-B;
			 4'b0010 : Out = A&B;
			 4'b0011 : Out = A|B;
			 4'b0100 : Out = ~A;
			 4'b1000 : Out = {Sign, shift_right_A[30:0]};
			 4'b1010 : Out = A >> 1;
			 4'b1001 : Out = A << 1;
			 4'b1100 : Out = {A[30:0], A[31]};
			 4'b1101 : Out = {A[0], A[31:1]};
			 default : Out = 32'bXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
		 endcase
		 
		 if (Out == 32'b00000000000000000000000000000000) begin
		     Zero = 1'b1;
		 end
		 else begin
		     Zero = 1'b0;
		 end
		 
	end
	
endmodule
