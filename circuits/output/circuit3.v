`timescale 1ns / 1ps
module circuit3(a, b, c, d, e, f, g, h, sa, avg, clk, rst);

input signed [15:0] a;
input signed [15:0] b;
input signed [15:0] c;
input signed [15:0] d;
input signed [15:0] e;
input signed [15:0] f;
input signed [15:0] g;
input signed [15:0] h;
input signed [7:0] sa;
output signed [15:0] avg;
wire signed [31:0] l00;
wire signed [31:0] l01;
wire signed [31:0] l02;
wire signed [31:0] l03;
wire signed [31:0] l10;
wire signed [31:0] l11;
wire signed [31:0] l2;
wire signed [31:0] l2div2;
wire signed [31:0] l2div4;
wire signed [31:0] l2div8;
input clk, rst;

SADD #(32) SADD_1({{16{a[15]}},a},{{16{b[15]}},b},l00);
SADD #(32) SADD_2({{16{c[15]}},c},{{16{d[15]}},d},l01);
SADD #(32) SADD_3({{16{e[15]}},e},{{16{f[15]}},f},l02);
SADD #(32) SADD_4({{16{g[15]}},g},{{16{h[15]}},h},l03);
SADD #(32) SADD_5(l00,l01,l10);
SADD #(32) SADD_6(l02,l03,l11);
SADD #(32) SADD_7(l10,l11,l2);
SSHR #(32) SSHR_8(l2,{{24{sa[7]}},sa},l2div2);
SSHR #(32) SSHR_9(l2div2,{{24{sa[7]}},sa},l2div4);
SSHR #(32) SSHR_10(l2div4,{{24{sa[7]}},sa},l2div8);
SREG #(16) REG_11(l2div8[15:0],clk, rst, avg);

endmodule
