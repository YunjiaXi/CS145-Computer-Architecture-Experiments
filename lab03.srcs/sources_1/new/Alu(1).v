`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 10:23:36
// Design Name: 
// Module Name: Alu
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


module Alu(input [31:0] input1,input [31:0] input2,
    input [3:0] aluCtr,output Zero,output [31:0] ALURes);
    reg zero;
    reg [31:0] aluRes;
    always @ (input1 or input2 or aluCtr)
    begin
        case (aluCtr)
            4'b0010: //add
                aluRes = input1 + input2;   
            4'b0110: //sub
                aluRes = input1 - input2;
            4'b0000: //AND
                aluRes = input1 & input2;
            4'b0001: //OR
                aluRes = input1 | input2;
            4'b0111: // set less than
                if (input1<input2)
                    aluRes = 1;
                else
                    aluRes = 0;
            4'b1100: //NOR
            begin
                aluRes = input1 | input2;
                aluRes = ~aluRes;
            end
        endcase
         if (aluRes == 0)
                    zero = 1;
                else
                    zero = 0;
    end
    assign Zero = zero;
    assign ALURes = aluRes;
endmodule
