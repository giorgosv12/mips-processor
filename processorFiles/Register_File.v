`timescale 1ns / 1ps
module Register_File(
							input wire [4:0] Ard1, Ard2, Awr,
							output wire [31:0] Dout1, Dout2,
							input wire [31:0] Din,
							input wire WrEn, Clk
							
    );
	 wire [31:0] dec_out;
	 reg [31:0] WE, WrEn32;
	 wire [31:0] Dout [31:0];
	 
	 
	 
	 Decoder5to32_32bits Decoder(.in(Awr), .out(dec_out));
	 Register32 Register(.Dout0(Dout[0]), .Dout1(Dout[1]), .Dout2(Dout[2]), .Dout3(Dout[3]), .Dout4(Dout[4]), .Dout5(Dout[5]), .Dout6(Dout[6]), .Dout7(Dout[7]),
								.Dout8(Dout[8]), .Dout9(Dout[9]), .Dout10(Dout[10]), .Dout11(Dout[11]), .Dout12(Dout[12]), .Dout13(Dout[13]), .Dout14(Dout[14]), .Dout15(Dout[15]),
								.Dout16(Dout[16]), .Dout17(Dout[17]), .Dout18(Dout[18]), .Dout19(Dout[19]), .Dout20(Dout[20]), .Dout21(Dout[21]), .Dout22(Dout[22]), .Dout23(Dout[23]),
								.Dout24(Dout[24]), .Dout25(Dout[25]), .Dout26(Dout[26]), .Dout27(Dout[27]), .Dout28(Dout[28]), .Dout29(Dout[29]), .Dout30(Dout[30]), .Dout31(Dout[31]),
								.Clk(Clk), 
								.We0(1'b1), .We1(WE[1]), .We2(WE[2]), .We3(WE[3]), .We4(WE[4]), .We5(WE[5]), .We6(WE[6]), .We7(WE[7]),
								.We8(WE[8]), .We9(WE[9]), .We10(WE[10]), .We11(WE[11]), .We12(WE[12]), .We13(WE[13]), .We14(WE[14]), .We15(WE[15]),
								.We16(WE[16]), .We17(WE[17]), .We18(WE[18]), .We19(WE[19]), .We20(WE[20]), .We21(WE[21]), .We22(WE[22]), .We23(WE[23]),
								.We24(WE[24]), .We25(WE[25]), .We26(WE[26]), .We27(WE[27]), .We28(WE[28]), .We29(WE[29]), .We30(WE[30]), .We31(WE[31]),
								
								.Data0(32'b00000000000000000000000000000000), .Data1(Din), .Data2(Din), .Data3(Din), .Data4(Din), .Data5(Din), .Data6(Din), .Data7(Din),
								.Data8(Din), .Data9(Din), .Data10(Din), .Data11(Din), .Data12(Din), .Data13(Din), .Data14(Din), .Data15(Din),
								.Data16(Din), .Data17(Din), .Data18(Din), .Data19(Din), .Data20(Din), .Data21(Din), .Data22(Din), .Data23(Din),
								.Data24(Din), .Data25(Din), .Data26(Din), .Data27(Din), .Data28(Din), .Data29(Din), .Data30(Din), .Data31(Din));
								
	Mux32to1_32bits Mux1(.Din0(Dout[0]), .Din1(Dout[1]), .Din2(Dout[2]), .Din3(Dout[3]), .Din4(Dout[4]), .Din5(Dout[5]), .Din6(Dout[6]), .Din7(Dout[7]),
								.Din8(Dout[8]), .Din9(Dout[9]), .Din10(Dout[10]), .Din11(Dout[11]), .Din12(Dout[12]), .Din13(Dout[13]), .Din14(Dout[14]), .Din15(Dout[15]),
								.Din16(Dout[16]), .Din17(Dout[17]), .Din18(Dout[18]), .Din19(Dout[19]), .Din20(Dout[20]), .Din21(Dout[21]), .Din22(Dout[22]), .Din23(Dout[23]),
								.Din24(Dout[24]), .Din25(Dout[25]), .Din26(Dout[26]), .Din27(Dout[27]), .Din28(Dout[28]), .Din29(Dout[29]), .Din30(Dout[30]), .Din31(Dout[31]), 
								.sel(Ard1), .out(Dout1));
								
	Mux32to1_32bits Mux2(.Din0(Dout[0]), .Din1(Dout[1]), .Din2(Dout[2]), .Din3(Dout[3]), .Din4(Dout[4]), .Din5(Dout[5]), .Din6(Dout[6]), .Din7(Dout[7]),
								.Din8(Dout[8]), .Din9(Dout[9]), .Din10(Dout[10]), .Din11(Dout[11]), .Din12(Dout[12]), .Din13(Dout[13]), .Din14(Dout[14]), .Din15(Dout[15]),
								.Din16(Dout[16]), .Din17(Dout[17]), .Din18(Dout[18]), .Din19(Dout[19]), .Din20(Dout[20]), .Din21(Dout[21]), .Din22(Dout[22]), .Din23(Dout[23]),
								.Din24(Dout[24]), .Din25(Dout[25]), .Din26(Dout[26]), .Din27(Dout[27]), .Din28(Dout[28]), .Din29(Dout[29]), .Din30(Dout[30]), .Din31(Dout[31]), 
								.sel(Ard2), .out(Dout2));
	 
	 
	 always @(*) begin
	     if (WrEn) begin
		     WrEn32 = 32'b11111111111111111111111111111111;
		  end
		  else begin
		     WrEn32 = 32'b00000000000000000000000000000000;
		  end
		  
		  WE = WrEn32 & dec_out;
	 end
	


endmodule