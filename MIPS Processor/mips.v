`timescale 1 ns / 1 ps 
 
module Single_cycle (); 
 
reg [31:0] PC;		   
wire [5:0] Inst_A, Inst_F; 
wire [4:0] Inst_B, Inst_C, Inst_D, Mux1_out;	  
wire [15:0] Inst_E; 
wire [25:0] Inst_G; 
 
wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;  
 
wire [1:0] ALUOp; 
 
wire [31:0] Data1, Data2;	    
 
wire [31:0] Mux2_out, Mux3_out;	  
 
wire [31:0] Sign_Extended;	    
 
wire [3:0] ALU_control_signal;  
 
wire Zero;	 
 
wire [31:0] ALUresult;		    
 
wire [31:0] Readdata;  
 
wire [31:0] PC_4; 
 
wire [31:0] Branch_result; 
 
wire [31:0] Mux4_out;	    
 
wire Mux4_control; 
 
//wire [31:0] Jump_target;    
 

 
wire Exception; 
 
reg clk; 
 
 
initial	 begin	  
	PC=32'b0; 
 	clk=1; 
	forever #20 clk=~clk; 
end			 
 
				    
 
Instruction_memory InstMem(clk, PC, Inst_A, Inst_B, Inst_C, Inst_D, Inst_E, Inst_F, Inst_G); 
 
Control_unit CtrlU(Inst_A, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, Exception);	   
 
ALU_Control ALUC(Inst_F, ALUOp, ALU_control_signal); 
 
Register_file RF(clk, Inst_B, Inst_C, Mux1_out, Mux3_out, RegWrite, Data1, Data2);	 
							   
Sign_extension SE(Inst_E, Sign_Extended); 
 
_32b_MUX Mux2(Data2, Sign_Extended, ALUSrc, Mux2_out); 
 
ALU ALU(Data1, Mux2_out, ALU_control_signal, Zero, ALUresult); 
 
Data_memory DM(clk, ALUresult, Data2, MemWrite, MemRead, Readdata);	   
 
_32b_MUX Mux3(ALUresult, Readdata, MemtoReg, Mux3_out); 
 
Adder_PC PC4(PC, PC_4);     
 
//assign Sign_Extended=Sign_Extended<<2; 
 
Adder_Branch AddB(PC_4, Sign_Extended, Branch_result); 
 
assign Mux4_control=Zero&Branch; 
 
_32b_MUX Mux4(PC_4, Branch_result, Mux4_control, Mux4_out); 
 
 
// _32b_MUX Mux5(Mux4_out, Jump_target, Jump, Mux5_out);	    
 /*
 
always @(negedge clk) begin  
	PC=Mux5_out;    
end 
 */
 
 
 
 
initial begin  
	 
	$monitor ("PC=%d, Instruction= %b%b%b%b",PC, InstMem.Inst_Mem[PC], InstMem.Inst_Mem[PC+1], InstMem.Inst_Mem[PC+2], InstMem.Inst_Mem[PC+3]); 
	 
	#680 
	 			 
	 
	$display("$5 = %d, $6= %d,  $7= %d,  $8= %d,  $9= %d,  $10= %d \nMem[16:19]=%d, Mem[20:23]=%d",RF.Registers[5],RF.Registers[6], RF.Registers[7], RF.Registers[8], RF.Registers[9], RF.Registers[10], DM.mem[19], DM.mem[23]);     
	$display("$11 = %d, $12= %d \n$13= %b \n$14=%b \n$15= %b \n$16=%b", RF.Registers[11], RF.Registers[12], RF.Registers[13], RF.Registers[14], RF.Registers[15], RF.Registers[16]);  
	$display("$17=%d, $2=%d", RF.Registers[17], RF.Registers[2]); 
	 
	 
	$monitoroff; 
	 
	#15960 
	 
	$monitoron;	 
	 
	#40 
	 
	$display("Mem[100]=%h%h%h%h", DM.mem[100], DM.mem[101], DM.mem[102], DM.mem[103]); 
 
	 
	#40	  				    
	 
	$display("PC(hexadecimal)=%h", PC); 
	 
	$finish; 
	  
end 			 
 
 
endmodule 