`timescale 1ns / 1ps
module Circuit1(a, b, c, z, x, Clk, Rst);

input [31:0] a;
input [31:0] b;
input [31:0] c;
output [31:0] z;
output [31:0] x;
wire [31:0] d;
wire [31:0] e;
wire [31:0] f;
wire [31:0] g;
wire [31:0] h;
wire [0:0] dLTe;
wire [0:0] dEQe;
wire [31:0] zwire;
wire [31:0] xwire;
input Clk, Rst;

ADD #(32) ADD_1(a,b,d);
ADD #(32) ADD_2(a,c,e);
SUB #(32) SUB_3(a,b,f);
COMP #(32) COMP_4(d,e,,,dEQe);
COMP #(32) COMP_5(d,e,,dLTe,);
MUX2x1 #(32) MUX2x1_6(d,e,dLTe,g);
MUX2x1 #(32) MUX2x1_7(g,f,dEQe,h);
SHL #(32) SHL_8(g,{31'b0,dLTe},xwire);
SHR #(32) SHR_9(h,{31'b0,dEQe},zwire);
REG #(32) REG_10(xwire,x,Clk,Rst);
REG #(32) REG_11(zwire,z,Clk,Rst);

endmodule
