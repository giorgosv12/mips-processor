`timescale 1ns / 1ps
module CONTROL(
		input [31:0] Instr,
		input Clk, reset,
		output reg [3:0] ALU_func,
		output reg ALU_Bin_sel,
		output reg  RF_B_sel, RF_WrData_sel, RF_WrEn,
		        MEM_WrEn, Mem_Out_sel, Mem_DataIn_sel, b, beq, bne, PC_LdEn
    );
	 
	 reg [3:0] current_state, next_state;
	 parameter reset_start = 4'b0000,
	           dummy = 4'b0001,
				  start = 4'b0010,
				  alu = 4'b0011,
				  li_lui = 4'b0100,
				  immediate = 4'b0101,
				  branch = 4'b0110,
				  branch_equal = 4'b0111,
				  branch_not_equal = 4'b1000,
				  load_byte = 4'b1001,
				  load_word = 4'b1010,
				  save_byte = 4'b1011,
				  save_word = 4'b1100,
				  nope = 4'b1101;

    always @(posedge Clk or posedge reset) begin
	     if (reset) begin
		      current_state <= reset_start;
		  end
		  else begin
		      current_state <= next_state;
		  end
	 end
	 
	 always @(current_state or Instr) begin
	     case (current_state)
		      reset_start : next_state = dummy;
				dummy: next_state = start;
				start: if (Instr[31:26] == 6'b100000)
				           next_state = alu;
					    else if ((Instr[31:26] == 6'b111000) || (Instr[31:26] == 6'b111001))
						     next_state = li_lui;
						 else if ((Instr[31:26] == 6'b110000) || (Instr[31:26] == 6'b110010) || (Instr[31:26] == 6'b110011))
						     next_state = immediate;
						 else if (Instr[31:26] == 6'b111111)
						     next_state = branch;
						 else if ((Instr[31:26] == 6'b00000) && (Instr[25:0] != 26'b00000000000000000000000000))
						     next_state = branch_equal;
						 else if (Instr[31:26] == 6'b000001)
						     next_state = branch_not_equal;
					    else if (Instr[31:26] == 6'b000011)
						     next_state = load_byte;
						 else if (Instr[31:26] == 6'b001111)
						     next_state = load_word;
						 else if (Instr[31:26] == 6'b000111)
						     next_state = save_byte;
						 else if (Instr[31:26] == 6'b011111)
						     next_state = save_word;
						 else if (Instr == 32'b00000000000000000000000000000000)
						     next_state = nope;
						 else
						     next_state = start;
				alu, li_lui, immediate, branch, branch_equal, branch_not_equal,
				load_byte, load_word, save_byte, save_word, nope             : next_state = dummy;
				default: next_state = reset_start;
		  endcase
	 end
	 
	 
	 always @(current_state) begin
	     case (current_state)
		      reset_start: begin
				    PC_LdEn = 1'b1;
				end
				dummy: begin
				    PC_LdEn = 1'b0;
					 RF_WrEn = 1'b0;
		          MEM_WrEn= 1'b0;				 
				end
				start: begin
				    PC_LdEn = 1'b0;
					 RF_WrEn = 1'b0;
		          MEM_WrEn= 1'b0;				 
				end
				alu: begin
				     PC_LdEn = 1'b1;
					  ALU_func = Instr[3:0];
					  ALU_Bin_sel=1'b0;
					  RF_B_sel = 1'b0;
					  RF_WrData_sel=1'b0;
					  RF_WrEn= 1'b1;
					  MEM_WrEn = 1'b0;
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b0;
				end
				li_lui: begin
				     PC_LdEn = 1'b1;
					  ALU_func = 4'b0000;
					  ALU_Bin_sel= 1'b1;
					  RF_B_sel = 1'b0;
					  RF_WrData_sel=1'b0;
					  RF_WrEn= 1'b1;
					  MEM_WrEn = 1'b0;
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b0;	
				end
				immediate: begin
				     PC_LdEn = 1'b1;
					  ALU_func = Instr[29:26];
					  ALU_Bin_sel= 1'b1;
					  RF_B_sel = 1'b0;
					  RF_WrData_sel=1'b0;
					  RF_WrEn= 1'b1;
					  MEM_WrEn = 1'b0;
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b0;
			   end
				branch: begin
				     PC_LdEn = 1'b1;
					  RF_WrEn= 1'b0;
					  MEM_WrEn = 1'b0;
					  b=1'b1;
					  beq=1'b0;
					  bne=1'b0;
				end
				branch_equal: begin
				     PC_LdEn = 1'b1;
					  ALU_func = 4'b0001;
					  ALU_Bin_sel= 1'b0;
					  RF_B_sel = 1'b1;
					  RF_WrData_sel=1'b0;
					  RF_WrEn= 1'b0;
					  MEM_WrEn = 1'b0;
					  b=1'b0;
					  beq=1'b1;
					  bne=1'b0;						  
				end
				branch_not_equal: begin
				     PC_LdEn = 1'b1;
					  ALU_func = 4'b0001;
					  ALU_Bin_sel= 1'b0;
					  RF_B_sel = 1'b1;
					  RF_WrData_sel=1'b0;
					  RF_WrEn= 1'b0;
					  MEM_WrEn = 1'b0;
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b1;
				end
				load_byte: begin
				      PC_LdEn = 1'b1;
						Mem_Out_sel = 1'b0;
					  ALU_func = 4'b0000;  //add
					  ALU_Bin_sel=1'b1;     //Immediate
					  RF_WrData_sel=1'b1; //from Mem
					  RF_WrEn= 1'b1;
					  MEM_WrEn = 1'b0;
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b0;						
				end
				load_word : begin
				     PC_LdEn = 1'b1;
					  Mem_Out_sel = 1'b1;
					  ALU_func = 4'b0000;  //add
					  ALU_Bin_sel=1'b1;     //Immediate
					  RF_WrData_sel=1'b1; //from Mem
					  RF_WrEn= 1'b1;
					  MEM_WrEn = 1'b0;
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b0;				  
				end
				save_byte: begin
				     PC_LdEn = 1'b1;
					  Mem_DataIn_sel = 1'b0;
					  ALU_func = 4'b0000; //add
					  ALU_Bin_sel=1'b1;     //Immidiate
					  RF_B_sel = 1'b1;      //RF[rd]
					  RF_WrEn= 1'b0;
					  MEM_WrEn = 1'b1;    //write to Mem
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b0;
				end 
				save_word: begin
				     PC_LdEn = 1'b1;
					  Mem_DataIn_sel = 1'b1;
					  ALU_func = 4'b0000; //add
					  ALU_Bin_sel=1'b1;     //Immidiate
					  RF_B_sel = 1'b1;     //RF[rd]
					  RF_WrEn= 1'b0;
					  MEM_WrEn = 1'b1;    //write to Mem
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b0;
				end
				nope: begin
				     PC_LdEn = 1'b1;
					  RF_WrEn= 1'b0;      
					  MEM_WrEn = 1'b0;
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b0;	
				end
				default: begin
				     PC_LdEn = 1'b1;
					  RF_WrEn= 1'b0;      
					  MEM_WrEn = 1'b0;
					  b=1'b0;
					  beq=1'b0;
					  bne=1'b0;
				end
					  
		  endcase
	 end

endmodule
