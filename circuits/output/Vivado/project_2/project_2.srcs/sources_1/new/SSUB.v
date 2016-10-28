`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2016 10:17:03 PM
// Design Name: 
// Module Name: SSUB
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


module SSUB #(parameter DATAWIDTH = 2)( a, b, diff);
        input signed[DATAWIDTH-1:0] a, b;
        output reg signed [DATAWIDTH-1:0] diff;
        
       always @(a, b) begin
       
               diff <= a - b;
               end      
    endmodule