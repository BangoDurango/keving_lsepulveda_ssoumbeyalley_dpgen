`timescale 1ns / 1ps
module circuit1(a, b, c, z, x, clk, rst);

input signed [7:0] a;
input signed [7:0] b;
input signed [7:0] c;
output signed [7:0] z;
output signed [15:0] x;
wire signed [7:0] d;
wire signed [7:0] e;
wire signed [15:0] f;
wire signed [15:0] g;
wire signed [15:0] xwire;
input clk, rst;

SADD #(8) SADD_1(a,b,d);
SADD #(8) SADD_2(a,c,e);
SCOMP #(16) SCOMP_3({{8{d[7]}},d},{{8{e[7]}},e},g,,);
MUX2x1 #(16) MUX2x1_4({8'b0,d},{8'b0,e},g[0],z);
SMUL #(16) SMUL_5({{8{a[7]}},a},{{8{c[7]}},c},f);
SSUB #(16) SSUB_6(f,{{8{d[7]}},d},xwire);
SREG #(16) REG_7(xwire,clk, rst, x);

endmodule
