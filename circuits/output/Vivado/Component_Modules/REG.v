`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2016 10:15:44 PM
// Design Name: 
// Module Name: REG
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

  module REG #(parameter DATAWIDTH = 2)(d, q, Clk, Rst);
        input [DATAWIDTH-1:0] d;
        output reg [DATAWIDTH-1:0] q;
        input Clk, Rst;
        
          always @(posedge Clk) begin
              if(Rst == 1) //synchronous reset
                  q <= 0;
              else
                  q <= d;
          end

        
    endmodule