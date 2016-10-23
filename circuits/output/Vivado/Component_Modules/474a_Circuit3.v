module Circuit3(a, b, c, d, e, f, g, h, sa, Clk, Rst, avg);
    input [15:0] a, b, c, d, e, f, g, h;
    input [7:0] sa;
    input Clk, Rst;

    output [15:0] avg;

    wire [31:0] l00, l01, l02, l03, l10, l11, l2, l2div2, l2div4, l2div8;
    
    ADD #(.DATAWIDTH(16))add_ab(a, b, l00);//l00 = a + b
    ADD #(.DATAWIDTH(16))add_cd(c, d, l01);//l01 = c + d
    ADD #(.DATAWIDTH(16))add_ef(e, f, l02);//l02 = e + f
    ADD #(.DATAWIDTH(16))add_gh(g, h, l03);//l03 = g + h
    ADD #(.DATAWIDTH(32))add_l00l01(l00, l01, l10);//l10 = l00 + l01
    ADD #(.DATAWIDTH(32))add_l02l03(l02, l03, l11);//l11 = l02 + l03
    ADD #(.DATAWIDTH(32))add_l10l11(l10, l11, l2);//l2 = l10 + l11
    SHR #(.DATAWIDTH(32))shr_l2(l2, sa, l2div2);//l2div2 = l2 >> sa
    SHR #(.DATAWIDTH(32))shr_l2div2(l2div2, sa, l2div4);//l2div4 = l2div2 >> sa 
    SHR #(.DATAWIDTH(32))shr_l2div4(l2div4, sa, l2div8);//l2div8 = l2div4 >> sa
    REG #(.DATAWIDTH(32))reg_avg(l2div8, Clk, Rst, avg);//avg = l2div8
    
endmodule