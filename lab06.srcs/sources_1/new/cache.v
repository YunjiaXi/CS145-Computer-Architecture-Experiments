`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 15:18:55
// Design Name: 
// Module Name: cache
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
module cache_IF_ID(clock, reset, pcIn,instIn,stall,pcOut,instOut);
	input clock;
	input reset;
	input stall;
	input [31:0] pcIn;
	input [31:0] instIn;
	output reg [31:0] pcOut;
	output reg [31:0] instOut;
	
	initial begin
		pcOut <= 0;
		instOut <= 0;
	end
	always @ (posedge clock)
	begin
		if(!stall)
		begin
		  instOut=instIn;
	    end
		pcOut = pcIn;
	end
endmodule

module cache_ID_EX(clock, reset, pcIn,dataIn1,dataIn2,extendIn,inst11_15In,inst16_20In,inst21_25In,
                                pcOut,dataOut1,dataOut2,extendOut,inst11_15Out,inst16_20Out,inst21_25Out);
	input clock;
	input reset;
	input [31:0] pcIn;
	input [31:0] dataIn1;
	input [31:0] dataIn2;
	input [31:0] extendIn;
	inout [4:0] inst11_15In;
	inout [4:0] inst16_20In;
	inout [4:0] inst21_25In;
	output reg [31:0] pcOut;
	output reg [31:0] dataOut1;
	output reg [31:0] dataOut2;
	output reg [31:0] extendOut;
	output reg [4:0] inst11_15Out;
	output reg [4:0] inst16_20Out;
	output reg [4:0] inst21_25Out;
	
	initial begin
		pcOut <= 0;
		dataOut1 <= 0;
		dataOut2 <= 0;
		extendOut <= 0;
		inst11_15Out <=0;
		inst16_20Out <= 0;
		inst21_25Out <= 0;
	end
	always @ (posedge clock)
	begin
		pcOut = pcIn;
		dataOut1 <= dataIn1;
		dataOut2 <= dataIn2;
		extendOut <= extendIn;
		inst11_15Out <= inst11_15In;
		inst16_20Out <= inst16_20In;
		inst21_25Out <= inst21_25In;
	end
endmodule

module cache_EX_MEM(clock, reset, addResIn, ALUresIn, zeroIn, readData2In, regAddrIn, 
                                addResOut,ALUresOut,zeroOut,readData2Out,regAddrOut);
	input clock;
	input reset;
	input zeroIn;
	input [31:0] addResIn;
	input [31:0] ALUresIn;
	input [31:0] readData2In;
	input [31:0] regAddrIn;
	output reg zeroOut;
	output reg [31:0] addResOut;
	output reg [31:0] ALUresOut;
	output reg [31:0] readData2Out;
	output reg [31:0] regAddrOut;
	
	initial begin
		zeroOut <= 0;
		addResOut <= 0;
		ALUresOut <= 0;
		readData2Out<=0;
		regAddrOut <= 0;
	end
	always @ (posedge clock)
	begin
		zeroOut <= zeroIn;
		addResOut <= addResIn;
		ALUresOut <= ALUresIn;
		readData2Out<=readData2In;
		regAddrOut <= regAddrIn;
	end
endmodule

module cache_MEM_WB(clock, reset, memDataIn, ALUresIn,regAddrIn, memDataOut, ALUresOut,regAddrOut);
	input clock;
	input reset;
	input [31:0] memDataIn;
	input [31:0] ALUresIn;
	input [31:0] regAddrIn;
	output reg [31:0] memDataOut;
	output reg [31:0] ALUresOut;
	output reg [31:0] regAddrOut;
	
	initial begin
		memDataOut <= 0;
		ALUresOut <= 0;
		regAddrOut <= 0;
	end
	always @ (posedge clock)
	begin
		memDataOut <= memDataIn;
		ALUresOut <= ALUresIn;
		regAddrOut <= regAddrIn;
	end
endmodule

module cache_Ctr_EX(clock, reset, regDstIn, AluOpIn, AluSrcIn, regDstOut, AluOpOut, AluSrcOut);
	input clock;
	input reset;
	input regDstIn;
	input [2:0] AluOpIn;
	input AluSrcIn;
	output reg regDstOut;
	output reg [2:0] AluOpOut;
	output reg AluSrcOut;
	
	initial begin
		regDstOut = 0;
		AluOpOut = 0;
		AluSrcOut = 0;
	end
	
	always @ (posedge clock)
	begin
		regDstOut = regDstIn;
		AluOpOut = AluOpIn;
		AluSrcOut = AluSrcIn;
	end
endmodule

module cache_Ctr_MEM(clock, reset, branchIn, memReadIn, memWriteIn, branchOut, memReadOut, memWriteOut);
	input clock;
	input reset;
	input branchIn;
	input memReadIn;
	input memWriteIn;
	output reg branchOut;
	output reg memReadOut;
	output reg memWriteOut;
	
	initial begin
		branchOut = 0;
		memReadOut = 0;
		memWriteOut = 0;
	end	
	always @ (posedge clock)
	begin
		branchOut = branchIn;
		memReadOut = memReadIn;
		memWriteOut = memWriteIn;
	end
endmodule

module cache_Ctr_WB(clock, reset, regWriteIn, memToRegIn, regWriteOut, memToRegOut);
	input clock;
	input reset;
	input regWriteIn;
	input memToRegIn;
	output reg regWriteOut;
	output reg memToRegOut;
	
	initial begin
		regWriteOut = 0;
		memToRegOut = 0;
	end
	
	always @ (posedge clock)
	begin
		regWriteOut = regWriteIn;
		memToRegOut = memToRegIn;
	end
endmodule

