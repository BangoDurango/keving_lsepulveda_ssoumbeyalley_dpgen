`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:34 09/06/2016 
// Design Name: 
// Module Name:    MUX2x1 
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
module SMUX2x1(a,b,sel,d);
	parameter DATAWIDTH = 16;
	input signed [DATAWIDTH-1:0] a,b;
	input signed sel;
	output reg signed [DATAWIDTH-1:0] d;
	
	always@(a,b,sel)begin
		if (sel == 0)
			d <= b;
		else 
			d <= a;
	end

endmodule
