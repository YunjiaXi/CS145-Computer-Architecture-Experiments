`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 08:54:56
// Design Name: 
// Module Name: Ctr_tb
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


module Ctr_tb(
    
    );
    reg [5:0] opCode;
    wire regDst;
    wire aluSrc;
    wire memToReg;
    wire regWrite;
    wire memRead;
    wire memWrite;
    wire branch;
    wire [1:0] aluOp;
    wire jump;
    Ctr u0(opCode,regDst,aluSrc,memToReg,regWrite,memRead,memWrite,branch,aluOp,jump);
    initial begin
        opCode = 0;
        
        #100 //wait 100 ns
        
        #100 opCode = 6'b000000; //R-type
        #100 opCode = 6'b100011; //lw
        #100 opCode = 6'b101011; //sw
        #100 opCode = 6'b000100; //beq
        #100 opCode = 6'b000010; //jump
    end
endmodule
