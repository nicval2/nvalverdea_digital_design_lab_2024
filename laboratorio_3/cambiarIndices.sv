module cambiarIndices (
	input reg [2:0] i_next, j_next, input enable_mov, clk, rst,
	output reg [2:0] i_actual, j_actual
);

	assign i_actual = i_next;
	assign j_actual = j_next;
	
endmodule