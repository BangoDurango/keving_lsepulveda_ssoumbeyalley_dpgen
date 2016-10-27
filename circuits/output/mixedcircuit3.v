`timescale 1ns / 1ps
module mixedcircuit3(a, b, c, clk, rst);

input signed [31:0] a;
input [15:0] b;
output signed [7:0] c;
wire signed [7:0] cwire;
input clk, rst;

SADD #(32) SADD_1(a,{{16{b[15]}},b},cwire);
SREG #(8) REG_2(cwire,clk, rst, c);

endmodule
