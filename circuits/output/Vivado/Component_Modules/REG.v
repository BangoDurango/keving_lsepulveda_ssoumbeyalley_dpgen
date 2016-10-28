`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:49:53 09/05/2016 
// Design Name: 
// Module Name:    register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module REG(d, Clk, Rst, q);
	parameter DATAWIDTH = 2;
	input [DATAWIDTH-1:0] d;
	input Clk, Rst;
	output reg [DATAWIDTH-1:0] q;
	
	always@(posedge Clk)begin
		if (Rst == 1)
			q <= 0;
		else
			q <= d;
	end
	


endmodule
