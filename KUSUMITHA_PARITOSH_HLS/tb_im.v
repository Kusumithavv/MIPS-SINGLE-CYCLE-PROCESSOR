`timescale 1 ns / 1 ps 
 
 
module tb_Instruction_memory (); 
 
 
wire [5:0] Inst_A;											   // outputs 
wire [4:0] Inst_B, Inst_C, Inst_D; 
wire [15:0] Inst_E; 
wire [5:0] Inst_F; 
wire [25:0] Inst_G; 
 
 
reg [31:0] PC;                                              	// inputs 
 
 
reg clk;															 	// clock generate 
 
initial	 begin 
 	clk=1; 
	forever #20 clk=~clk; 
end			 
 
Instruction_memory im(clk, PC, Inst_A, Inst_B, Inst_C, Inst_D, Inst_E, Inst_F, Inst_G);		// test 
 
initial begin 
	$monitor ("PC=%b \nInstruction=%b%b%b%b\nInst_A= %b, inst_B=%b, Inst_C=%b, Inst_D=%b \nInst_E=%b, Inst_F=%b \nInst_G=%b\n",PC, im.Inst_Mem[PC],im.Inst_Mem[PC+1],im.Inst_Mem[PC+2],im.Inst_Mem[PC+3],Inst_A, Inst_B, Inst_C, Inst_D, Inst_E, Inst_F, Inst_G); 
	 
	 
	 
	PC=0; 
	 
	 
	#100		 												  
	 
	PC=4;  
	 
	#100 
	 
 
	 
	$finish;	   
	 
end 
									 
 
endmodule 