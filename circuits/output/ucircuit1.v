`timescale 1ns / 1ps
module ucircuit1(a, b, c, Clk, Rst);

input [7:0] a;
input [7:0] b;
output [7:0] c;
wire [7:0] cwire;
input Clk, Rst;

ADD #(8) ADD_1(a,b,cwire);
REG #(8) REG_2(cwire,Clk, Rst, c);

endmodule
