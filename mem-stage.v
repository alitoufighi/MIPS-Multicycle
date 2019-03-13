module MEM_Stage(
		input clk,

		input MEM_R_EN_in,
		input MEM_W_EN_in,
		input [31:0] ALU_result_in,
		input [31:0] ST_val,

		output [31:0] Mem_read_value
);

	wire [31:0] mem_addr;

	Address_Mapping address_mapping(
		.addr_in(ALU_result_in),
		.addr_out(mem_addr)
	);

	Data_Memory data_memory(
		.clk(clk),
		.addr(mem_addr),
		.write_val(ST_val),
		.MEM_R_EN(MEM_R_EN_in),
		.MEM_W_EN(MEM_W_EN_in),
		.read_val(Mem_read_value)
	);
endmodule
