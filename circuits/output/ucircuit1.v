`timescale 1ns / 1ps
module ucircuit1(a, b, c, clk, rst);

input [7:0] a;
input [7:0] b;
output [7:0] c;
wire [7:0] cwire;
input clk, rst;

ADD #(8) ADD_1(a,b,cwire);
REG #(8) REG_2(cwire,clk, rst, c);

endmodule
