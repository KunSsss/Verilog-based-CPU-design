module data_path (
	input clk, 
	input rst,
	input [7:0] offset_addr,	
	input en_pc_pulse,
	input [1:0]pc_ctrl, 
	input [7:0] offset, 
	input en_in,
	input [3:0]reg_en,	
	input alu_in_sel,
	input [2:0]alu_func, 
	output en_out,	
	output [15:0]pc_out,
	input [1:0]rd,
	input [1:0]rs		
);
wire [15:0] rd_q, rs_q, alu_a, alu_b, alu_out ;	
wire en_out_group, en_out_alu_mux ;  

pc pc1(
    clk(clk),
    rst(rst),       
	en_in(en_pc_pulse),
	pc_ctrl(pc_ctrl),
	offset_addr(offset_addr), 		 			 
	pc_out(pc_out)	
);

reg_group reg_group1(
	.clk(clk),
	.rst(rst),
	.en_in(en_in),
	.reg_en(reg_en),
	.d_in(alu_out),
	.rd(rd),
	.rs(rs),
	.rd_q(rd_q),
	.en_out(en_out_group),
	.rs_q(rs_q)		
);
			
alu_mux alu_mux1(                                        
	.clk(clk),
	.rst(rst),
	.en_in(en_out_group),
	.rd_q(rd_q),
	.rs_q(rs_q),
	.offset(offset),
	.alu_in_sel(alu_in_sel),
	.alu_a(alu_a),
	.en_out(en_out_alu_mux),					
	.alu_b(alu_b)  		
);

alu alu1(
	.clk(clk),
	.rst(rst),
	.en_in(en_out_alu_mux),					
	.alu_a(alu_a),
	.alu_b(alu_b),
	.alu_func(alu_func),
	.en_out(en_out),
	.alu_out(alu_out ) 
);							
endmodule				
