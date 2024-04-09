module Battleship(
    input logic clk,
	 input logic [4:0] ships,
	 input logic disparo,
	 input logic right,
    input logic left,
    input logic up,
    input logic down,
	 output logic player,
	 output logic pc,
	 output logic [6:0] s1,
	 output logic [6:0] s2,
	 output logic [6:0] t1,
	 output logic [6:0] t2,
	 output logic vgaclk, // 25.175 MHz VGA clock
    output logic hsync, vsync,
    output logic sync_b, blank_b, // To monitor & DAC
    output logic [7:0] r, g, b // To video DAC
);

    // Definición de los barcos
    logic [4:0] player_ships;
    logic [4:0] computer_ships;
	 logic start;
	 
	 segmentOutput segment1(.digit(NUM_SHIPS_PC), .seg(s1));
	 segmentOutput segment2(.digit(NUM_SHIPS_PLAYER), .seg(s2));
	 
	 integer initial_row = 0;
	 integer initial_col = 0;
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


	always_comb begin
		matriz_disparos[initial_row][initial_col] = 1;
	end	
	 
	always @(start) begin
	if (start) begin
			for (int i = 0; i < 5; i++) begin // Recorrer los 32 bits del número binario
				if (ships[i] == 1'b1) // Si el bit actual es 1, incrementar el contador
				  NUM_SHIPS_PC = NUM_SHIPS_PC + 1;
				  NUM_SHIPS_PLAYER = NUM_SHIPS_PLAYER + 1;
					start = 1'b0;
			end
	end
	end
	
	
	always_ff @(posedge clk) begin
		if (right && (initial_col < 3))
			initial_col += 1;
		else if (left && (initial_col > 0))
			initial_col -= 1;
		else if (up && (initial_row > 0))
			initial_row -= 1;
		else if (down && (initial_row < 3))
			initial_row += 1;
	end
	
	assign position = {initial_row, initial_col}; 

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
