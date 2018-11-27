`timescale 1 ns / 1 ps
module ALU_Control (Inst_F, ALUOp, ALU_control_signal); 
 
input [5:0] Inst_F; 
input [1:0] ALUOp; 
 
output [3:0] ALU_control_signal;		 
 
reg [3:0] temp; 
 
always @(Inst_F or ALUOp) begin 
	if (ALUOp==2'b00)  
		temp=4'b0010;	 
		 
	if (ALUOp==2'b01) 
		temp=4'b0110; 
	if (ALUOp==2'b10) begin 
		if (Inst_F==6'b100000)					   		// add 
			temp=4'b0010;  			  		   
			 
		if (Inst_F==6'b100010)		                   	// sub 
			temp=4'b0110;				 
			 
		if (Inst_F==6'b011000)		                   	// mult 
			temp=4'b1111;  

		if (Inst_F==6'b011010)		   					// div 
			temp=4'b1110; 	 

		if (Inst_F==6'b100100)						  	// and 
			temp=4'b0000;					   
			 
		if (Inst_F==6'b100101)                        	// or 
			temp=4'b0001;	 		  
			 
		if (Inst_F==6'b100111)						  	// nor 
			temp=4'b1100;	 				 
			 
		if (Inst_F==6'b101010)						  	// slt 
			temp=4'b0111; 
			 
		end							 				    
		 
	end 
 
	assign ALU_control_signal = temp; 
 
endmodule  