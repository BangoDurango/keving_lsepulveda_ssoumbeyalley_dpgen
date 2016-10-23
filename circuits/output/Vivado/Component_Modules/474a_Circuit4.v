`timescale 1ns / 1ps

module Circuit4(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, Clk, Rst, Final);
    input [7:0] a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
    input Clk, Rst;
    output [31:0] Final;

    wire [31:0] t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14;

    ADD #(.DATAWIDTH(32))add_ab({24'b0,a}, {24'b0,b}, t1);//t1 = a + b
    ADD #(.DATAWIDTH(32))add_t1c(t1, {24'b0,c}, t2);//t2 = t1 + c
    ADD #(.DATAWIDTH(32))add_t2d(t2, {24'b0,d}, t3);//t3 = t2 + d
    ADD #(.DATAWIDTH(32))add_t3e(t3, {24'b0,e}, t4);//t4 = t3 + e
    ADD #(.DATAWIDTH(32))add_t4f(t4, {24'b0,f}, t5);//t5 = t4 + f
    ADD #(.DATAWIDTH(32))add_t5g(t5, {24'b0,g}, t6);//t6 = t5 + g
    ADD #(.DATAWIDTH(32))add_t6h(t6, {24'b0,h}, t7);//t7 = t6 + h
    ADD #(.DATAWIDTH(32))add_t7i(t7, {24'b0,i}, t8);//t8 = t7 + i
    ADD #(.DATAWIDTH(32))add_t8j(t8, {24'b0,j}, t9);//t9 = t8 + j
    ADD #(.DATAWIDTH(32))add_t9l(t9, {24'b0,l}, t10);//t10 = t9 + l
    ADD #(.DATAWIDTH(32))add_t10m(t10, {24'b0,m}, t11);//t11 = t10 + m
    ADD #(.DATAWIDTH(32))add_t11n(t11, {24'b0,n}, t12);//t12 = t11 + n
    ADD #(.DATAWIDTH(32))add_t12o(t12, {24'b0,o}, t13);//t13 = t12 + o
    ADD #(.DATAWIDTH(32))add_t13p(t13, {24'b0,p}, t14);//t14 = t13 + p
    REG #(.DATAWIDTH(32))reg_Final(t14, Clk, Rst, Final);//Final = t14
   
endmodule