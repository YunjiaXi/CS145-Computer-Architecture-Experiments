`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 09:52:18
// Design Name: 
// Module Name: ALUCtr_tb
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


module ALUCtr_tb(

    );
    reg [1:0] aluOp;
    reg [5:0] funct;
    wire [3:0] aluCtrOut;
    ALUCtr u0(aluOp,funct,aluCtrOut);
    initial begin
        #100 
        aluOp=2'b00;
        funct=6'bxxxxxx;
        #100 
        aluOp=2'bx1;
        funct=6'bxxxxxx;
        #100 
        aluOp=2'b1x;
        funct=6'bxx0000;
        #100 
        funct=6'bxx0010;
        #100 
        aluOp=2'b1x;
        funct=6'bxx0100;
        #100 
        aluOp=2'b1x;
        funct=6'bxx0101;
        #100 
        aluOp=2'b1x;
        funct=6'bxx1010;
    end
endmodule
