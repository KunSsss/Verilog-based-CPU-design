module alu_mux (
	input clk, 
	input rst, 
	input en_in,
	input [7:0] offset, 
	input [15:0] rd_q,
	input [15:0] rs_q,
	input alu_in_sel,
	output reg [15:0] alu_a,
	output reg [15:0] alu_b,
	output reg en_out
);
	always @ (negedge rst or posedge clk) begin
		if (rst == 1'b0) begin
			alu_a <= 16'b0000_0000_0000_0000 ;
			alu_b <= 16'b0000_0000_0000_0000 ;
			en_out  <= 1'b0;
		end		
		else 
			if (en_in == 1'b1) begin
				alu_a <= rd_q;
				en_out  <= 1'b1;
				if (alu_in_sel == 1'b0) 
					alu_b <= {{8{offset[7]}}, offset[7:0]} ; 
				else 
					alu_b <= rs_q;					
			end
			else en_out  <= 1'b0;
    end
endmodule
