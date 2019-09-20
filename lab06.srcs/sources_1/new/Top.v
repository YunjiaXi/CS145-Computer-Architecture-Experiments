`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 12:58:15
// Design Name: 
// Module Name: Top
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


module Top(clk, reset);
    input clk;
    input reset;
    wire [31:0] PCin;
	 wire [31:0] PCout;
	 wire [31:0] AddRes1;  //pc+4 in IF stage
	 wire [31:0] Inst;     //instruction in IF stage
	 wire [31:0] AddRes1_2;//pc+4 in ID stage
	 wire [31:0] Inst_2;   //instruction in ID stage
	 wire RegDst, Branch, MemRead, MemToReg, MemWrite, ALUsrc, RegWrite;
	 wire [2:0] ALUop;
	 wire [31:0] ReadData1;
	 wire [31:0] ReadData2;
	 wire [31:0] SignExtended;
	 wire RegDst_2, Branch_2, MemRead_2, MemToReg_2, MemWrite_2, ALUsrc_2, RegWrite_2; //control signal in EX
	 wire [2:0] ALUop_2;        //ALUop in EX
	 wire [31:0] AddRes1_3; 	//pc+4 in EX	
	 wire [31:0] SignExtended_2;//signExtend in EX
	 wire [31:0] ReadData1_2;   //reg readDate1 in EX
	 wire [31:0] ReadData2_2;   //reg readDate2 in EX
	 wire [1:0]ALUsrc1Fwd; //forwarding MUX
	 wire [1:0]ALUsrc2Fwd; //forwarding MUX
	 wire [31:0] ALUmuxRes1;   
	 wire [31:0] ALUmuxRes2;  
	 wire [4:0] Rs;  //add Rs for forwarding
	 wire [4:0] Rt;
     wire [4:0] Rd;
	 wire [4:0] RegDstMuxRes;
	 wire [3:0] ALUCTR;
	 wire [31:0] SHIFTLEFT2;
	 wire [31:0] AddRes2;
	 wire Zero;
	 wire [31:0] ALURes;
	 wire [4:0] RegDstMuxRes_2; //reg dest in MEM
	 wire [31:0] ReadData2_3;   //reg readData2 in MEM
	 wire [31:0] ALURes_2;      //ALU res in MEM
	 wire Zero_2;               //Zero signal in MEM
	 wire Branch_3, MemRead_3, MemToReg_3, MemWrite_3, RegWrite_3; //control signal in MEM
	 wire BranchRes;
	 wire [31:0] AddRes2_2;     //new PC in MEM
	 wire [31:0] ReadData;
	 wire [31:0] ReadData_2;
	 wire [31:0] ALURes_3;
	 wire [4:0] RegDstMuxRes_3;
	 wire [31:0] WriteRegMuxRes;
	 wire MemToReg_4, RegWrite_4;
	 wire stall;
	PC Counter(.clock(clk), .stall(stall), .reset(reset), .Input(PCin), .Output(PCout));
    inst_memory instMem( .readAddr(PCout), .inst(Inst));
    Adder Adder1(.INPUT1(PCout), .INPUT2(32'h00000004), .OUTPUT(AddRes1));
   cache_IF_ID IF_ID(
        .clock(clk),
        .reset(reset), 
        .pcIn(AddRes1),
        .instIn(Inst),
        .stall(stall), //for stall
        .pcOut(AddRes1_2),
        .instOut(Inst_2));
   
    Ctrl mainCtr(
	     .reset(reset),
	     .opCode(Inst_2[31:26]),
	     .stall(stall),
		  .regDst(RegDst),
		  .branch(Branch),
		  .memRead(MemRead),
		  .memToReg(MemToReg),
		  .aluOp(ALUop),
		  .memWrite(MemWrite),
		  .aluSrc(ALUsrc),
		  .regWrite(RegWrite));
    register REG(
	     .clock_in(clk),
		  .reset(reset), 
		  .readReg1(Inst_2[25:21]), 
		  .readReg2(Inst_2[20:16]), 
		  .writeReg(RegDstMuxRes_3), 
		  .writeData(WriteRegMuxRes), 
		  .regWrite(RegWrite_4), 
		  .readData1(ReadData1), 
		  .readData2(ReadData2));
	signext signExtend(.inst(Inst_2[15:0]), .data(SignExtended));
	
    Hazard_detection detect(
        .clock(clk),
        .stall(stall),
        .ID_Rs(Inst_2[25:21]),
        .ID_Rt(Inst_2[20:16]),
        .EX_MemRead(MemRead_2),
        .EX_Rt(Rt));   
        
    cache_Ctr_WB cache_ID_EX_WB(
	     .clock(clk),
		  .reset(reset),
		  .regWriteIn(RegWrite),
		  .memToRegIn(MemToReg),
		  .regWriteOut(RegWrite_2),
		  .memToRegOut(MemToReg_2));
    cache_Ctr_MEM cache_ID_EX_MEM(
	     .clock(clk),
		  .reset(reset),
		  .branchIn(Branch),
		  .memReadIn(MemRead),
		  .memWriteIn(MemWrite),
		  .branchOut(Branch_2),
		  .memReadOut(MemRead_2),
		  .memWriteOut(MemWrite_2));	
    cache_Ctr_EX cache_ID_EX_EX(
	     .clock(clk),
		  .reset(reset),
		  .regDstIn(RegDst),
		  .AluOpIn(ALUop),
		  .AluSrcIn(ALUsrc),
		  .regDstOut(RegDst_2),
		  .AluOpOut(ALUop_2),
		  .AluSrcOut(ALUsrc_2));

	
    cache_ID_EX ID_EX(
        .clock(clk), 
        .reset(reset), 
        .pcIn(AddRes1_2),
        .dataIn1(ReadData1),
        .dataIn2(ReadData2),
        .extendIn(SignExtended),
        .inst11_15In(Inst_2[15:11]),
        .inst16_20In(Inst_2[20:16]),
        .inst21_25In(Inst_2[25:21]),
        .pcOut(AddRes1_3),
        .dataOut1(ReadData1_2),
        .dataOut2(ReadData2_2),
        .extendOut(SignExtended_2),
        .inst11_15Out(Rd),
        .inst16_20Out(Rt),
        .inst21_25Out(Rs));
 

    Mux_5 RegDst_Mux(.SEL(RegDst_2), .INPUT1(Rt), .INPUT2(Rd), .OUTPUT(RegDstMuxRes));
	Left_shift_2 shifter(.INPUT(SignExtended_2), .OUTPUT(SHIFTLEFT2));
    Adder Adder2(.INPUT1(AddRes1_3), .INPUT2(SHIFTLEFT2), .OUTPUT(AddRes2));
    ALUCtr aluCtr(.ALUOp(ALUop_2), .Funct(SignExtended_2[5:0]), .aluCtrOut(ALUCTR));
    Mux_32_3way ALU_Mux1(   //forwarding MUX
        .select(ALUsrc1Fwd),
        .IN1(ReadData1_2),
        .IN2(WriteRegMuxRes),
        .IN3(ALURes_2),
        .OUT(ALUmuxRes1));
    Mux_32_4way ALU_Mux2(  //forwarding MUX
        .select(ALUsrc2Fwd),
        .ALUsrc(ALUsrc_2),
        .IN1(ReadData2_2),
        .IN2(WriteRegMuxRes),
        .IN3(ALURes_2),
        .IN4(SignExtended_2),
        .OUT(ALUmuxRes2));
		
    ALU alu(
	     .input1(ALUmuxRes1),
		  .input2(ALUmuxRes2),
		  .aluCtr(ALUCTR),
		  .zero(Zero),
		  .aluRes(ALURes));
     Forwarding Fwding(
        .clock(clk),
        .EX_Rs(Rs),
        .EX_Rt(Rt),
        .MEM_RegWrite(RegWrite_3),
        .MEM_Rd(RegDstMuxRes_2),
        .WB_RegWrite(RegWrite_4),
        .WB_Rd(RegDstMuxRes_3),
        .aluSrc1(ALUsrc1Fwd),
        .aluSrc2(ALUsrc2Fwd));	
        
        
    cache_Ctr_WB cache_EX_MEM_WB(
	     .clock(clk),
		  .reset(reset),
		  .regWriteIn(RegWrite_2),
		  .memToRegIn(MemToReg_2),
		  .regWriteOut(RegWrite_3),
		  .memToRegOut(MemToReg_3));
    cache_Ctr_MEM cache_EX_MEM_MEM(
	     .clock(clk),
		  .reset(reset),
		  .branchIn(Branch_2),
		  .memReadIn(MemRead_2),
		  .memWriteIn(MemWrite_2),
		  .branchOut(Branch_3),
		  .memReadOut(MemRead_3),
		  .memWriteOut(MemWrite_3));
		  //omit Crt_WB cache
     cache_EX_MEM EX_MEM(
          .clock(clk), 
          .reset(reset), 
          .addResIn(AddRes2), 
          .ALUresIn(ALURes), 
          .zeroIn(Zero), 
          .readData2In(ReadData2_2), 
          .regAddrIn(RegDstMuxRes), 
          .addResOut(AddRes2_2),
          .ALUresOut(ALURes_2),
          .zeroOut(Zero_2),
          .readData2Out(ReadData2_3),
          .regAddrOut(RegDstMuxRes_2));
	
     And_gate AND(.INPUT1(Branch_3), .INPUT2(Zero_2), .OUTPUT(BranchRes));
	 Mux_32 PC_Mux(.SEL(BranchRes),.INPUT1(AddRes1),.INPUT2(AddRes2_2),.OUTPUT(PCin));
    dataMemory dataMem(
	     .clock_in(clk),
		  .address(ALURes_2),
		  .writeData(ReadData2_3),
		  .memWrite(MemWrite_3), 
		  .memRead(MemRead_3),
		  .readData(ReadData));
    cache_Ctr_WB cache_MEM_WB_WB(
	     .clock(clk),
		  .reset(reset),
		  .regWriteIn(RegWrite_3),
		  .memToRegIn(MemToReg_3),
		  .regWriteOut(RegWrite_4),
		  .memToRegOut(MemToReg_4));
    Mux_32 WriteReg_Mux(
	     .SEL(MemToReg_4),
		  .INPUT1(ALURes_3),
		  .INPUT2(ReadData_2),
		  .OUTPUT(WriteRegMuxRes));
    cache_MEM_WB MEM_WB(
          .clock(clk), 
          .reset(reset), 
          .memDataIn(ReadData), 
          .ALUresIn(ALURes_2),
          .regAddrIn(RegDstMuxRes_2), 
          .memDataOut(ReadData_2), 
          .ALUresOut(ALURes_3),
          .regAddrOut(RegDstMuxRes_3));
   	                                                                                                                                                          
endmodule
