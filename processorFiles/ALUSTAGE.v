timescale 1ns / 1ps

// Declare the module "ALUSTAGE"
module ALUSTAGE(
  // Input signals
  // 32-bit register file A
  input [31:0] RF_A, 
  // 32-bit register file B
  input [31:0] RF_B, 
  // 32-bit immediate value
  input [31:0] Immed,
  // Select signal for Mux1
  input ALU_Bin_sel,
  // 4-bit ALU operation code
  input [3:0] ALU_func,
  // 32-bit ALU output
  output [31:0] ALU_out,
  // Zero flag output
  output zero
); 
 
  // Intermediate wire for Mux1 output
  wire [31:0] mout;
 
  // Instantiate a 32-bit 2-to-1 Mux module named "Mux1"
  Mux2_to1_32bits Mux1 (.mout(mout), .in1(RF_B), .in2(Immed), .sel(ALU_Bin_sel));
  // Instantiate an ALU module named "Alu1"
  alu Alu1 (.Out(ALU_out), .Zero(zero), .A(RF_A), .B(mout), .Op(ALU_func));
 

// End of the ALUSTAGE module
endmodule
