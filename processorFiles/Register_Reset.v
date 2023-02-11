`timescale 1ns / 1ps

module Register_Reset(
	 output reg [31:0] Rout,
	 input CLK, WE, Reset,
	 input [31:0] Rin
    );
	 
	 always @(posedge CLK)
	 begin
	 if (WE) begin
		if (Reset) begin
		    Rout <= 32'b00000000000000000000000000000000;
		end
		else begin
		    Rout <= Rin;
	   end
	 end
	 $monitor("PCout %d", Rout);
	 end


endmodule
