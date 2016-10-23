`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/06/2016 10:32:47 AM
// Design Name: 
// Module Name: MUX2x1
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


module MUX2x1 #(parameter DATAWIDTH = 8)(a,b,sel,d);

    input [DATAWIDTH -1:0]a, b;
    input sel;
    output reg [DATAWIDTH -1:0] d;
    
    always@(*) begin
        
        if(sel == 0) begin
            d<=a;
        end //sel==0
        else if(sel == 1) begin
            d<=b;
        end//sel == 1
    end //always@(*)
endmodule

//input [DATAWIDTH-1:0] a, b;
//wire [DATAWIDTH:0] t;
//output reg [DATAWIDTH - 1:0] s;

//t <= a + b;
//s <= t[DATAWIDTH - 1:0];