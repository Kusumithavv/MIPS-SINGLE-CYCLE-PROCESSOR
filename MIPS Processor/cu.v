`timescale 1 ns / 1 ps
module Control_unit (Inst_A, RegDst, Jump, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite, Exception); 
	 
input[5:0] Inst_A;	  				    
 
output RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Exception; 
output[1:0] ALUOp;					    
 
reg ex; 
 
initial begin 
	ex=0; 
end 
 
reg [7:0] temp; 
reg [1:0] ALUOp_temp;   
 
always @Inst_A begin  
	case (Inst_A) 
		6'b000000 : 					   // R-type 
		begin 
			temp=8'b11000000;  
			ALUOp_temp=2'b10; 
		end 
		 
		6'b100011:                    	// lw 
		begin 
			temp=8'b01101100;  
			ALUOp_temp=2'b00; 
		end 
		 
		6'b101011:                     	// sw 
		begin 
			temp=8'bx0110x00;  
			ALUOp_temp=2'b00; 
		end 
		 
		6'b000100:						// beq 
		begin 
			temp=8'bx0000x10;  
			ALUOp_temp=2'b01; 
		end 
		 
		6'b000010:						// jump 
		begin			 
			temp=8'bx0x00x01;  
			ALUOp_temp=2'bxx; 
			 
		end			   
		 
		default:                          	// for exception 
		begin 
			temp=8'bxxxxxxx1; 
			ALUOp_temp=2'bxx; 
			ex=1; 
		end 
		 
		 
	endcase 
	 
end 
 
 
assign RegDst=temp[7]; 
assign RegWrite=temp[6]; 
assign ALUSrc=temp[5]; 
 
assign MemWrite=temp[4]; 
assign MemRead=temp[3]; 
assign MemtoReg=temp[2]; 
assign Branch=temp[1]; 
assign Jump=temp[0]; 
		 
assign ALUOp=ALUOp_temp;			 
 
assign Exception=ex; 
 
 
 
endmodule