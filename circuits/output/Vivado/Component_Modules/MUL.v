    module MUL #(parameter DATAWIDTH = 2)( a, b, pro);
       input [DATAWIDTH-1:0] a, b;
        output reg [DATAWIDTH-1:0] pro;
        
        always @(a, b) begin
       
                pro <= a * b;
                
        end      
    endmodule