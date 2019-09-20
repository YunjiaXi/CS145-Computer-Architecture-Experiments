`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 09:26:08
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(
    input Clk,
    input [31:0] address,
    input [31:0] writeData,
    input memWrite,
    input memRead,
    output [31:0] readData
    );
    
    reg [31:0] ReadData=0;
    reg [31:0] memFile[0:63];
    
    always@ (memRead or memWrite)
    begin
        ReadData = memFile[address];
    end
    
    always@ (negedge Clk)
    begin
        if (memWrite)
            memFile[address] = writeData;
    end
    assign readData = ReadData;
endmodule
