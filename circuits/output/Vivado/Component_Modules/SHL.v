`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:06 09/06/2016 
// Design Name: 
// Module Name:    SHL 
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
module SHL(a, sh_amt, d);
	parameter DATAWIDTH = 2;
	input [DATAWIDTH-1:0] a;
	input [0:0] sh_amt;
	output reg [DATAWIDTH-1:0] d;
	
	always@(*) begin
		d <= a << sh_amt;
	end

endmodule