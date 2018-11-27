`timescale 1 ns / 1 ps 
 
module tb_5b_MUX (); 
 
reg [4:0] Input_A, Input_B;	// inputs 
reg signal; 
 
wire [4:0] result;					// output 
 
 
 
_5b_MUX mux(Input_A, Input_B, signal, result); 
 
 
 
initial begin  
	$monitor ("Input_A= %b, Input_B=%b, signal=%b, result=%b\n",Input_A, Input_B, signal, result); 
	 
	 
	Input_A=1; 
	Input_B=7; 
	signal=0; 
	 
	#100		  
	 
	signal=1; 
	 
	#100 
 
	 
 
	 
	$finish;	   
	 
end 
 
endmodule 