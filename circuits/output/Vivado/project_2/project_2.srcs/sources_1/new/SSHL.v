`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2016 03:27:33 PM
// Design Name: 
// Module Name: SSHL
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


module SSHL #(parameter DATAWIDTH = 2)(a, sh_amt, d);
    
     input signed[DATAWIDTH -1:0]a;
     input signed[DATAWIDTH -1:0]sh_amt;
     output reg signed[DATAWIDTH -1:0]d;
     
     always@(a,sh_amt) begin
        
        d <= a <<< sh_amt;
        
     end //always@(a,sh_amt)
     
endmodule