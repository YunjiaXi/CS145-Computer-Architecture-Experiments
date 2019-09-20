`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 11:15:19
// Design Name: 
// Module Name: InstMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module inst_memory(readAddr, inst);
    input [31:0] readAddr;
	 output [31:0] inst;
	 reg [31:0] memFile[0:63];
	 initial begin
	     $readmemb("C:/Users/yunji/Desktop/finial/work/mem_inst2.txt", memFile);
	 end
	 assign inst = memFile[readAddr>>2];
endmodule
