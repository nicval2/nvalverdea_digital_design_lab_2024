module random_tb();
	
	logic clk, rst;
	reg [2:0] rnd1, rnd2;
	
	always begin
		#5 clk = 1;
		#5 clk = 0;
	end
	
	random ga1 (
		clk, rst, 3'b011,
		rnd1
	);
	
	random ga2 (
		clk, rst, 3'b100,
		rnd2
	);
	
	
	
	initial begin
		clk = 0;
		rst = 0;
		#20 
		
		rst = 1;
		// mostrar los valores aleatorios
		$display("Valor aleatorio:");
		for (int i = 0; i < 20; i = i + 1) begin
			#10 
			$display("rnd1: %d", rnd1);
			$display("rnd2: %d", rnd2);
		end
	

	end
endmodule