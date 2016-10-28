`timescale 1ns / 1ps
module ucircuit3(a, b, c, clk, rst);

input [31:0] a;
input [15:0] b;
output [7:0] c;
wire [7:0] cwire;
input clk, rst;

ADD #(32) ADD_1(a,{16'b0,b},cwire);
REG #(8) REG_2(cwire,clk, rst, c);

endmodule
