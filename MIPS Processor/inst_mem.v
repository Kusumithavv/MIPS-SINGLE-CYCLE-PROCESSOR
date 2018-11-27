`timescale 1 ns / 1 ps 
  
module Instruction_memory (clk, PC, Inst_A, Inst_B, Inst_C, Inst_D, Inst_E, Inst_F, Inst_G);	 
	 
input clk; 
input[31:0] PC;		  
 
output[5:0] Inst_A; 
output[4:0] Inst_B, Inst_C, Inst_D; 
output[15:0] Inst_E; 
output[5:0] Inst_F; 
output [25:0] Inst_G; 
 
 
 
reg [7:0] Inst_Mem[0:100];			 
 
initial begin 		   
	 
	Inst_Mem[0]=8'b10001100;  			   // lw $5, 0($1) 
	Inst_Mem[1]=8'b00100101; 
	Inst_Mem[2]=8'b0; 
	Inst_Mem[3]=8'b0; 
	 
	Inst_Mem[4]=8'b10001100;			 	// lw $6, 4($1) 
	Inst_Mem[5]=8'b00100110; 
	Inst_Mem[6]=8'b0; 
	Inst_Mem[7]=8'b00000100;	    
	 
	Inst_Mem[8]=8'b10001100;				// lw $7, 0($3) 
	Inst_Mem[9]=8'b01100111; 
	Inst_Mem[10]=8'b0; 
	Inst_Mem[11]=8'b0; 
	 
	Inst_Mem[12]=8'b10001100;              	// lw $8, 4($3) 
	Inst_Mem[13]=8'b01101000; 
	Inst_Mem[14]=8'b0; 
	Inst_Mem[15]=8'b00000100; 
	 
	Inst_Mem[16]=8'b0;							 // add $9, $5, $6 
	Inst_Mem[17]=8'b10100110; 
	Inst_Mem[18]=8'b01001000; 
	Inst_Mem[19]=8'b00100000; 
	 
	Inst_Mem[20]=8'b00000001;				// sub $10, $8, $7 
	Inst_Mem[21]=8'b00000111; 
	Inst_Mem[22]=8'b01010000; 
	Inst_Mem[23]=8'b00100010; 
	 
	Inst_Mem[24]=8'b10101100;				// sw $9, 4($4) 
	Inst_Mem[25]=8'b10001001; 
	Inst_Mem[26]=8'b0; 
	Inst_Mem[27]=8'b00000100; 
	 
	Inst_Mem[28]=8'b10101100;			   // sw $10, 8($4) 
	Inst_Mem[29]=8'b10001010; 
	Inst_Mem[30]=8'b0; 
	Inst_Mem[31]=8'b00001000;	 
	 
	Inst_Mem[32]=8'b0;						   // mult $11, $2, $3 
	Inst_Mem[33]=8'b01000011; 
	Inst_Mem[34]=8'b01011000; 
	Inst_Mem[35]=8'b00011000;	 
	 
	Inst_Mem[36]=8'b0;						   // div $12, $3, $2 
	Inst_Mem[37]=8'b01100010; 
	Inst_Mem[38]=8'b01100000; 
	Inst_Mem[39]=8'b00011010;				   
	 
	Inst_Mem[40]=8'b0;			  			  // and $13, $3, $4 
	Inst_Mem[41]=8'b01100100; 
	Inst_Mem[42]=8'b01101000; 
	Inst_Mem[43]=8'b00100100;				 
	 
	Inst_Mem[44]=8'b0;			 			  // or $14, $2, $3 
	Inst_Mem[45]=8'b01000011; 
	Inst_Mem[46]=8'b01110000; 
	Inst_Mem[47]=8'b00100101;			 
	 
	Inst_Mem[48]=8'b0;						   // nor $15, $2, $3 
	Inst_Mem[49]=8'b01000011; 
	Inst_Mem[50]=8'b01111000; 
	Inst_Mem[51]=8'b00100111;				   
	 
	Inst_Mem[52]=8'b0;						   // slt $16, $2, $3 
	Inst_Mem[53]=8'b01000011; 
	Inst_Mem[54]=8'b10000000; 
	Inst_Mem[55]=8'b00101010;		    
	 
	Inst_Mem[56]=8'b00000001;			  			 //  add $17, $8, $8 
	Inst_Mem[57]=8'b00001000; 
	Inst_Mem[58]=8'b10001000; 
	Inst_Mem[59]=8'b00100000;			 
	 
	Inst_Mem[60]=8'b00000010;			   // add $17, $17, $6 
	Inst_Mem[61]=8'b00100110; 
	Inst_Mem[62]=8'b10001000; 
	Inst_Mem[63]=8'b00100000;		   
	 
	Inst_Mem[64]=8'b00000000;			   // div $2, $5, $5 
	Inst_Mem[65]=8'b10100101; 
	Inst_Mem[66]=8'b00010000; 
	Inst_Mem[67]=8'b00011010;			    
	 
	Inst_Mem[68]=8'b00000000;			   // add $1, $1, $2 
	Inst_Mem[69]=8'b00100010; 
	Inst_Mem[70]=8'b00001000; 
	Inst_Mem[71]=8'b00100000;				 
	 
	Inst_Mem[72]=8'b00000010;			   // add $18, $18, $1 
	Inst_Mem[73]=8'b01000001; 
	Inst_Mem[74]=8'b10010000; 
	Inst_Mem[75]=8'b00100000;	 
	 
	Inst_Mem[76]=8'b00010010;			   // beq $17, $1, 2 
	Inst_Mem[77]=8'b00100001; 
	Inst_Mem[78]=8'b00000000; 
	Inst_Mem[79]=8'b00000001;					  
	 
	Inst_Mem[80]=8'b00001000;			   // j 17 
	Inst_Mem[81]=8'b0; 
	Inst_Mem[82]=8'b0; 
	Inst_Mem[83]=8'b00010001;				   
	 
	Inst_Mem[84]=8'b10101100;			   // sw $18, 0($17) 
	Inst_Mem[85]=8'b00110010; 
	Inst_Mem[86]=8'b00000000; 
	Inst_Mem[87]=8'b00000000;	    
	 
	Inst_Mem[88]=8'b11111100;			   // exception : undefined instruction 
	Inst_Mem[89]=8'b0; 
	Inst_Mem[90]=8'b0; 
	Inst_Mem[91]=8'b0;	    
	 
	 
	 
	 
	 
end 
 
 
 
reg [31:0] temp;			   
 
 
always @(posedge clk) begin 			  // Fetching at rising edge 
	temp[31:24]=Inst_Mem[PC];	 
	temp[23:16]=Inst_Mem[PC+1];	 
	temp[15:8]=Inst_Mem[PC+2]; 
	temp[7:0]=Inst_Mem[PC+3]; 
end 
 
assign Inst_A=temp[31:26];	 	 // to control unit 
assign Inst_B=temp[25:21]; 	  
assign Inst_C=temp[20:16];  
assign Inst_D=temp[15:11];  
assign Inst_E=temp[15:0];   
assign Inst_F=temp[5:0];	 
assign Inst_G=temp[25:0]; 
 
 
 
endmodule 