`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2016 10:43:04 AM
// Design Name: 
// Module Name: SSHR
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


module SSHR #(parameter DATAWIDTH = 16)(a, sh_amt, d);
    
     input signed [DATAWIDTH -1:0]a;
     input signed[DATAWIDTH -1:0]sh_amt;
     output reg signed[DATAWIDTH -1:0]d;
     
     always@(a,sh_amt) begin
        
        d <= a >>> sh_amt;
        
     end //always@(a,sh_amt)
     
endmodule
