`timescale 1 ns / 1 ps 
 
module tb_Data_memory (); 
 
 
 
		 
reg[31:0] Address, Writedata;		// inputs 
reg MemWrite, MemRead;   			 
 
 
reg clk;									        // clock generate 
 
initial	 begin 
 	clk=1; 
	forever #20 clk=~clk; 
end			 
								 
 
wire [31:0] Readdata;		   		   // output 
 
Data_memory dm(clk, Address, Writedata, MemWrite, MemRead, Readdata); 
							   
 
 
 
initial begin  
	$monitor ("Address= %b, Address(decimal)=%d\nMem[Address]=%b%b%b%b, Mem[Address](decimal)=%d\nWritedata=%b, Writedata(decimal)=%d\nMemWrite=%b, MemRead=%b, Readdata=%b\nReaddata(decimal)=%d\n",Address, Address, dm.mem[Address], dm.mem[Address], dm.mem[Address+1], dm.mem[Address+2], dm.mem[Address+3], Writedata, Writedata, MemWrite, MemRead, Readdata, Readdata); 
	 
	 
	Address=0; 
	Writedata=9999; 
	MemWrite=1;	  
	MemRead=0; 
	 
	#100		  
	 
	Address=4; 
	Writedata=7777; 
	MemWrite=1;	  
	MemRead=0; 
	 
	#100 
	 
	Address=0; 
	Writedata=32'bx; 
	MemWrite=0;	  
	MemRead=1; 
	 
	#100 
	 
	Address=4; 
	Writedata=32'bx; 
	MemWrite=0;	  
	MemRead=1; 
	 
	#100 
 
	 
	$finish;	   
	 
end 
 
 
	 
 
endmodule 