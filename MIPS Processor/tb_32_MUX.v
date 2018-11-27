`timescale 1 ns / 1 ps 
 
/* 
/////////////////////////////////////////////////////////////////// 
///////////////////////////////////////////////////////////////////// 
 
Author :  Jongho Kim 
Name of Module : tb_32b_MUX 
 
Description :  
 This module verifies _5b_MUX. Initially Input_A, Input_B has '1111', '9999' 
decimal value each, and as changing signal '0' to '1', we can see  
result value is also changed correctly. 
 
///////////////////////////////////////////////////////////////////// 
/////////////////////////////////////////////////////////////////// 
*/ 
 
 
module tb_32b_MUX (); 
 
 
reg [31:0] Input_A, Input_B;					// inputs 
reg signal; 
 
wire [31:0] result;								 // output 
 
 
 
_32b_MUX mux(Input_A, Input_B, signal, result); 
 
 
 
initial begin  
	$monitor ("Input_A= %b, Input_B=%b \nsignal=%b, result=%b\n",Input_A, Input_B, signal, result); 
	 
	 
	Input_A=1111; 
	Input_B=9999; 
	signal=0; 
	 
	#100		  
	 
	signal=1; 
	 
	#100 
 
	 
 
	 
	$finish;	   
	 
end 
 
 
endmodule 