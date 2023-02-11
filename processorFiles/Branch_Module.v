`timescale 1ns / 1ps


module Branch_Module(
    input wire beq, bne, b, zero, reset,
	 output reg PC_sel
    );
	 
	 always @(*) begin
	 if (reset) begin
	 PC_sel = 1'b0;
	 end
	 if (b==1'b1) begin
	     PC_sel = 1'b1;
		  
	 end
	 
	 else if (beq==1'b1) begin
		  if (zero==1'b1) begin
	         PC_sel = 1'b1;
		  end
		  else begin
		      PC_sel = 1'b0;
		  end
	 end
	 
	 else if (bne==1'b1) begin
		  if (zero == 1'b0) begin
	         PC_sel = 1'b1;
		  end
		  else begin
		      PC_sel = 1'b0;
		  end
	 end
	 else begin
		 PC_sel = 1'b0;
	 
	 end
	 end
	 


endmodule
