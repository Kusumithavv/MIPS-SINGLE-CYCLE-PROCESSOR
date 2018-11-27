`timescale 1 ns / 1 ps 

 
module tb_Calc_Jump (); 
reg [25:0] Inst_G;							  // inputs 
reg [31:0] PC_4; 								   
wire [31:0] Jump_target;  				// output 
 
 
Calc_Jump cj(Inst_G, PC_4, Jump_target); 
 
 
initial begin  
	$monitor ("Inst_G= %b\nPC_4=%b, Jump_target=%b\n",Inst_G, PC_4, Jump_target); 
	 
	 
	Inst_G=25'b0011010100110011000011001; 
	PC_4=32'b10010000000000000000000000000000; 
	 
	#100		  
	 
	Inst_G=25'b0000000000000000000000000;  
	PC_4=32'b11110000000000000000000000000000; 
	 
	#100		    
	 
	Inst_G=25'b1111111111111111111111111; 
	PC_4=32'b00000000000000000000000000000000; 
	 
	#100															 
	 
	Exception=1;												  // case of exception 
	 
	#100 
	 
	 
	 
	$finish; 
	 
end 
 
 
endmodule 