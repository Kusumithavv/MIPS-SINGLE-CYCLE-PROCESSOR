`timescale 1 ns / 1 ps
module Adder_Branch (PC_4, Imm, result); 
 
input [31:0] PC_4; 
input [31:0] Imm; 
 
output [31:0] result;  	 

assign result=PC_4+(Imm*4); 	 
 
endmodule 