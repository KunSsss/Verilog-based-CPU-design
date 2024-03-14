`timescale 1ns / 1ps

module register(
	clk,
	rst,
	en,				
	d,				
	q				
);

input clk, rst, en ;
input wire [15:0] d ;
output reg [15:0] q ;

    always @ (posedge clk or negedge rst) begin
      if (rst == 0) q <= 0 ;
      else 
        if (en == 1) q <= d ; 
        else q <= q ; 
      end
endmodule
