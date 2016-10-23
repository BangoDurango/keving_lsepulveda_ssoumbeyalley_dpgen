`timescale 1ns / 1ps
module Circuit1(xwire, g, f, e, d, x, z, c, b, a,Clk, Rst);
input [7:0] c;
input [7:0] b;
input [7:0] a;
output [15:0] x;
output [7:0] z;
input Clk, Rst;

wire [15:0] xwire;
wire [15:0] g;
wire [15:0] f;
wire [7:0] e;
wire [7:0] d;



ADD #(8) ADD_1(a,b,d);
ADD #(8) ADD_2(a,c,e);
COMP #(16) COMP_3({8'b00000000,d},{8'b00000000,e},g,,);
MUX #(8) MUX_4(d,e,g,z);
MUL #(16) MUL_5({8'b00000000,a},{8'b00000000,c},f);
SUB #(16) SUB_6(f,{8'b00000000,d},xwire);
REG #(16) REG_7(xwire,x,Clk,Rst);

endmodule
