`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/04/03 08:31:04
// Design Name: 
// Module Name: flowing_light
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
module flowing_light(
input clock_p,
input clock_n,
input reset,
output [7:0] led,
output LED_CLK, //为实现主板16位led流水而新增
output LED_DO, //新增
output LED_CLR //新增
);
reg [23:0] cnt_reg;
reg [7:0] light_reg;
reg [15:0] light_reg2;//新增
IBUFGDS IBUFGDS_inst (
.O(CLK_i),
.I(clock_p),
.IB(clock_n));
always @ (posedge CLK_i)
begin
if (!reset) //板上复位按钮按下是底电平
cnt_reg <= 0;
else
cnt_reg <= cnt_reg + 1;
end
always @ (posedge CLK_i )
begin
if (!reset)
begin//新增
light_reg <= 8'h01;
light_reg2<=16'b01;//新增
end //新增
else if (cnt_reg == 24'hffffff)
begin
light_reg2<={light_reg2[14:0],light_reg2[15]};//新增
if (light_reg == 8'h80)
light_reg <= 8'h01;
else
light_reg <= light_reg << 1;
end
end
assign led = light_reg;

wire led_clr;
assign LED_CLR=~led_clr;
reg [23:0] clkcnt;
always@(posedge CLK_i)
    clkcnt<=clkcnt+1;
parallel2serial #(
    .P_CLK_FREQ(200),
    .S_CLK_FREQ(20),
    .DATA_BITS(16),
    .CODE_ENDIAN(1))
P2S_LED(
    .clk(CLK_i),
    .rst(~reset),
    .data(light_reg2),
    .start((clkcnt==24'b0)?1'b1:1'b0),
    .busy(),
    .finish(),
    .s_clk(LED_CLK),
    .s_clr(led_clr),
    .s_dat(LED_DO));
endmodule
