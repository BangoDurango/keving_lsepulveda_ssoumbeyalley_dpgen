`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:35:20 09/06/2016 
// Design Name: 
// Module Name:    SMUL 
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
module SMUL(a,b,prod);
	parameter DATAWIDTH = 2;
	input signed [DATAWIDTH-1:0] a, b;
	output reg signed[DATAWIDTH-1:0] prod;
	
	always@(a,b)begin
		prod <= a * b;
	end
	
endmodule