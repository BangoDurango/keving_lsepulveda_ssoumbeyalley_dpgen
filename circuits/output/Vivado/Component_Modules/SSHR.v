`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:45 09/06/2016 
// Design Name: 
// Module Name:    SHR 
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
module SSHR(a, sh_amt, d);
	parameter DATAWIDTH = 2;
	input signed [DATAWIDTH-1:0] a;
	input sh_amt;
	output reg signed [DATAWIDTH-1:0] d;
	
	always@(*) begin
		d <= a >> sh_amt;
	end

endmodule