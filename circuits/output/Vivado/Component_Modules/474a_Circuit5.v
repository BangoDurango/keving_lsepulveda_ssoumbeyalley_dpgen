`timescale 1ns / 1ps

module Circuit5(a, b, c, Clk, Rst, z, x);
    input [63:0] a, b, c;
    input Clk, Rst;
    output [31:0] z, x;

    wire [63:0] d, e, f, g, h; 
    wire  dLTe, dEQe; 
    wire [63:0] xrin, zrin;
    wire  [63:0] greg, hreg;

    ADD #(.DATAWIDTH(64))add_ab(a, b, d);//d = a + b
    ADD #(.DATAWIDTH(64))add_ac(a, c, e);//e = a + c
    SUB #(.DATAWIDTH(64))sub_ab(a, b, f);//f = a - b  
    COMP #(.DATAWIDTH(64))comp_de0(d, e, , , dEQe);//dEQe = d == e
    COMP #(.DATAWIDTH(64))comp_de1(d, e, , dLTe, );//dLTe = d < e
    MUX2x1 #(.DATAWIDTH(64))mux_de(d, e, dLTe, g);//g = dLTe ? d : e 
    MUX2x1 #(.DATAWIDTH(64))mux_gf(g, f, dEQe, h);//h = dEQe ? g : f 
    REG #(.DATAWIDTH(64))reg_greg(g, Clk, Rst, greg);//greg = g
    REG #(.DATAWIDTH(64))reg_hreg(h, Clk, Rst, hreg);//hreg = h
    SHL #(.DATAWIDTH(64))shl_hreg(hreg, dLTe, xrin);//xrin = hreg << dLTe
    SHR #(.DATAWIDTH(64))shr_greg(hreg, dEQe, zrin);//zrin = greg >> dEQe
    REG #(.DATAWIDTH(32))reg_x(xrin, Clk, Rst, x);//x = xrin
    REG #(.DATAWIDTH(32))reg_z(zrin, Clk, Rst, z);//z = zrin
   
endmodule