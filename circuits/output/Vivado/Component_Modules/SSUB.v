`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:34:28 09/06/2016 
// Design Name: 
// Module Name:    SUB 
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
module SSUB(a,b,diff);
	parameter DATAWIDTH = 2;
	input signed [DATAWIDTH-1:0] a, b;
	output reg signed [DATAWIDTH-1:0] diff;
	
	always@(a,b)begin
		diff <= a - b;
	end
	
endmodule
