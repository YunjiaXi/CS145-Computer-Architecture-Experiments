`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 22:14:31
// Design Name: 
// Module Name: Hazard_detection
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


module Hazard_detection(clock, EX_Rt, ID_Rs, ID_Rt, EX_MemRead, stall);
    input clock;
    input [4:0] EX_Rt;
    input [4:0] ID_Rs;
    input [4:0] ID_Rt;
    input EX_MemRead;
    output reg stall;
    initial begin
        stall = 0;
    end
    always @(posedge clock)
    begin
        stall = EX_MemRead &&((EX_Rt==ID_Rs) || (EX_Rt==ID_Rt));
    end
endmodule
