`timescale 1ns / 1ps
module mixedcircuit2(a, b, c, clk, rst);

input signed [7:0] a;
input [15:0] b;
output signed [31:0] c;
wire signed [31:0] cwire;
input clk, rst;

SADD #(32) SADD_1({{24{a[7]}},a},{{16{b[15]}},b},cwire);
SREG #(32) REG_2(cwire,clk, rst, c);

endmodule
