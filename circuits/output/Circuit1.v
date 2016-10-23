module Circuit1(xwire, g, f, e, d, x, z, c, b, a);

wire [15:0] xwire;
wire [15:0] g;
wire [15:0] f;
wire [7:0] e;
wire [7:0] d;
output [15:0] x;
output [7:0] z;
input [7:0] c;
input [7:0] b;
input [7:0] a;

ADD #(8) ADD_1(a,b,d)
ADD #(8) ADD_2(a,c,e)
{8'b{8'bCOMP #(16) COMP_3({8'b00000000,d},{8'b{8'b00000000,e},g,,)
MUX #(8) MUX_4(d,e,g,z)
{8'b{8'bMUL #(16) MUL_5({8'b00000000,a},{8'b{8'b00000000,c},f)
{8'bSUB #(16) SUB_6(f,{8'b00000000,d},xwire)
REG #(16) REG_7(xwire,x,Clk,Rst)

endmodule
