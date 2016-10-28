`timescale 1ns / 1ps
module circuit4(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, final, clk, rst);

input signed [7:0] a;
input signed [7:0] b;
input signed [7:0] c;
input signed [7:0] d;
input signed [7:0] e;
input signed [7:0] f;
input signed [7:0] g;
input signed [7:0] h;
input signed [7:0] i;
input signed [7:0] j;
input signed [7:0] k;
input signed [7:0] l;
input signed [7:0] m;
input signed [7:0] n;
input signed [7:0] o;
input signed [7:0] p;
output signed [31:0] final;
wire signed [31:0] t1;
wire signed [31:0] t2;
wire signed [31:0] t3;
wire signed [31:0] t4;
wire signed [31:0] t5;
wire signed [31:0] t6;
wire signed [31:0] t7;
wire signed [31:0] t8;
wire signed [31:0] t9;
wire signed [31:0] t10;
wire signed [31:0] t11;
wire signed [31:0] t12;
wire signed [31:0] t13;
wire signed [31:0] t14;
input clk, rst;

SADD #(32) SADD_1({{24{a[7]}},a},{{24{b[7]}},b},t1);
SADD #(32) SADD_2(t1,{{24{c[7]}},c},t2);
SADD #(32) SADD_3(t2,{{24{d[7]}},d},t3);
SADD #(32) SADD_4(t3,{{24{e[7]}},e},t4);
SADD #(32) SADD_5(t4,{{24{f[7]}},f},t5);
SADD #(32) SADD_6(t5,{{24{g[7]}},g},t6);
SADD #(32) SADD_7(t6,{{24{h[7]}},h},t7);
SADD #(32) SADD_8(t7,{{24{i[7]}},i},t8);
SADD #(32) SADD_9(t8,{{24{j[7]}},j},t9);
SADD #(32) SADD_10(t9,{{24{l[7]}},l},t10);
SADD #(32) SADD_11(t10,{{24{m[7]}},m},t11);
SADD #(32) SADD_12(t11,{{24{n[7]}},n},t12);
SADD #(32) SADD_13(t12,{{24{o[7]}},o},t13);
SADD #(32) SADD_14(t13,{{24{p[7]}},p},t14);
SREG #(32) REG_15(t14,clk, rst, final);

endmodule
