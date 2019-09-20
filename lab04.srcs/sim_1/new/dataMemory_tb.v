`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 09:35:47
// Design Name: 
// Module Name: dataMemory_tb
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


module dataMemory_tb(

    );
    reg Clk;
    reg [31:0] address;
    reg [31:0] writeData;
    reg memWrite;
    reg memRead;
    wire [31:0] readData;
    
    dataMemory u0(Clk,address,writeData,memWrite,memRead,readData);
    
    parameter PERIOD =50;
    always #(PERIOD*2) Clk = !Clk;
    
    initial begin
        Clk = 0;
        writeData = 0;
        address=0;
        memWrite = 0;
        memRead = 0;
     
        #185;
        memWrite = 1;
        address = 32'h00000007;
        writeData = 32'he0000000;
        
        #100;
        memWrite = 1;
        writeData = 32'hffffffff;
        address = 32'h00000006;
        
        #185;
        memRead =1;
        memWrite = 0;
       
        #80;
        memWrite = 1;
        address = 8;
        writeData = 32'haaaaaaaa;
          
        #80;
        memWrite = 0;
        address = 32'h00000007;
        memRead = 1;
    end
endmodule
