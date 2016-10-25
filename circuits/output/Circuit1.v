`timescale 1ns / 1ps
module Circuit1(a, b, c, z, x, Clk, Rst);

input signed [7:0] a;
input signed [7:0] b;
input signed [7:0] c;
output signed [7:0] z;
output signed [15:0] x;
wire signed [7:0] d;
wire [7:0] e;
wire signed [15:0] f;
wire signed [15:0] g;
wire signed [15:0] xwire;
input Clk, Rst;

SADD #(8) SADD_1(a,b,d);
ADD #(8) ADD_2(a,c,e);
COMP #(16) COMP_3({8'b0,d},{8'b0,e},g,,);
COMP #(16) COMP_4({8'b0,d},{8'b0,e},,g,);
COMP #(16) COMP_5({8'b0,d},{8'b0,e},,,g);
MUX2x1 #(8) MUX2x1_6(d,e,g,z);
SMUL #(16) SMUL_7({{8{a[7]}},a},{{8{c[7]}},c},f);
SSUB #(16) SSUB_8(f,{{8{d[7]}},d},xwire);
SREG #(16) REG_9(xwire,Clk, Rst, x);

endmodule
