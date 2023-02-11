`timescale 1ns / 1ps


module Mux_word_byte( //if sel = 0 out = ZeroFill(31 downto 8) & in (7 downto 0)
                       // else out = in
	input wire [31:0] in,
	 input wire sel,
	 output reg [31:0] out
    );

    always @(*) begin
	 if (sel==1'b0) begin
	     out = {24'b000000000000000000000000, in[7:0]};
	 end
	 else begin
	     out = in;
	 end
	 
	 end

endmodule
