module ALU (Data_1, Data_2, ALU_control_signal, Zero, ALUresult); 
 
input[31:0] Data_1; 
input[31:0] Data_2;	  
input[3:0] ALU_control_signal; 
output Zero; 
output[31:0] ALUresult;	   
 
reg [31:0] temp;	    
reg tempZero; 
 
always @(Data_1 or Data_2 or ALU_control_signal) begin   
	case (ALU_control_signal)   
		4'b0010:					// add 
		begin	   
			temp=Data_1+Data_2;			 
		end 
		 
		4'b0110:					// sub 
		begin 
			temp=Data_1-Data_2; 
			if (temp==0) 
				tempZero=1; 
			else 
				tempZero=0; 
		end 
		 
		4'b1111:				        // mult 
		begin 
			temp=Data_1*Data_2; 
		end 
		 
		4'b1110:				        // div 
		begin 
			temp=Data_1/Data_2; 
		end 
		 
		4'b0000:				         // and 
		begin 
			temp=Data_1&Data_2; 
		end 
		 
		4'b0001:					 // or 
		begin 
			temp=Data_1|Data_2; 
		end 
		 
		4'b1100:					 // nor 
		begin 
			temp=~(Data_1|Data_2); 
		end 
		 
		4'b0111:					 // slt 
		begin 
			if (Data_1<Data_2) 
				temp=32'hFFFFFFFF; 
			else 
				temp=0; 
		end 
		 
	endcase	 
	 
 
	 
end	   
 
assign ALUresult=temp; 
 
assign Zero=tempZero; 
 
 
endmodule