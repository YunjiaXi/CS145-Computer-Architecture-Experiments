`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/23 23:19:52
// Design Name: 
// Module Name: PC
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
module PC(clock, reset, Input, Output, stall);
    input clock;
	 input reset;
	 input [31:0] Input;
	 input stall;
	 output reg [31:0] Output;
	 initial begin
	    Output = 0;
	 end
	 always @ (posedge clock)
	 begin	     
		 if (!stall) Output = Input;
		 if (reset==1) Output = 32'h00000000;
	 end

endmodule