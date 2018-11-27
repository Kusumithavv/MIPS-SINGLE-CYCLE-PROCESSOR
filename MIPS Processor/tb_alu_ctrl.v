`timescale 1 ns / 1 ps 

 
module tb_ALU_Control (); 
 
reg [5:0] Inst_F;							// inputs 
reg [1:0] ALUOp; 
reg andi,ori,addi,subi;  
wire [3:0] ALU_control_signal;		 // output 
 
ALU_Control ALUC( andi,ori,addi,subi; Inst_F, ALUOp, ALU_control_signal); 
	 
	 
initial begin  
	$monitor ("Inst_F= %b, ALUOp=%b, ALU_control_signal=%b\n",Inst_F, ALUOp, ALU_control_signal); 
	 
	 
	Inst_F=6'b100000;					// add OPcode 
	ALUOp=10; 
	 
	#100		  
	 
	Inst_F=6'b011010;				    // div OPcode 
	ALUOp=10; 
	 
	#100				 
	 
	Inst_F=6'bxxxxxx;				    // case of lw, sw 
	ALUOp=00; 
	 
	#100		   
	 
	Inst_F=6'bxxxxxx;				    // case of beq 
	ALUOp=01; 
	 
	#100		 
	 
     
	$finish; 
	 
end 
 
endmodule 