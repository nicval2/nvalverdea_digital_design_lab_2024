module Battleship(
    input logic clk,
	 output logic vgaclk, // 25.175 MHz VGA clock
    output logic hsync, vsync,
    output logic sync_b, blank_b, // To monitor & DAC
    output logic [7:0] r, g, b // To video DAC
);

    // Matrices de prueba, cambiar a inputs despues de probar
    logic [4:0][4:0] matriz_barcos = '{
        '{1, 1, 1, 1, 1},   
        '{0, 1, 1, 1, 0},   
        '{1, 1, 1, 1, 0},   
        '{0, 1, 1, 0, 0},   
        '{1, 0, 0, 0, 0}    
    };
    logic [4:0][4:0] matriz_golpes = '{
        '{0, 0, 2, 0, 0},   
        '{1, 2, 0, 0, 1},   
        '{2, 0, 0, 0, 0},   
        '{0, 0, 0, 1, 0},   
        '{0, 0, 0, 0, 0}    
    };
    logic [4:0][4:0] matriz_disparos = '{
        '{2, 0, 2, 0, 1},   
        '{0, 2, 0, 0, 0},   
        '{1, 0, 0, 2, 1},   
        '{0, 0, 0, 1, 0},   
        '{0, 0, 0, 0, 0}    
    };


    // Instantiate videoGen module
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
