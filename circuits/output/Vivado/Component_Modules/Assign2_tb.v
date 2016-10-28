`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2016 11:32:25 AM
// Design Name: 
// Module Name: Assign2_tb
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


module Assign2_tb();
	reg [7:0] a_1, b_1, c_1, sa_3, a_m1, b_m1, a_m2;
	reg [7:0] a_u1, b_u1, a_u2;
	reg [7:0] a_4, b_4, c_4, d_4, e_4, f_4, g_4, h_4, i_4, j_4, k_4, l_4, m_4, n_4, o_4, p_4;
	reg [15:0] a_3, b_3, c_3, d_3, e_3, f_3, g_3, h_3, b_m2, b_u2, b_u3;
	reg [31:0] a_2, b_2, c_2, a_u3;
	reg [63:0] a_5, b_5, c_5;
	
	reg Clk, Rst;
	
	wire [7:0] z_1, c_m1, c_u1;
	wire [15:0] x_1, avg_3;
	wire [31:0] z_2, x_2, final_4, z_5, x_5, c_m2, c_u2;
    
    
    //mixed3
    reg signed [31:0] a_m3;
    reg [16:0] b_m3;

    wire signed [7:0] c_m3, c_u3;

    //circuit 1
    circuit1 cir1(a_1, b_1, c_1, z_1, x_1, Clk, Rst);
    circuit2 cir2(a_2, b_2, c_2, z_2, x_2, Clk, Rst);
    circuit3 cir3(a_3, b_3, c_3, d_3, e_3, f_3, g_3, h_3, sa_3, avg_3, Clk, Rst);
    circuit4 cir4(a_4, b_4, c_4, d_4, e_4, f_4, g_4, h_4, i_4, j_4, k_4, l_4, m_4, n_4, o_4, p_4, final_4, Clk, Rst);
    circuit5 cir5(a_5, b_5, c_5, z_5, x_5, Clk, Rst);
    mixedcircuit1 mx1(a_m1, b_m1, c_m1, Clk, Rst);
    mixedcircuit2 mx2(a_m2, b_m2, c_m2, Clk, Rst);
    mixedcircuit3 mx3(a_m3, b_m3, c_m3, Clk, Rst);
    ucircuit1 u1(a_u1, b_u1, c_u1, Clk, Rst);
    ucircuit2 u2(a_u2, b_u2, c_u2, Clk, Rst);
    ucircuit3 u3(a_u3, b_u3, c_u3, Clk, Rst);

    always begin
        #5  Clk = ~Clk; // Toggle clock every 5 ticks
    end

    initial begin
        Clk = 1;
        Rst = 0;
        #5
        //circuit 1
        a_1 <= 5; b_1 <= 7; c_1 <= 3;
        //circuit 1
        a_2 <= 5; b_2 <= 7; c_2 <= 3;
        //circuit 3
        a_3 <= 6; b_3 <= 5; c_3 <= 95; d_3 <= 32;
        e_3 <= 46; f_3 <= 19; g_3 <= 7; h_3 <= 22; sa_3 <= 2;
        //circuit 4
        a_4 <=2; b_4 <=4; c_4 <=9; d_4 <=1; e_4 <=0;
        f_4 <=5; g_4 <=4; h_4 <=2; i_4 <=1; j_4 <=4;
        k_4 <=0; l_4 <=32; m_4 <=2; n_4 <=8; o_4 <=10; p_4 <=11;
        
        //circuit 5
        a_5 <= 15; b_5 <= 27; c_5 <= 33;
        
        //mixed 1
        a_m1 <= 3; b_m1 <= 6;
        
        //mixed 2
        a_m2 <= 3; b_m2 <= 8;
        
        //mixed 2
        a_m3 <= -8; b_m3 <= 5;
        
        //u 1
        a_u1 <= 3; b_u1 <= 6;
        
        //u 2
        a_u2 <= 2; b_u2 <= 4;
        
        //u 3
        a_u3 <= 2; b_u3 <= 2;
        
        
        #10
        if ((z_1 == 12) && (x_1 == 3))begin 
            $display("z = %d, x = %d", z_1, x_1);
            $display("circuit 1 pass");
            end
        else begin
               $display("circuit 1 FAIL"); 
        end 
        
        #160
        //circuit 2
        if ((z_2 == -2) && (x_2 == 8)) begin
            $display("z = %d, x = %d", z_2, x_2);
            $display("circuit 2 pass");
            end
            else begin
            $display("circuit 2 FAIL"); 
        end
            
        if (avg_3 == 3) begin
            $display("avg = %d", avg_3);
            $display("circuit 3 pass");
            end
            else begin
            $display("circuit 3 FAIL"); 
        end
                    
        if (final_4 == 95) begin
            $display("final = %d", final_4);
            $display("circuit 4 pass");
            end
            else begin
            $display("circuit 4 FAIL"); 
        end
        
        if ((z_5 == 42) && (x_5 == -24))begin 
            $display("z = %d, x = %d", z_5, x_5);
            $display("circuit 5 pass");
            end
            else begin
            $display("circuit 5 FAIL"); 
        end 
        
        if ((c_m1 == 9))begin 
            $display("c = %d", c_m1);
            $display("mixed circuit 1 pass");
            end
            else begin
            $display("mixed circuit 1 FAIL"); 
        end 
        
        if ((c_m2 == 11))begin 
            $display("c = %d", c_m2);
            $display("mixed circuit 2 pass");
            end
            else begin
            $display("mixed circuit 2 FAIL"); 
        end 


        if ((c_m3 == -3))begin 
            $display("c = %d", c_m3);
            $display("mixed circuit 3 pass");
            end
            else begin
            $display("mixed circuit 3 FAIL"); 
        end 
        
        if ((c_u1 == 9))begin 
            $display("c = %d", c_u1);
            $display("ucircuit 1 pass");
            end
            else begin
            $display("ucircuit 1 FAIL"); 
        end  

        if ((c_u2 == 6))begin 
            $display("c = %d", c_u2);
            $display("ucircuit 2 pass");
            end
            else begin
            $display("ucircuit 2 FAIL"); 
        end 

        if ((c_u3 == 4))begin 
            $display("c = %d", c_u3);
            $display("ucircuit 3 pass");
            end
            else begin
            $display("ucircuit 3 FAIL"); 
        end        
    end



endmodule
