`timescale 1 ns / 1 ps 
 
module tb_Adder_PC (); 
 
 
 
reg [31:0] Input_A;						   				  // input 
 
wire [31:0] Output_PC;									  // output 
 
Adder_PC apc(Input_A, Output_PC);	  
 
 
 
initial begin  
	$monitor ("Input_A= %b\nOutput_PC=%b\n",Input_A, Output_PC); 
	 
	 
	Input_A=32'b1; 
	 
	#100		  
	 
	Input_A=32'b100; 
	 
	#100 
 
	 
 
	 
	$finish;	   
	 
end 
 
 
endmodule 