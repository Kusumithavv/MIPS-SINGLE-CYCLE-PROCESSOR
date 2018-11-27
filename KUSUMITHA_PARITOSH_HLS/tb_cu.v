`timescale 1 ns / 1 ps 
 
module tb_Control_unit (); 
 
reg[5:0] Inst_A;	  			// input 
 
wire RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;   // outputs 
wire[1:0] ALUOp;						    
wire Exception;			   // for exception 
 
Control_unit cu(Inst_A, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, Exception); 
 
 
 
initial begin  
	$monitor ("Inst_A= %b, RegDst=%b, Jump=%b, Branch=%b \nMemRead=%b, MemtoReg=%b, ALUOp=%b, MemWrite=%b, ALUSrc=%b, RegWrite=%b\n",Inst_A, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite); 
	 
	 
	Inst_A=6'b000000;					  // some cases for test 
	 
	#100		  
	 
	Inst_A=6'b000010; 
	 
	#100		    
	 
	Inst_A=6'b101011; 
	 
	#100		 
 
	 
 
	 
	$finish;	   
	 
end 
 
endmodule 