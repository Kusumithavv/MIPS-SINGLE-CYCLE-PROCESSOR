module Calc_Jump (Inst_G, PC_4, Jump_target); 
 
input [25:0] Inst_G; 
input [31:0] PC_4; 			    
			  
 
output [31:0] Jump_target;  
 
reg [31:0] temp; 
 
always @(Inst_G or PC_4 ) begin				 
	temp[27:0]=Inst_G*4;   
	temp[31:28]=PC_4[31:28]; 
	 
end 
 
assign Jump_target=temp; 
 
	 
 
endmodule 