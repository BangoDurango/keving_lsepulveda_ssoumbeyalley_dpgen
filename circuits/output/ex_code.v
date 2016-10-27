`timescale 1ns / 1ps
module ex_code(a, b, c, d, e, f, g, h, num, avg, clk, rst);

input signed [15:0] a;
input signed [15:0] b;
input signed [15:0] c;
input signed [15:0] d;
input signed [15:0] e;
input signed [15:0] f;
input signed [15:0] g;
input signed [15:0] h;
input signed [15:0] num;
output signed [15:0] avg;
wire signed [15:0] r1;
wire signed [15:0] r2;
wire signed [15:0] r3;
wire signed [15:0] r4;
wire signed [15:0] r5;
wire signed [15:0] r6;
wire signed [15:0] r7;
wire signed [15:0] avgwire;
wire signed [31:0] t1;
wire signed [31:0] t2;
wire signed [31:0] t3;
wire signed [31:0] t4;
wire signed [31:0] t5;
wire signed [31:0] t6;
wire signed [31:0] t7;
input clk, rst;

SADD #(32) SADD_1({{16{a[15]}},a},{{16{b[15]}},b},t1);
SREG #(16) REG_2(t1[15:0],clk, rst, r1);
SADD #(32) SADD_3({{16{r1[15]}},r1},{{16{c[15]}},c},t2);
SREG #(16) REG_4(t2[15:0],clk, rst, r2);
SADD #(32) SADD_5({{16{r2[15]}},r2},{{16{d[15]}},d},t3);
SREG #(16) REG_6(t3[15:0],clk, rst, r3);
SADD #(32) SADD_7({{16{r3[15]}},r3},{{16{e[15]}},e},t4);
SREG #(16) REG_8(t4[15:0],clk, rst, r4);
SADD #(32) SADD_9({{16{r4[15]}},r4},{{16{f[15]}},f},t5);
SREG #(16) REG_10(t5[15:0],clk, rst, r5);
SADD #(32) SADD_11({{16{r5[15]}},r5},{{16{g[15]}},g},t6);
SREG #(16) REG_12(t6[15:0],clk, rst, r6);
SADD #(32) SADD_13({{16{r6[15]}},r6},{{16{h[15]}},h},t7);
SREG #(16) REG_14(t7[15:0],clk, rst, r7);
SDIV #(16) SDIV_15(r7,num,avgwire);
SREG #(16) REG_16(avgwire,clk, rst, avg);

endmodule
