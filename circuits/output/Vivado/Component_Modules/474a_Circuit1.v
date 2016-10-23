`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/14/2016 06:24:41 AM
// Design Name: 
// Module Name: Circuits
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Circuit1(a, b, c, Clk, Rst, z, x);
    input [7:0] a, b, c;
    input Clk, Rst;
    output [7:0] z;
    output [15:0] x;
    
    
    wire [7:0] d, e;
    wire [15:0] f, g;
    wire [15:0] xwire;
    ADD #(.DATAWIDTH(8))add_ab(a, b, d);//d = a + b
    ADD #(.DATAWIDTH(8))add_ac(a, c, e);//e = a + c
    COMP #(.DATAWIDTH(16))comp_de({8'b0,d}, {8'b0,e}, g, , );//g = d > e
    MUX2x1 #(.DATAWIDTH(8))mux_de(d, e, g, z);//z = g ? d : e
    MUL #(.DATAWIDTH(16))mul_ac({8'b0,a}, {8'b0,c}, f);//f = a * c
    SUB #(.DATAWIDTH(16))sub_fd(f, {8'b0,d}, xwire);//xwire = f - d  
    REG #(.DATAWIDTH(16))reg_x(xwire, Clk, Rst, x);//x = xwire
endmodule
 


//module Circuit3(a, b, c, d, e, f, g, h, sa, Clk, Rst, avg);
//    input [15:0] a, b, c, d, e, f, g, h;
//    input [7:0] sa;

//    output [15:0] avg;

//    wire [31:0] l00, l01, l02, l03, l10, l11, l2, l2div2, l2div4, l2div8;
    
//    ADD #(.DATAWIDTH(16))add_ab(a, b, l00);//l00 = a + b
//    ADD #(.DATAWIDTH(16))add_cd(c, d, l01);//l01 = c + d
//    ADD #(.DATAWIDTH(16))add_ef(e, f, l02);//l02 = e + f
//    ADD #(.DATAWIDTH(16))add_gh(g, h, l03);//l03 = g + h
//    ADD #(.DATAWIDTH(32))add_l00l01(l00, l01, l10);//l10 = l00 + l01
//    ADD #(.DATAWIDTH(32))add_l02l03(l02, l03, l11);//l11 = l02 + l03
//    ADD #(.DATAWIDTH(32))add_l10l11(l10, l11, l2);//l2 = l10 + l11
//    SHR #(.DATAWIDTH(32))shr_l2(l2, sa, l2div2);//l2div2 = l2 >> sa
//    SHR #(.DATAWIDTH(32))shr_l2div2(l2div2, sa, l2div4);//l2div4 = l2div2 >> sa 
//    SHR #(.DATAWIDTH(32))shr_l2div4(l2div4, sa, l2div8);//l2div8 = l2div4 >> sa
//    REG #(.DATAWIDTH(32))reg_avg(l2div8, Clk, Rst, avg);//avg = l2div8
    
//endmodule

//module Circuit4(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, Clk, Rst, Final);
//    input [7:0] a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p;
//    input Clk, Rst;
//    output [31:0] Final;

//    wire [31:0] t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14;

//    ADD #(.DATAWIDTH(32))add_ab({24'b0,a}, {24'b0,b}, t1);//t1 = a + b
//    ADD #(.DATAWIDTH(32))add_t1c(t1, {24'b0,c}, t2);//t2 = t1 + c
//    ADD #(.DATAWIDTH(32))add_t2d(t2, {24'b0,d}, t3);//t3 = t2 + d
//    ADD #(.DATAWIDTH(32))add_t3e(t3, {24'b0,e}, t4);//t4 = t3 + e
//    ADD #(.DATAWIDTH(32))add_t4f(t4, {24'b0,f}, t5);//t5 = t4 + f
//    ADD #(.DATAWIDTH(32))add_t5g(t5, {24'b0,g}, t6);//t6 = t5 + g
//    ADD #(.DATAWIDTH(32))add_t6h(t6, {24'b0,h}, t7);//t7 = t6 + h
//    ADD #(.DATAWIDTH(32))add_t7i(t7, {24'b0,i}, t8);//t8 = t7 + i
//    ADD #(.DATAWIDTH(32))add_t8j(t8, {24'b0,j}, t9);//t9 = t8 + j
//    ADD #(.DATAWIDTH(32))add_t9l(t9, {24'b0,l}, t10);//t10 = t9 + l
//    ADD #(.DATAWIDTH(32))add_t10m(t10, {24'b0,m}, t11);//t11 = t10 + m
//    ADD #(.DATAWIDTH(32))add_t11n(t11, {24'b0,n}, t12);//t12 = t11 + n
//    ADD #(.DATAWIDTH(32))add_t12o(t12, {24'b0,o}, t13);//t13 = t12 + o
//    ADD #(.DATAWIDTH(32))add_t13p(t13, {24'b0,p}, t14);//t14 = t13 + p
//    REG #(.DATAWIDTH(32))reg_Final(t14, Clk, Rst, Final);//Final = t14
   
//endmodule

//module Circuit5(a, b, c, Clk, Rst, z, x);
//    input [63:0] a, b, c;
//    input Clk, Rst;
//    output [31:0] z, x;

//    wire [63:0] d, e, f, g, h; 
//    wire  dLTe, dEQe; 
//    wire [63:0] xrin, zrin;
//    reg  [63:0] greg, hreg;

//    ADD #(.DATAWIDTH(64))add_ab(a, b, d);//d = a + b
//    ADD #(.DATAWIDTH(64))add_ac(a, c, e);//e = a + c
//    SUB #(.DATAWIDTH(64))sub_ab(a, b, f);//f = a - b  
//    COMP #(.DATAWIDTH(64))comp_de0(d, e, , , dEQe);//dEQe = d == e
//    COMP #(.DATAWIDTH(64))comp_de1(d, e, , dLTe, );//dLTe = d < e
//    MUX2x1 #(.DATAWIDTH(64))mux_de(d, e, dLTe, g);//g = dLTe ? d : e 
//    MUX2x1 #(.DATAWIDTH(64))mux_gf(g, f, dEQe, h);//h = dEQe ? g : f 
//    REG #(.DATAWIDTH(64))reg_greg(g, Clk, Rst, greg);//greg = g
//    REG #(.DATAWIDTH(64))reg_hreg(h, Clk, Rst, hreg);//hreg = h
//    SHL #(.DATAWIDTH(64))shl_hreg(hreg, dLTe, xrin);//xrin = hreg << dLTe
//    SHR #(.DATAWIDTH(64))shr_greg(hreg, dEQe, zrin);//zrin = greg >> dEQe
//    REG #(.DATAWIDTH(32))reg_x(xrin, Clk, Rst, x);//x = xrin
//    REG #(.DATAWIDTH(32))reg_z(zrin, Clk, Rst, z);//z = zrin
   
//endmodule

