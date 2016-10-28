`timescale 1ns / 1ps
module ucircuit2(a, b, c, clk, rst);

input [7:0] a;
input [15:0] b;
output [31:0] c;
wire [31:0] cwire;
input clk, rst;

ADD #(32) ADD_1({24'b0,a},{16'b0,b},cwire);
REG #(32) REG_2(cwire,clk, rst, c);

endmodule
