`timescale 1 ns / 1 ps 
 
module tb_ALU (); 
 
reg [31:0] Data_1;							   // inputs 
reg [31:0] Data_2;	  
reg [3:0] ALU_control_signal; 
														    
wire Zero;											// outputs 
wire [31:0] ALUresult;	 
 
ALU alu(Data_1, Data_2, ALU_control_signal, Zero, ALUresult); 
 
 
 
initial begin  
	$monitor ("Data_1= %b \nData_2=%b \nData_1(decimal)=%d, Data_2(decimal)=%d\nALU_control_signal=%b, Zero=%b \nALUresult=%b\nALUresult(decimal)=%d\n",Data_1, Data_2, Data_1, Data_2, ALU_control_signal, Zero, ALUresult, ALUresult); 
	 
	 
	Data_1=3; 
	Data_2=5;  
	ALU_control_signal=4'b0010; 		// add operation 
	 
	#100		  
	 
	ALU_control_signal=4'b0110;     	// sub operation 
	 
	#100		 
	 
	ALU_control_signal=4'b1111;    	// mult operation 
	 
	#100							    
	 
	ALU_control_signal=4'b1110;		 // div operation 
	 
	#100							   
	 
	ALU_control_signal=4'b0000;		 // and operation 
	 
	#100		  
	 
	ALU_control_signal=4'b0001;		 // or operation 
	 
	#100									  
	 
	ALU_control_signal=4'b1100;		 // nor operation 
	 
	#100										   						    
	 
	ALU_control_signal=4'b0111;		 // slt operation 
	 
	#100	 
	 
	Data_1=5; 
	Data_2=5;  
	ALU_control_signal=4'b0110; 		// sub operation for showing Zero 
	 
	#100	 
	 
	$finish; 
	 
end 
endmodule 