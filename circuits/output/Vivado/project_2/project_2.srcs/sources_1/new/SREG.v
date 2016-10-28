`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2016 10:15:44 PM
// Design Name: 
// Module Name: SREG
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

  module SREG #(parameter DATAWIDTH = 2)(d,  Clk, Rst, q);
        input signed [DATAWIDTH-1:0] d;
        output reg signed[DATAWIDTH-1:0] q;
        input Clk, Rst;
        
          always @(posedge Clk) begin
              if(Rst == 1) //synchronous reset
                  q <= 0;
              else
                  q <= d;
          end

        
    endmodule