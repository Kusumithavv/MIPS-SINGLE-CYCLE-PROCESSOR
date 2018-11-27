`timescale 1 ns / 1 ps 

module _5b_MUX (Input_A, Input_B, signal, result); 
	  
input [4:0] Input_A, Input_B; 
input signal; 
 
output [4:0] result;		 
 
reg[4:0] temp; 
 
always @(Input_A or Input_B or signal) begin 
	if (signal==0) 
		temp=Input_A; 
	else 
		temp=Input_B; 
		 
end					 
 
assign result=temp; 
	 
 
endmodule 

 