`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:25:36 09/06/2016 
// Design Name: 
// Module Name:    adder 
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
module SADD(a,b,sum);
	parameter DATAWIDTH = 2;
	input signed [DATAWIDTH-1:0] a, b;
	output reg signed [DATAWIDTH-1:0] sum;
	
	always@(a,b)begin
		sum <= a + b;
	end
	
endmodule
