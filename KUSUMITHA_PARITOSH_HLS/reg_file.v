`timescale 1 ns / 1 ps 
 
 
module Register_file (clk, Inst_B, Inst_C, Write_register, Write_data, RegWrite, Read_data1, Read_data2); 
 
input [4:0] Inst_B, Inst_C, Write_register; 
input RegWrite;	   
input [31:0] Write_data;	 
input clk; 
 
output [31:0] Read_data1, Read_data2; 
 
reg [31:0] Registers [0:31];		  
 
initial begin  
	Registers[0]=0;						 // $0 = 0 
	Registers[1]=0;						 // $1 = 0 for default 
	Registers[2]=4;						 // $2 = 4 for default 
	Registers[3]=8;						 // $3 = 8 for default 
	Registers[4]=12;   					 // $4 = 12 for default 
	Registers[18]=0;				   	     // $18 = 0 for default 
end															 	   
 
always @(negedge clk) begin 			// Writing at falling edge 
	 
if (RegWrite ==1) 
	Registers[Write_register]=Write_data; 	 
end	 
 
 
 
assign  Read_data1=Registers[Inst_B];   
assign  Read_data2=Registers[Inst_C]; 
 
 
endmodule 

 