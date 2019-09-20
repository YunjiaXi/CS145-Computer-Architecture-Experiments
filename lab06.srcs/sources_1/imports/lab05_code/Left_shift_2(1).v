`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 11:40:06
// Design Name: 
// Module Name: Left_shift_2
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
module Left_shift_2(INPUT, OUTPUT);
    input [31:0] INPUT;
	 output [31:0] OUTPUT;
	 assign OUTPUT = INPUT<<2;
endmodule
