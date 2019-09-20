`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:31 04/17/2019 
// Design Name: 
// Module Name:    data_memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module dataMemory(clock_in, address, writeData, memWrite, memRead, readData);
	input clock_in;
	input[31:0] address;
	input[31:0] writeData;
	input memWrite;
	input memRead;
	output reg [31:0] readData;
	integer i;
    
	reg[31:0] memFile[0:63];
	initial begin
        for(i=0;i<10;i=i+1)
            memFile[i]=i;
        for(i=10;i<128;i=i+1)
            memFile[i]=0;
		  readData=0;
	 end
	 
	always @(address)
	begin
	  if(memRead==1)
	       readData = memFile[address];
	end
	
	always @(negedge clock_in)
	begin
		if (memWrite == 1)
			memFile[address] = writeData;
	end
endmodule
