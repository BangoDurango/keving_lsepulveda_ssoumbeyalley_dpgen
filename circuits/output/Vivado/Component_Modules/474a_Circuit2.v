`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2016 01:49:33 PM
// Design Name: 
// Module Name: Circuit2
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


module Circuit2(a, b, c, Clk, Rst, z, x);
    input [31:0] a, b, c; 
    input Clk, Rst;
    output [31:0] z, x;

    wire [31:0] d, e, f, g, h;
    wire  dLTe, dEQe;  
    wire [31:0] zwire, xwire;
    
    ADD #(.DATAWIDTH(32))add_ab(a, b, d);//d = a + b
    ADD #(.DATAWIDTH(32))add_ac(a, c, e);//e = a + c
    SUB #(.DATAWIDTH(32))sub_ab( a, b, f);//f = a - b
    COMP #(.DATAWIDTH(32))comp_de0(d, e, , , dEQe);//dEQe = d == e
    COMP #(.DATAWIDTH(32))comp_de1(d, e, , dLTe, );//dLTe = d < e
    MUX2x1 #(.DATAWIDTH(32))mux_de(d, e, dLTe, g);//g = dLTe ? d : e
    MUX2x1 #(.DATAWIDTH(32))mux_gf(g, f, dEQe, h);//h = dEQe ? g : f 
    SHL #(.DATAWIDTH(32))shl_g(g, dLTe, xwire);//xwire = g << dLTe
    SHR #(.DATAWIDTH(32))shr_h(h, dEQe, zwire);//zwire = h >> dEQe       
    REG #(.DATAWIDTH(32))reg_x(xwire, Clk, Rst, x);//x = xwire
    REG #(.DATAWIDTH(32))reg_z(zwire, Clk, Rst, z);//z = zwire
    
endmodule
