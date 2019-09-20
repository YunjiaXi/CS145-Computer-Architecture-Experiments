`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 11:25:44
// Design Name: 
// Module Name: Registers
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


module Registers(
    input Clk,
    input [25:21] readReg1,
    input [20:16] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    input regWrite,
    output [31:0] readData1,
    output [31:0] readData2
    );
    reg [31:0] ReadData1=0;
    reg [31:0] ReadData2=0;
    reg [31:0] regFile[31:0];
    

    always @(readReg1 or readReg2 or writeReg)
    begin       
          readData1 = regFile[readReg1]; 
          readData2 = regFile[readReg2];
    end
    always @ (negedge Clk)
    begin
        if(regWrite==1 && writeReg!=0)
        begin
            regFile[writeReg] = writeData;
        end
    end
    assign readData1=ReadData1;
    assign readData2=ReadData2;
endmodule
