`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 11:34:55
// Design Name: 
// Module Name: Mux
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


module Mux_5(SEL, INPUT1, INPUT2, OUTPUT);
    input SEL;
	 input [4:0] INPUT1;
	 input [4:0] INPUT2;
	 output [4:0] OUTPUT;
	 assign OUTPUT = (SEL) ? INPUT2 : INPUT1;
endmodule

module Mux_32(SEL, INPUT1, INPUT2, OUTPUT);
    input SEL;
	 input [31:0] INPUT1;
	 input [31:0] INPUT2;
	 output [31:0] OUTPUT;
	 assign OUTPUT = (SEL) ? INPUT2 : INPUT1;
endmodule

module Mux_32_3way(select, IN1, IN2, IN3, OUT);
    input [1:0] select;
	 input [31:0] IN1; //00
	 input [31:0] IN2; //01
	 input [31:0] IN3; //10
	 output [31:0] OUT;
	 assign OUT = (select==0) ? IN1 : ((select[1]==0) ? IN2 : IN3);
endmodule

module Mux_32_4way(select, ALUsrc, IN1, IN2, IN3, IN4, OUT);
    input [1:0] select;
    input ALUsrc;  //select,ALUsrc
	input [31:0] IN1; //000
	input [31:0] IN2; //010
    input [31:0] IN3; //x10
	input [31:0] IN4; //xx1
	output [31:0] OUT;
	assign OUT = (ALUsrc==1)?IN4: ((select==0) ? IN1 : ((select[1]==0) ? IN2 : IN3));
endmodule