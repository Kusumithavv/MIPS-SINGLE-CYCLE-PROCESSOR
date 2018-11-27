`timescale 1 ns / 1 ps 
 
 
module Sign_extension (Input_val, Output_val); 
 
input [15:0] Input_val; 
 
output [31:0] Output_val;	    
 
reg [15:0] temp;    
 
initial begin 
	temp=16'b0; 
end 
 
always @Input_val begin 							  // sign extension 
	if (Input_val[15]==1) 
		temp=16'b1111111111111111; 
	else 
		temp=16'b0; 
	 
end				   
 
assign Output_val[31:16]=temp[15:0];	 
assign Output_val[15:0]=Input_val[15:0]; 
 
endmodule 