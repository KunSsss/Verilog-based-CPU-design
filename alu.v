`timescale 1ns / 1ns

`define B15to0H     3'b000
`define AandBH      3'b011
`define AorBH       3'b100
`define AaddBH      3'b001
`define AsubBH      3'b010
`define leftshift   3'b101
`define rightshift  3'b110

module alu (
	input clk, 
	input rst, 
	input en_in, 
	input [15:0] alu_a, 
	input [15:0] alu_b, 
	input [2:0] alu_func, 
	output reg en_out, 
	output reg [15:0] alu_out
);
	always @ (negedge rst or posedge clk) begin
		if (rst == 1'b0) begin
			alu_out <= 16'b0000_0000_0000_0000 ;
			en_out  <= 1'b0 ;
		end				
		else begin
			if (en_in == 1'b1) begin
				en_out <= 1'b1;
				case (alu_func)
				// please add your code here
					B15to0H: alu_out <= alu_b ; 
					AandBH: alu_out <= a & b ; 
					AorBH: alu_out <= a | b ; 
					AaddBH: alu_out <= a + b ; 
					AsubBH: alu_out <= a - b ; 
					leftshift: alu_out <= (alu_out << 1) ; 
					rightshift: alu_out <= (alu_out >> 1) ;
					default: alu_out <= alu_out ; 
				endcase
			end
			else en_out <= 1'b0;
		end
    end
endmodule
