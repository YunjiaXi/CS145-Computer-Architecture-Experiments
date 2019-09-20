`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 08:18:37
// Design Name: 
// Module Name: Ctrl
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


module Ctrl(
    input reset,
    input [5:0] opCode,
    input stall, //add stall
    output regDst,
    output aluSrc,
    output memToReg,
    output regWrite,
    output memRead,
    output memWrite,
    output branch,
    output [2:0] aluOp,
    output jump
    );
    reg RegDst;
    reg ALUSrc;
    reg MemToReg;
    reg RegWrite;
    reg MemRead;
    reg MemWrite;
    reg Branch;
    reg [2:0] ALUOp;
    reg Jump;
    
    always @(opCode or stall or reset)
    begin
        case(opCode)
            6'b000000: //R Type
            begin
                RegDst = 1;
                ALUSrc = 0;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 3'b100;
                Jump = 0;
            end
            6'b100011: //lw
            begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 1;
                RegWrite = 1;
                MemRead = 1;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 3'b000;
                Jump = 0;
            end
            6'b101011: //sw
            begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 1;
                Branch = 0;
                ALUOp = 3'b000;
                Jump = 0;
            end
            6'b000100: //beq
            begin
                RegDst = 0;
                ALUSrc = 0;
                MemToReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 1;
                ALUOp = 3'b001;
                Jump = 0;
            end
            6'b000010: //Jump
            begin
                RegDst = 0;
                ALUSrc = 0;
                MemToReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 3'b000;
                Jump = 1;
            end
            6'b001000: //addi
            begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 3'b010;
                Jump = 0;
            end
            6'b001100: //andi
            begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 3'b011;
                Jump = 0;
            end
            6'b001101: //ori
            begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 3'b101;
                Jump = 0;
            end
            6'b001110: //xori
            begin
                RegDst = 0;
                ALUSrc = 1;
                MemToReg = 0;
                RegWrite = 1;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 3'b110;
                Jump = 0;
            end
            default:
            begin
                RegDst = 0;
                ALUSrc = 0;
                MemToReg = 0;
                RegWrite = 0;
                MemRead = 0;
                MemWrite = 0;
                Branch = 0;
                ALUOp = 3'b000;
                Jump = 0;
            end
        endcase   
        if(reset) Branch=0;
        if(stall) begin
            RegDst = 0;
            ALUSrc = 0;
            MemToReg = 0;
            RegWrite = 0;
            MemRead = 0;
            MemWrite = 0;
            Branch = 0;
            ALUOp = 3'b000;
            Jump = 0;
        end
     end
     assign regDst = RegDst;
     assign aluSrc = ALUSrc;
     assign memToReg = MemToReg;
     assign regWrite = RegWrite;
     assign memRead = MemRead;
     assign memWrite = MemWrite;
     assign branch = Branch;
     assign aluOp = ALUOp;
     assign jump = Jump;
endmodule
