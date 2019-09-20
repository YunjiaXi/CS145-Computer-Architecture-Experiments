`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/17 10:03:27
// Design Name: 
// Module Name: signext_tb
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


module signext_tb();
    reg [15:0] inst;
    wire [31:0] data;

    signext u0(inst,data);
    
    initial begin
    inst = 16'h0000;
    #100 inst = 16'h0001;
    #100 inst = 16'hffff;
    #100 inst = 16'h0002;
    #100 inst = 16'hfffe;
    end
endmodule
