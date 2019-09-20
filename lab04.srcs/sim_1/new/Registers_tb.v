`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 08:37:27
// Design Name: 
// Module Name: Registers_tb
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


module Registers_tb(

    );
    reg Clk;
    reg [25:21] readReg1;
    reg [20:16] readReg2;
    reg [4:0] writeReg;
    reg [31:0] writeData;
    reg regWrite;
    wire [31:0] readData1;
    wire [31:0] readData2;
    
    Registers uo(.Clk(Clk),.readReg1(readReg1),.readReg2(readReg2),
    .writeReg(writeReg),.writeData(writeData),.regWrite(regWrite),
    .readData1(readData1),.readData2(readData2));   
    
    parameter PERIOD =50;
    always #(PERIOD*2) Clk = !Clk;  //set clock
    
    initial begin
        Clk = 1'b0;
        regWrite = 1'b0;
        readReg1 = 5'b00000;
        readReg2 = 5'b00000;
        writeReg = 5'b00000;
        writeData = 32'h00000000;
        
        #285
        regWrite = 1'b1;
        writeReg = 5'b10101;
        writeData = 32'b11111111111111110000000000000000;
        
        #200
        writeReg = 5'b01010;
        writeData = 31'b00000000000000001111111111111111;
        
        #200
        regWrite = 1'b0;
        writeReg = 5'b00000;
        writeData = 32'h00000000;
        
        #50
        readReg1 = 5'b10101;
        readReg2 = 5'b01010;
    end
    
endmodule
