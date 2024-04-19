module movement(
	input reg [2:0]i_actual, j_actual, 
	input logic up, right, left, down, clk, rst,
	output reg [2:0]i_next, j_next, output logic movimientoValido
);


always @(down) begin
	if(!down) begin
		/*j_next = j_actual-1;
		i_next = i_actual;*/
		j_next = 1;
		i_next = 1;
		movimientoValido = 1'b1;
	end else begin
		j_next = 0;
		i_next = 0;
		movimientoValido = 1'b1;
	end 
end
				
/*
always @(down or right or left or up) begin
	 if (!down) begin
		if(j_actual==3'b000) begin
			j_next = j_actual;
			i_next = i_actual;
			movimientoValido = 1'b1;
		end else begin
			j_next = j_actual+1;
			i_next = i_actual;
			movimientoValido = 1'b1;
			end
	 end else if (!up) begin
		if(j_actual==3'b100) begin
			j_next = j_actual;
			i_next = i_actual;
			movimientoValido = 1'b1;
		end else begin
			j_next = j_actual-1;
			i_next = i_actual;
			movimientoValido = 1'b1;
			end
	end else if (!right) begin
		if(i_actual==3'b000) begin
			j_next = j_actual;
			i_next = i_actual;
			movimientoValido = 1'b1;
		end else begin
			j_next = j_actual;
			i_next = i_actual+1;
			movimientoValido = 1'b1;
			end
	end else if (!left) begin
		if(i_actual==3'b100) begin
			j_next = j_actual;
			i_next = i_actual;
			movimientoValido = 1'b1;
		end else begin
			j_next = j_actual;
			i_next = i_actual-1;
			movimientoValido = 1'b1;
			end
	 end else begin
		  j_next = j_actual;
		  i_next = i_actual;
		  movimientoValido = 1'b1;

	end 
end
*/
endmodule