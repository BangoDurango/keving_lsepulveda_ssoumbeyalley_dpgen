`timescale 1ns / 1ps
module mixedcircuit1(a, b, c, clk, rst);

input signed [7:0] a;
input [7:0] b;
output signed [7:0] c;
wire signed [7:0] cwire;
input clk, rst;

SADD #(8) SADD_1(a,b,cwire);
SREG #(8) REG_2(cwire,clk, rst, c);

endmodule
