`timescale 1ns / 1ps
module Circuit1(a, b, c, z, x, Clk, Rst);

input [7:0] a;
input [7:0] b;
input [7:0] c;
output [7:0] z;
output [15:0] x;
wire [7:0] d;
wire [7:0] e;
wire [15:0] f;
wire [15:0] g;
wire [15:0] xwire;
input Clk, Rst;

ADD #(8) ADD_1(a,b,d);
ADD #(8) ADD_2(a,c,e);
COMP #(16) COMP_3({8'b0,d},{8'b0,e},g,,);
MUX2x1 #(8) MUX2x1_4(d,e,g,z);
MUL #(16) MUL_5({8'b0,a},{8'b0,c},f);
SUB #(16) SUB_6(f,{8'b0,d},xwire);
REG #(16) REG_7(xwire,Clk, Rst, x);

endmodule
