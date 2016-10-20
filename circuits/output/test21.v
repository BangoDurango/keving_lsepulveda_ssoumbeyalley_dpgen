module test21(xwire, zwire, dEQe, dLTe, h, g, f, e, d, x, z, c, b, a);

wire [31:0] xwire;
wire [31:0] zwire;
wire [0:0] dEQe;
wire [0:0] dLTe;
wire [31:0] h;
wire [31:0] g;
wire [31:0] f;
wire [31:0] e;
wire [31:0] d;
output [31:0] x;
output [31:0] z;
input [31:0] c;
input [31:0] b;
input [31:0] a;

ADD #(32) ADD_1(a,b,d)
ADD #(32) ADD_2(a,c,e)
SUB #(32) SUB_3(a,b,f)
COMP'b) COMP_4(d,e,,,dEQe)
COMP #(32) COMP_5(d,e,,dLTe,)
MUX #(32) MUX_6(d,e,dLTe,g)
MUX #(32) MUX_7(g,f,dEQe,h)
{31'bSHL #(32) SHL_8(g,{31'b0000000000000000000000000000000,dLTe},xwire)
{31'bSHR #(32) SHR_9(h,{31'b0000000000000000000000000000000,dEQe},zwire)
REG #(32) REG_10(xwire,x,Clk,Rst)
REG #(32) REG_11(zwire,z,Clk,Rst)

endmodule
