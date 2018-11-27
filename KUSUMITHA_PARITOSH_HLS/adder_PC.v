`timescale 1 ns / 1 ps
module Adder_PC (Input_A, Output_PC); 
 
input [31:0] Input_A; 
 
output [31:0] Output_PC; 
 
assign Output_PC=Input_A+4; 
 
 
 
endmodule 