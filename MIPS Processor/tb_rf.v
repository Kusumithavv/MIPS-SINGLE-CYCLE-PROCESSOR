`timescale 1 ns / 1 ps 
 
 

module tb_Register_file (); 
 
 
reg [4:0] Inst_B, Inst_C, Write_register;	  // inputs 
reg RegWrite;	   
reg [31:0] Write_data; 
 
wire [31:0] Read_data1; 						      // outputs 
wire [31:0] Read_data2; 
 
reg clk;													      // clock generate 
 
initial	 begin 
 	clk=1; 
	forever #20 clk=~clk; 
end			 
 
Register_file rf(clk, Inst_B, Inst_C, Write_register, Write_data, RegWrite, Read_data1, Read_data2); 
 
 
 
initial begin  
	$monitor ("Inst_B= %b, inst_C=%b, Write_register=%b, Write_data=%d, RegWrite=%b\nRead_data1=%d, Read_data2=%d\nRegister[0]=%d, 	Register[1]=%d, Register[2]=%d, Register[3]=%d\n",Inst_B, Inst_C, Write_register, Write_data, RegWrite, Read_data1, Read_data2,rf.Registers[0], rf.Registers[1], rf.Registers[2], rf.Registers[3]); 
	 
		 
	Inst_B=1; 
	Inst_C=1; 
	Write_register=1; 
	Write_data=32'd200; 
	RegWrite=1; 
	 
	 
	#100		 												  
	 
	Inst_B=1; 
	Inst_C=1; 
	Write_register=2; 
	Write_data=32'd300; 
	RegWrite=1;	 
	 
	#100	  	    
	 
	Inst_B=1; 
	Inst_C=1; 
	Write_register=3; 
	Write_data=32'd400; 
	RegWrite=1;		  
	 
	#100	  	   
	 
	Inst_B=1; 
	Inst_C=1; 
	Write_register=0; 
	Write_data=0; 
	RegWrite=0;	 
	 
	#100	  	  	   
	 
	Inst_B=2; 
	Inst_C=3; 
	Write_register=0; 
	Write_data=0; 
	RegWrite=0;	 
	 
	#100	  	 
	 
	 
 
	 
	$finish;	   
	 
end 
 
endmodule 