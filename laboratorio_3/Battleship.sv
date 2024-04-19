module Battleship(
    input logic clk,
	 input wire reset,
	 input logic [4:0] ships,
	 input logic disparo,
	 input logic right,
    input logic left,
    input logic up,
    input logic down,
	 input logic colocar,
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
    logic [3:0] NUM_SHIPS, NUM_SHIPS_2;
	 reg [2:0] i_actual, j_actual, i_next, j_next;
	 logic tableroGenerado, esVictoria, movimientoValido, bomba, posicion_barco;
	 logic enable_mov = 1'b1;
	 initial begin
        i_actual = 3'd0;
		  j_actual = 3'd0;
		  i_next = 3'd0;
		  j_next = 3'd0;
    end
	 
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
	 
	 contar_unos_operador unos1(.numero(ships), .cantidad_unos(NUM_SHIPS));	 
	 segmentOutput segment1(.digit(NUM_SHIPS_PC), .seg(s1));
	 segmentOutput segment2(.digit(NUM_SHIPS_PLAYER), .seg(s2));
	 movement m(i_actual, j_actual, up, right, left, down, clk_ms, rst, i_next, j_next, movimientoValido);
	 cambiarIndices ci(i_next, j_next, movimientoValido, clk_ms, rst, i_actual, j_actual);
	 colocar_barcos cb(i_next, j_next, NUM_SHIPS_2, disparo, clk_ms, rst, matriz_barcos,posicion_barco);
	 manejo_matrices_seleccionar m1(colocar,clk_ms, rst, matriz_posicion, matriz_posicion_jugador_colocar, matriz_posicion_jugador_atacar);
	 
	reg [2:0] x;
	reg [2:0] y;
	 
	integer initial_row = 0;
	integer initial_col = 0;
	 // Matrices de prueba, cambiar a inputs despues de probar
	logic [1:0] matriz_barcos [4:0][4:0];
	
	logic [1:0] matriz_posicion [4:0][4:0];
	logic [1:0] matriz_posicion_jugador_atacar [4:0][4:0];
	logic [1:0] matriz_posicion_jugador_colocar [4:0][4:0];


	logic [1:0] matriz_golpes [4:0][4:0]= '{
		 '{2'b00, 2'b00, 2'b10, 2'b00, 2'b00},   
		 '{2'b00, 2'b10, 2'b00, 2'b00, 2'b01},   
		 '{2'b10, 2'b00, 2'b00, 2'b00, 2'b00},   
		 '{2'b00, 2'b00, 2'b00, 2'b01, 2'b00},   
		 '{2'b00, 2'b00, 2'b00, 2'b00, 2'b00}};

	logic [1:0] matriz_disparos [4:0][4:0] = '{
		 '{2'b00, 2'b00, 2'b10, 2'b00, 2'b01},   
		 '{2'b00, 2'b10, 2'b00, 2'b00, 2'b00},   
		 '{2'b01, 2'b00, 2'b00, 2'b10, 2'b01},   
		 '{2'b00, 2'b00, 2'b00, 2'b01, 2'b00},   
		 '{2'b00, 2'b00, 2'b00, 2'b00, 2'b00}};

			 
	always_comb begin
		for (int i = 0; i < 5; i++) begin
            for (int j = 0; j < 5; j++) begin
					if (i_actual ==i && j_actual==j) begin
						matriz_posicion[4-j_actual][4-i_actual] = 2'b01;
                end else begin
						matriz_posicion[4-i][4-j] = 2'b00;
					end
            end
        end

    end
	
// Inicialización de la matriz y colocación del cursor en la posición inicial
always @(reset) begin
	 if (reset) begin
		  NUM_SHIPS_PC <= NUM_SHIPS;
		  NUM_SHIPS_PLAYER <= NUM_SHIPS;	 
		  NUM_SHIPS_2 <= NUM_SHIPS; 
	 end else begin
		  NUM_SHIPS_PC <= NUM_SHIPS_PC;
		  NUM_SHIPS_PLAYER <= NUM_SHIPS_PLAYER;
		  NUM_SHIPS_2 <= NUM_SHIPS_2; 
	end 
end	
	
	assign position = {initial_row, initial_col}; 

    // Instantiate the vga module
	vga vga_inst (
    .clk(clk),
    .matriz_barcos(matriz_barcos),
    .matriz_golpes(matriz_golpes),
    .matriz_disparos(matriz_disparos),
	 .matriz_posicion_jugador_colocar(matriz_posicion_jugador_colocar),
	 .matriz_posicion_jugador_atacar(matriz_posicion_jugador_atacar),
	 .display_lose(0),
	 .display_win(0),
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
