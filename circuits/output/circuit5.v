`timescale 1ns / 1ps
module circuit5(a, b, c, z, x, Clk, Rst);

input signed [63:0] a;
input signed [63:0] b;
input signed [63:0] c;
output signed [31:0] z;
output signed [31:0] x;
wire signed [63:0] d;
wire signed [63:0] e;
wire signed [63:0] f;
wire signed [63:0] g;
wire signed [63:0] h;
wire dLTe;
wire dEQe;
wire signed [63:0] xrin;
wire signed [63:0] zrin;
reg signed [63:0] greg;
reg signed [63:0] hreg;
input Clk, Rst;


SADD #(64) SADD_1(a,b,d);
SADD #(64) SADD_2(a,c,e);
SSUB #(64) SSUB_3(a,b,f);
SCOMP #(64) SCOMP_4(d,e,,,dEQe);
SCOMP #(64) SCOMP_5(d,e,,dLTe,);
MUX2x1 #(64) MUX2x1_6(d,e,dLTe,g);
MUX2x1 #(64) MUX2x1_7(g,f,dEQe,h);
SREG #(64) REG_8(g,Clk, Rst, greg);
SREG #(64) REG_9(h,Clk, Rst, hreg);
SSHL #(64) SSHL_10(hreg,dLTe,xrin);
SSHR #(64) SSHR_11(greg,dEQe,zrin);
SREG #(32) REG_12(xrin[31:0],Clk, Rst, x);
SREG #(32) REG_13(zrin[31:0],Clk, Rst, z);


endmodule
