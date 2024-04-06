module Battleship(
    input logic clk,
	 output logic vgaclk, // 25.175 MHz VGA clock
    output logic hsync, vsync,
    output logic sync_b, blank_b, // To monitor & DAC
    output logic [7:0] r, g, b // To video DAC
);

    // Matrices de prueba, cambiar a inputs despues de probar
	logic [1:0] matriz_barcos [4:0][4:0] = '{
		 '{2'b01, 2'b01, 2'b01, 2'b01, 2'b01},   
		 '{2'b00, 2'b01, 2'b01, 2'b01, 2'b00},   
		 '{2'b01, 2'b01, 2'b01, 2'b01, 2'b00},   
		 '{2'b00, 2'b01, 2'b01, 2'b00, 2'b00},   
		 '{2'b01, 2'b00, 2'b00, 2'b00, 2'b00}};

	logic [1:0] matriz_golpes [4:0][4:0]= '{
		 '{2'b00, 2'b00, 2'b10, 2'b00, 2'b00},   
		 '{2'b01, 2'b10, 2'b00, 2'b00, 2'b01},   
		 '{2'b10, 2'b00, 2'b00, 2'b00, 2'b00},   
		 '{2'b00, 2'b00, 2'b00, 2'b01, 2'b00},   
		 '{2'b00, 2'b00, 2'b00, 2'b00, 2'b00}};

	logic [1:0] matriz_disparos [4:0][4:0] = '{
		 '{2'b10, 2'b00, 2'b10, 2'b00, 2'b01},   
		 '{2'b00, 2'b10, 2'b00, 2'b00, 2'b00},   
		 '{2'b01, 2'b00, 2'b00, 2'b10, 2'b01},   
		 '{2'b00, 2'b00, 2'b00, 2'b01, 2'b00},   
		 '{2'b00, 2'b00, 2'b00, 2'b00, 2'b00}};



    // Instantiate the vga module
	vga vga_inst (
    .clk(clk),
    .matriz_barcos(matriz_barcos),
    .matriz_golpes(matriz_golpes),
    .matriz_disparos(matriz_disparos),
    .vgaclk(vgaclk),
    .hsync(hsync),
    .vsync(vsync),
    .sync_b(sync_b),
    .blank_b(blank_b),
    .r(r),
    .g(g),
    .b(b)
);

endmodule
