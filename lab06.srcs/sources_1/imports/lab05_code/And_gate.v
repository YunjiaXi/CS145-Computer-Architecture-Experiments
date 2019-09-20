`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/23 23:23:38
// Design Name: 
// Module Name: And_gate
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


module And_gate(INPUT1, INPUT2, OUTPUT);
    input INPUT1;
	 input INPUT2;
	 output OUTPUT;
	 assign OUTPUT = INPUT1 & INPUT2;

endmodule
