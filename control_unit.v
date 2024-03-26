module control_unit (
	input clk,
	input rst,
	input en,
	input en_alu,
	input en_ram_out,
	input [15:0] ins,
	output reg offset_addr,
	output en_ram_in,	
	output en_group_pulse,
	output en_pc_pulse,
	output [3:0] reg_en,
	output alu_in_sel,
	output [2:0] alu_func,
	output [1:0] pc_ctrl  		
);
wire [15:0] ir_out ;
wire en_out ;

	ir ir1(
		.clk(clk),
		.rst(rst),
		.ins(ins),
		.en_in(en_ram_out),
		.en_out(en_out),
		.ir_out(ir_out)
	);
		
	
	state_transition state_transition1(
		.clk(clk),
		.rst(rst),
		.en_in(en),
		.en1(en_out),
		.en2(en_alu),
		.rd(ir_out[11:10]),
		.opcode(ir_out[15:12]),
		.en_fetch_pulse(en_ram_in),	
		.en_group_pulse(en_group_pulse),
		.en_pc_pulse(en_pc_pulse),
		.pc_ctrl(pc_ctrl),
		.reg_en(reg_en),
		.alu_in_sel(alu_in_sel),
		.alu_func(alu_func)			
	);
					
	always @ (en_out or ir_out) begin
		offset_addr = ir_out[7:0] ;
	end

endmodule
