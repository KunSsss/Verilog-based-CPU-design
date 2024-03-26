`timescale 1ns / 1ps

module register(
	input clk,
	input rst,
	input en,				
	input [15:0] d,				
	output reg [15:0] q				
);
    always @ (posedge clk or negedge rst) begin
      if (rst == 0) q <= 0 ;
      else 
        if (en == 1) q <= d ; 
        else q <= q ; 
      end
endmodule
