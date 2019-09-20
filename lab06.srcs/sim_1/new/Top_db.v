`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/06 19:42:03
// Design Name: 
// Module Name: Top_db
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


module Top_db();
	reg clock;
	reg reset;
	Top pipeline (.clk(clock), .reset(reset));
   	always #50 clock <= ~ clock;
	initial begin
      reset <= 1;
	  clock <= 0;
      #220 reset <= 0;
	end
endmodule
