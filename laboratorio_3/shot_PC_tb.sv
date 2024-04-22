module shot_PC_tb;

parameter CLK_PERIOD = 10;

reg clk = 0;
reg rst = 1;

wire [2:0] i_out;
wire [2:0] j_out;

shot_PC uut (
    .clk(clk),
    .rst(rst),
    .i(i_out),
    .j(j_out)
);

always #CLK_PERIOD clk = !clk;

initial begin
    #CLK_PERIOD;
    rst = 0;

    #100;

    // Mostrar resultados
	 $display("Posiciones generadas:");
	 for (int i = 0; i < 5; i = i + 1) begin
		#10; // Esperar un ciclo para permitir que se actualicen las posiciones
		$display("(i, j) = (%d, %d)", i_out[2:0], j_out[2:0]);
	 end

    $finish;
end

endmodule