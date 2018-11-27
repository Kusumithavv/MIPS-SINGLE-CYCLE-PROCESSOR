`timescale 1 ns / 1 ps 
 
 
module tb_Sign_extension (); 
															    	  
 
reg [15:0] Input_val;				  // input 
 
wire [31:0] Output_val;	   		  // output					 
 
Sign_extension se(Input_val, Output_val); 
 
 
 
initial begin  
	$monitor ("Input_val= %b\nOutput_val=%b\n",Input_val, Output_val); 
	 
	 
	Input_val=16'b1000100010001000; 
	 
	#100		  
	 
	Input_val=16'b0001000100010001; 
	 
	#100 
 
	 
 
	 
	$finish;	   
	 
end 
 
 
endmodule 