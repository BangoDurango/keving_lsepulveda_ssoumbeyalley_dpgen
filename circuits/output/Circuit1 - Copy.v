`timescale 1ns / 1ps
module Circuit1(a, b, c, z, x, Clk, Rst);

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
input Clk, Rst;

SADD #(8) SADD_1(a,b,d);
SADD #(8) SADD_2(a,c,e);
SCOMP #(16) SCOMP_3({8'b0,d},{8'b0,e},g,,);
SMUX2x1 #(8) MUX2x1_4(d,e,g,z);
SMUL #(16) SMUL_5({8'b0,a},{8'b0,c},f);
SSUB #(16) SSUB_6(f,{8'b0,d},xwire);
SREG #(16) REG_7(xwire,Clk, Rst, x);

endmodule
