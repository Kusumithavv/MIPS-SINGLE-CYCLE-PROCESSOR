`timescale 1 ns / 1 ps  
 
module _32b_MUX (Input_A, Input_B, signal, result); 
 
input [31:0] Input_A, Input_B; 
input signal; 
 
output [31:0] result;		 
 
reg[31:0] temp; 
 
always @(Input_A or Input_B or signal) begin 
	if (signal==0) 
		temp=Input_A; 
	if (signal==1) 
		temp=Input_B; 
		 
end					 
 
assign result=temp; 
	 
 
 
endmodule 