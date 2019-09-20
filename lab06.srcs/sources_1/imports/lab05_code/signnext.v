`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 09:34:50
// Design Name: 
// Module Name: signnext
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


module signext(inst, data);
	input[15:0] inst;
	output[31:0] data;
		
	assign data = (inst[15])? {16'hffff, inst} : {16'h0000, inst};
	
endmodule
