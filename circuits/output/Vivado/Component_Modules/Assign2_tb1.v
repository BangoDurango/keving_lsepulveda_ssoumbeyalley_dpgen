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


module Assign2_tb1();

	reg [63:0] a_5, b_5, c_5;
//	reg [7:0] sa_3;
	reg Clk, Rst;
	//reg [15:0] a_3, b_3, c_3, d_3, e_3, f_3, g_3, h_3;
	wire [31:0] z_t, x_t;
	//wire [15:0] avg_3;
    //circuit3 cir3(a_3, b_3, c_3, d_3, e_3, f_3, g_3, h_3, sa_3, avg_3, Clk, Rst);
    circuit5 cir5(a_5, b_5, c_5, z_t, x_t, Clk, Rst);

    always begin
        #10  Clk = ~Clk; 
        if (Rst == 1) begin
                a_5 <= 15; b_5 <= 27; c_5 <= 33;
            //    a_3 <= 6; b_3 <= 5; c_3 <= 95; d_3 <= 32;
            //    e_3 <= 46; f_3 <= 19; g_3 <= 7; h_3 <= 22; sa_3 <= 2;
                Rst <=0;
         end
    end

    initial begin
        Clk = 1;
        Rst = 1;

        #20
//a_5 = 15; b_5 = 27; c_5 = 33;
#10

        if ((z_t == 42) && (x_t == -24))begin 
            $display("z = %d, x = %d", z_t, x_t);
            $display("circuit 5 pass");
        end 

    end


endmodule
