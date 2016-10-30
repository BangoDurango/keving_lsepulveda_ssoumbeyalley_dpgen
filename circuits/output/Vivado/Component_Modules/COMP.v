`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:36:19 09/06/2016 
// Design Name: 
// Module Name:    COMP 
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
module COMP(a, b, gt, lt, eq);
	parameter DATAWIDTH = 2;
	input [DATAWIDTH-1:0] a, b;
	output reg gt, lt, eq;
	
	always@(a,b)begin
		gt <= 0; lt <= 0; eq <= 0;
		
		if (a > b)
			gt <= 1;
		else if (a < b)
			lt <= 1;
		else if (a == b)
			eq <= 1;

	end
	
endmodule
