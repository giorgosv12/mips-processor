`timescale 1ns / 1ps

module Register32(
							output [31:0] Dout0, Dout1, Dout2, Dout3, Dout4, Dout5, Dout6, Dout7, Dout8, Dout9, Dout10, Dout11, Dout12, Dout13, Dout14, Dout15, Dout16, Dout17, Dout18, Dout19, Dout20, Dout21, Dout22, Dout23, Dout24, Dout25, Dout26, Dout27, Dout28, Dout29, Dout30, Dout31,
							input Clk, We0, We1, We2, We3, We4, We5, We6, We7, We8, We9, We10, We11, We12, We13, We14, We15, We16, We17, We18, We19, We20, We21, We22, We23, We24, We25, We26, We27, We28, We29, We30, We31,
							input [31:0] Data0, Data1, Data2, Data3, Data4, Data5, Data6, Data7, Data8, Data9, Data10, Data11, Data12, Data13, Data14, Data15, Data16, Data17, Data18, Data19, Data20, Data21, Data22, Data23, Data24, Data25, Data26, Data27, Data28, Data29, Data30, Data31 
						);
   

 
	Register Reg0(.Dout(Dout0),.CLK(Clk),.WE(We0),.Data(Data0));
	Register Reg1(.Dout(Dout1),.CLK(Clk),.WE(We1),.Data(Data1));
	Register Reg2(.Dout(Dout2),.CLK(Clk),.WE(We2),.Data(Data2));
	Register Reg3(.Dout(Dout3),.CLK(Clk),.WE(We3),.Data(Data3));
	Register Reg4(.Dout(Dout4),.CLK(Clk),.WE(We4),.Data(Data4));
	Register Reg5(.Dout(Dout5),.CLK(Clk),.WE(We5),.Data(Data5));
	Register Reg6(.Dout(Dout6),.CLK(Clk),.WE(We6),.Data(Data6));
	Register Reg7(.Dout(Dout7),.CLK(Clk),.WE(We7),.Data(Data7));
	Register Reg8(.Dout(Dout8),.CLK(Clk),.WE(We8),.Data(Data8));
	Register Reg9(.Dout(Dout9),.CLK(Clk),.WE(We9),.Data(Data9));
	Register Reg10(.Dout(Dout10),.CLK(Clk),.WE(We10),.Data(Data10));
	Register Reg11(.Dout(Dout11),.CLK(Clk),.WE(We11),.Data(Data11));
	Register Reg12(.Dout(Dout12),.CLK(Clk),.WE(We12),.Data(Data12));
	Register Reg13(.Dout(Dout13),.CLK(Clk),.WE(We13),.Data(Data13));
	Register Reg14(.Dout(Dout14),.CLK(Clk),.WE(We14),.Data(Data14));
	Register Reg15(.Dout(Dout15),.CLK(Clk),.WE(We15),.Data(Data15));
	Register Reg16(.Dout(Dout16),.CLK(Clk),.WE(We16),.Data(Data16));
	Register Reg17(.Dout(Dout17),.CLK(Clk),.WE(We17),.Data(Data17));
	Register Reg18(.Dout(Dout18),.CLK(Clk),.WE(We18),.Data(Data18));
	Register Reg19(.Dout(Dout19),.CLK(Clk),.WE(We19),.Data(Data19));
	Register Reg20(.Dout(Dout20),.CLK(Clk),.WE(We20),.Data(Data20));
	Register Reg21(.Dout(Dout21),.CLK(Clk),.WE(We21),.Data(Data21));
	Register Reg22(.Dout(Dout22),.CLK(Clk),.WE(We22),.Data(Data22));
	Register Reg23(.Dout(Dout23),.CLK(Clk),.WE(We23),.Data(Data23));
	Register Reg24(.Dout(Dout24),.CLK(Clk),.WE(We24),.Data(Data24));
	Register Reg25(.Dout(Dout25),.CLK(Clk),.WE(We25),.Data(Data25));
	Register Reg26(.Dout(Dout26),.CLK(Clk),.WE(We26),.Data(Data26));
	Register Reg27(.Dout(Dout27),.CLK(Clk),.WE(We27),.Data(Data27));
	Register Reg28(.Dout(Dout28),.CLK(Clk),.WE(We28),.Data(Data28));
	Register Reg29(.Dout(Dout29),.CLK(Clk),.WE(We29),.Data(Data29));
	Register Reg30(.Dout(Dout30),.CLK(Clk),.WE(We30),.Data(Data30));
	Register Reg31(.Dout(Dout31),.CLK(Clk),.WE(We31),.Data(Data31));
endmodule