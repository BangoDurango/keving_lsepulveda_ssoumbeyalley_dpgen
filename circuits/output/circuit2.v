`timescale 1ns / 1ps
module circuit2(a, b, c, z, x, Clk, Rst);

input signed [31:0] a;
input signed [31:0] b;
input signed [31:0] c;
output signed [31:0] z;
output signed [31:0] x;
wire signed [31:0] d;
wire signed [31:0] e;
wire signed [31:0] f;
wire signed [31:0] g;
wire signed [31:0] h;
wire dLTe;
wire dEQe;
wire signed [31:0] zwire;
wire signed [31:0] xwire;
input Clk, Rst;

SADD #(32) SADD_1(a,b,d);
SADD #(32) SADD_2(a,c,e);
SSUB #(32) SSUB_3(a,b,f);
SCOMP #(32) SCOMP_4(d,e,,,dEQe);
SCOMP #(32) SCOMP_5(d,e,,dLTe,);
MUX2x1 #(32) MUX2x1_6(d,e,dLTe,g);
MUX2x1 #(32) MUX2x1_7(g,f,dEQe,h);
SSHL #(32) SSHL_8(g,dLTe,xwire);
SSHR #(32) SSHR_9(h,dEQe,zwire);
SREG #(32) REG_10(xwire,Clk, Rst, x);
SREG #(32) REG_11(zwire,Clk, Rst, z);

endmodule
