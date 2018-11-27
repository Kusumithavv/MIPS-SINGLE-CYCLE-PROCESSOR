`timescale 1 ns / 1 ps 

module tb_Adder_Branch (); 
 
reg [31:0] PC_4;				   // inputs 
reg [31:0] Imm; 
 
wire [31:0] result;  			   // output 
 
Adder_Branch ab(PC_4, Imm, result);	  
 
 
 
initial begin  
	$monitor ("PC_4=%b \nImm=%b \nresult=%b \nPC_4(decimal)=%d, Imm(decimal)=%d, result(decimal)=%d\n",PC_4, Imm, result, PC_4, Imm, result); 
	 
	 
	PC_4=32'b01;	  
	Imm=32'b10001; 
	 
	#100		  
	 
	PC_4=32'b0101;	  
	Imm=32'b00001; 
	 
	#100 
 
	 
 
	 
	$finish;	   
	 
end 
 
 
endmodule 