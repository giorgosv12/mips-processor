`timescale 1ns / 1ps
module DECSTAGEtb;

	// Inputs
	reg [31:0] Instr;
	reg RF_WrEn;
	reg [31:0] ALU_out;
	reg [31:0] MEM_out;
	reg RF_WrData_sel;
	reg RF_B_sel;
	reg Clk;

	// Outputs
	wire [31:0] Immed;
	wire [31:0] RF_A;
	wire [31:0] RF_B;

	// Instantiate the Unit Under Test (UUT)
	DECSTAGE uut (
		.Instr(Instr), 
		.RF_WrEn(RF_WrEn), 
		.ALU_out(ALU_out), 
		.MEM_out(MEM_out), 
		.RF_WrData_sel(RF_WrData_sel), 
		.RF_B_sel(RF_B_sel), 
		.Clk(Clk), 
		.Immed(Immed), 
		.RF_A(RF_A), 
		.RF_B(RF_B)
	);
	always 
	begin
	#10 Clk = ~Clk;
	end

	initial begin
	
		Instr = 32'b11100000000000000000000000000001;
		RF_WrEn = 0; //egrafi kataxoriti
		ALU_out = 32'b00000000000000000000000000000011; //alu 
		MEM_out = 32'b00000000000000000000000000000001; //mem
		RF_WrData_sel = 0; //Mux alu or mem
		RF_B_sel = 0;  //Mux msb or lsb
		Clk = 1;   
		#20;
	
		Instr = 32'b00000000000000010000000000000001;
		RF_WrEn = 1; //egrafi kataxoriti
		ALU_out = 32'b00000000000000000000000000000011; //alu 
		MEM_out = 32'b00000000000000000000000000000001; //mem
		RF_WrData_sel = 0; //Mux alu or mem
		RF_B_sel = 0;  //Mux msb or lsb
		#20;
		
		
		Instr = 32'b00000000000000110000000000000001;
		RF_WrEn = 1; //egrafi kataxoriti
		ALU_out = 32'b00000000000000010000000000000000; //alu 
		MEM_out = 32'b00000000000000000000000000000110; //mem
		RF_WrData_sel = 1; //Mux alu or mem
		RF_B_sel = 0;  //Mux msb or lsb
		#20;
	end
endmodule

		