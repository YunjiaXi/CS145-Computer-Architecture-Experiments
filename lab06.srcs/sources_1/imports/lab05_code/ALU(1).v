`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 10:21:26
// Design Name: 
// Module Name: ALU
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


module ALU(input1, input2, aluCtr, zero, aluRes);
    input [31:0] input1;
    input [31:0] input2;
    input [3:0] aluCtr;
    output zero;
    output [31:0] aluRes;

    reg Zero;
    reg [31:0] AluRes;
    
    always @ (input1 or input2 or aluCtr)
    begin
        case (aluCtr)
            4'b0010: AluRes = input1 + input2; //add
            4'b0110: AluRes = input1 - input2; //subtract
            4'b0000: AluRes = input1 & input2; //and
            4'b0001: AluRes = input1 | input2; //or
            //4'b0011: AluRes = input2 << input1; //sll
            //4'b0100: AluRes = input2 >> input1; //srl
            4'b0111: //slt
            begin
                if (input1 < input2)
                    AluRes = 1;
                else
                    AluRes = 0;
            end
            4'b1100: begin
                AluRes = ~(input1 | input2); //nor
            end
            4'b1101: begin
                AluRes = input1 ^ input2; //xor
            end
        endcase
        if (AluRes == 0)
            Zero = 1;
        else 
            Zero = 0;
    end
    assign zero = Zero;
    assign aluRes = AluRes;
endmodule
