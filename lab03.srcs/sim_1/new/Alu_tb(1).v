`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 10:44:37
// Design Name: 
// Module Name: Alu_tb
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


module Alu_tb();
    reg [31:0] input1;
    reg [31:0] input2;
    reg [3:0] aluCtr;
    wire Zero;
    wire [31:0] ALURes;
    
    Alu u0(input1,input2,aluCtr,Zero,ALURes);
    
    initial begin
    #100
    input1 = 32'd15;
    input2 = 32'd10;
    aluCtr = 4'b0000; //and
    #100  aluCtr = 4'b0001;  //or
    #100  aluCtr = 4'b0010;  //add
    #100  aluCtr = 4'b0110;  //sub
    #100  aluCtr = 4'b0111;  //alt
    #100  aluCtr = 4'b1100;  //nor
    end
endmodule
