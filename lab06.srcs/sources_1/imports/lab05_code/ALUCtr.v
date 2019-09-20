`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/10 09:38:08
// Design Name: 
// Module Name: ALU_Ctrl
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


module ALUCtr(
        input [5:0] Funct,
        input [2:0] ALUOp,
        output [3:0] aluCtrOut
    );
    reg [3:0] ALUCtrOut;
    always @(ALUOp or Funct)
    begin
        casex ({ALUOp, Funct})
            9'b000xxxxxx : ALUCtrOut = 4'b0010;  //lw sw   
            9'b001xxxxxx : ALUCtrOut = 4'b0110;  //beq    
            9'b100xx0000, 9'b010xxxxxx : ALUCtrOut = 4'b0010; //add, addi
            9'b100xx0010 : ALUCtrOut = 4'b0110; //subtract
            //9'b100000000 : ALUCtrOut = 4'b0011; //sll
            //9'b100000010 : ALUCtrOut = 4'b0100; //srl
            9'b100xx0100, 9'b011xxxxxx : ALUCtrOut = 4'b0000; //and, andi
            9'b100xx0101, 9'b101xxxxxx : ALUCtrOut = 4'b0001; //or, ori
            9'b100xx0111: ALUCtrOut = 4'b1100; //nor
            9'b100xx1010 : ALUCtrOut = 4'b0111; //slt
            9'b100xx0110, 9'b110xxxxxx: ALUCtrOut = 4'b1101; //xor, xori
            default: ALUCtrOut = 4'b0010;
//        8'b00xxxxxx: ALUCtrOut = 4'b0010;
//		  8'bx1xxxxxx: ALUCtrOut = 4'b0110;
//		  8'b1xxx0000: ALUCtrOut = 4'b0010;
//		  8'b1xxx0010: ALUCtrOut = 4'b0110;
//		  8'b1xxx0100: ALUCtrOut = 4'b0000;
//		  8'b1xxx0101: ALUCtrOut = 4'b0001;
//		  8'b1xxx1010: ALUCtrOut = 4'b0111;
//		  8'b1xxx0111: ALUCtrOut = 4'b1100;
        endcase
    end
    assign aluCtrOut = ALUCtrOut;
endmodule
