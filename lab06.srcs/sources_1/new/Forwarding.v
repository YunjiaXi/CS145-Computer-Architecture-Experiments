`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/07 12:36:05
// Design Name: 
// Module Name: Forwarding
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


module Forwarding(
    input clock,
    input [4:0] MEM_Rd,
    input [4:0] WB_Rd,
    input [4:0] EX_Rs,
    input [4:0] EX_Rt,
    input MEM_RegWrite,
    input WB_RegWrite,
    output reg [1:0] aluSrc1,
    output reg [1:0] aluSrc2
    );
    initial begin
        aluSrc1 = 0;
        aluSrc2 = 0;
    end
    always @(negedge clock)
    begin
        aluSrc1 = 2'b00;
        aluSrc2 = 2'b00;
        if (MEM_RegWrite && (MEM_Rd!=0) && (MEM_Rd==EX_Rs))
            aluSrc1 = 2'b10;
        if (WB_RegWrite && (WB_Rd!=0) && (WB_Rd==EX_Rs))
            aluSrc1 = 2'b01;
        if (MEM_RegWrite && (MEM_Rd!=0) && (MEM_Rd==EX_Rt))
            aluSrc2 = 2'b10;
        if (WB_RegWrite && (WB_Rd!=0) && (WB_Rd==EX_Rt))
            aluSrc2 = 2'b01;
    end
endmodule
