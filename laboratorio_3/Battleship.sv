module Battleship(
    input logic clk,
	 input wire reset,
	 input logic [4:0] ships,
	 input logic disparo,
	 input logic right,
    input logic left,
    input logic up,
    input logic down,
	 output logic matriz [4:0],
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
	 logic [3:0] NUM_SHIPS_PC;
    logic [3:0] NUM_SHIPS_PLAYER;
    logic [3:0] NUM_SHIPS;
	 reg [2:0] i_actual, j_actual, i_next, j_next;
	 logic tableroGenerado, esVictoria, movimientoValido, bomba;
	 
	 logic tick;
    logic [5:0] seconds;
    logic [3:0] seconds_units, seconds_tens;
	 
	 // Divisor para generar un pulso cada segundo
    clock_divider divider(clk, reset, tick);

    // Contador de tiempo
    time_counter counter(clk, reset, tick, seconds);

    // Decodificación de dígitos para los displays de 7 segmentos
    assign seconds_units = seconds % 10;
    assign seconds_tens = seconds / 10;
	 
	 
	 seven_segment_display disp_seconds_units(seconds_units, t1);
    seven_segment_display disp_seconds_tens(seconds_tens, t2);
	 
	 
	 logic start = 1'b1;
	 
	 contar_unos_operador unos1(.numero(ships), .cantidad_unos(NUM_SHIPS));	 
	 segmentOutput segment1(.digit(NUM_SHIPS_PC), .seg(s1));
	 segmentOutput segment2(.digit(NUM_SHIPS_PLAYER), .seg(s2));
	 
	reg [2:0] x;
	reg [2:0] y;
	 
	integer initial_row = 0;
	integer initial_col = 0;
	 // Matrices de prueba, cambiar a inputs despues de probar
	logic [1:0] matriz_barcos [4:0][4:0];
	

	
	

	logic [1:0] matriz_golpes [4:0][4:0]= '{
		 '{2'b00, 2'b00, 2'b10, 2'b00, 2'b00},   
		 '{2'b01, 2'b10, 2'b00, 2'b00, 2'b01},   
		 '{2'b10, 2'b00, 2'b00, 2'b00, 2'b00},   
		 '{2'b00, 2'b00, 2'b00, 2'b01, 2'b00},   
		 '{2'b00, 2'b00, 2'b00, 2'b00, 2'b00}};

	logic [1:0] matriz_disparos [4:0][4:0] = '{
		 '{2'b00, 2'b00, 2'b10, 2'b00, 2'b01},   
		 '{2'b00, 2'b10, 2'b00, 2'b00, 2'b00},   
		 '{2'b01, 2'b00, 2'b00, 2'b10, 2'b01},   
		 '{2'b00, 2'b00, 2'b00, 2'b01, 2'b00},   
		 '{2'b00, 2'b00, 2'b00, 2'b00, 2'b00}};	
	/* 
	always @(start) begin
	if (start) begin
			for (int i = 0; i < 5; i++) begin 
				if (ships[i] == 1'b1) // Si el bit actual es 1, incrementar el contador
				  NUM_SHIPS_PC = NUM_SHIPS_PC + 1'b1;
				  NUM_SHIPS_PLAYER = NUM_SHIPS_PLAYER + 1'b1;
				  //start = 1'b0;
			end
	end
	end
	*/
	
	
// Inicialización de la matriz y colocación del cursor en la posición inicial
always @(reset) begin
	 if (reset) begin
		  x <= 3'd0;
		  y <= 3'd0;
		  matriz[y] = 2'b01;
		  matriz_barcos[x][y] = 2'b01;
		  NUM_SHIPS_PC <= NUM_SHIPS;
		  NUM_SHIPS_PLAYER <= NUM_SHIPS;
		  
		  
	 end else begin
		  NUM_SHIPS_PC <= NUM_SHIPS_PC;
		  NUM_SHIPS_PLAYER <= NUM_SHIPS_PLAYER;
		  // Movimientos basados en entradas de control
		  //if (left && x > 0) x <= x - 1;
		  //if (right && x < 5) x <= x + 1;
		  if(y==3'b100 && down==0) y = y;
		  else if(y==3'b0 && up==0) y = y;
		  else if(x==3'b100 && right==0) x = x;
		  else if(x==3'b0 && left==0) x = x;
		  else begin
				if(!up) 
					y=y - 1;
					matriz[y] = 2'b01;
					matriz[y + 1] = 2'b00;
					
				if(!down) 
					y=y + 1;
					matriz[y] = 2'b01;
					matriz[y - 1] = 2'b00;
				if(!right) x=x + 1;
				if(!left) x=x - 1;
		end
	end 
end


	/* 
	
	always_ff @(posedge clk) begin
		if (right)
			matriz_barcos[0][1] = 2'b01;
		else if (left && (initial_col > 0))
			initial_col -= 1;
		else if (up && (initial_row > 0))
			initial_row -= 1;
		else if (down && (initial_row < 2'b11))
			initial_row += 1;
	end
	*/
	
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
