`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2016 10:17:03 PM
// Design Name: 
// Module Name: ADD
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


   module ADD #(parameter DATAWIDTH = 2)( a, b, sum);
        input [DATAWIDTH-1:0] a, b;
        output reg [DATAWIDTH-1:0] sum;

    
        always @(a, b) begin     
              sum <= a + b;
        end
        
    endmodule