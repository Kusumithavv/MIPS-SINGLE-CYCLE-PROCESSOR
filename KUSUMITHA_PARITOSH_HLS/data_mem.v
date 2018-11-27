`timescale 1 ns / 1 ps 
 
module Data_memory (clk, Address, Writedata, MemWrite, MemRead, Readdata); 
input[31:0] Address, Writedata; 
input MemWrite, MemRead;    
input clk; 
 
output[31:0] Readdata;	 
 
reg [7:0] mem [0:199];	 					// size is 200 
 
reg [31:0] temp;	    
 
initial begin										    
	mem[0]=0;									  // mem[0] = 10 for default 
	mem[1]=0; 
	mem[2]=0; 
	mem[3]=8'b00001010; 
	 
	mem[4]=0;									  // mem[4] = 20 for default 
	mem[5]=0; 
	mem[6]=0; 
	mem[7]=8'b00010100; 
	 
	mem[8]=0;									 // mem[8] = 30 for default 
	mem[9]=0; 
	mem[10]=0; 
	mem[11]=8'b00011110; 
	 
	mem[12]=0;									 // mem[12] = 40 for default 
	mem[13]=0; 
	mem[14]=0; 
	mem[15]=8'b00101000;	  
	 
end 
 
 
always @(negedge clk) begin						// Writing at falling edge 
	if(MemWrite==1) begin 
		mem[Address]=Writedata[31:24]; 
		mem[Address+1]=Writedata[23:16]; 
		mem[Address+2]=Writedata[15:8]; 
		mem[Address+3]=Writedata[7:0];   
	 
	end 
	 
end 
 
always @(Address or MemRead) begin 
	if(MemRead==1) begin 
		temp[31:24]=mem[Address]; 
		temp[23:16]=mem[Address+1]; 
		temp[15:8]=mem[Address+2]; 
		temp[7:0]=mem[Address+3]; 
	end 
	 
end			 
 
assign Readdata=temp; 
	 
 
endmodule 