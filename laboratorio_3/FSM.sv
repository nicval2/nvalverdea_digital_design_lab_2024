module FSM(
    input clk,              // Clock
    input rst,              // Reset
    input start_game,       // Señal para iniciar el juego
    input [4:0] row_in,     // Entrada de fila seleccionada
    input [4:0] col_in,     // Entrada de columna seleccionada
    input hit,              // Señal de impacto en una casilla

    output reg [4:0] row_out,    // Salida de fila a iluminar en el tablero
    output reg [4:0] col_out,    // Salida de columna a iluminar en el tablero
    output reg hit_feedback,     // verificar de si hubo un golpe
    output reg game_over        // Señal de fin de juego
);

// Parámetros de estado
parameter START = 2'b00;
parameter SELECT_CELL = 2'b01;
parameter CHECK_HIT = 2'b10;
parameter GAME_OVER = 2'b11;

// Definición de registros de estado
reg [1:0] state, next_state;

// Definición de los barcos restantes
reg [4:0] ships_remaining;

// Definición de la tablero
reg [4:0] board[0:4];

// Definición de contadores y temporizadores
reg [7:0] timer;

// Inicialización de variables
initial begin
    state = START;
    next_state = START;
    ships_remaining = 5; // 5 barcos
    // Inicializar tablero
    // Cada bit indica si hay un barco en esa posición
    // Aquí puedes inicializar aleatoriamente los barcos en el tablero
end

// Lógica de la FSM
always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= START;
        next_state <= START;
    end 
	 else begin
        state <= next_state;
        // Solo asignar next_state en condiciones específicas
        case(state)
            START: begin
                if (start_game) begin
                    next_state = SELECT_CELL;
                end
            end
            SELECT_CELL: begin
                // Lógica para seleccionar una celda
                if (row_in < 5 && col_in < 5) begin
                    next_state = CHECK_HIT;
                end
            end
            CHECK_HIT: begin
                // Lógica para verificar si hubo un acierto
                if (hit) begin
                    hit_feedback = 1;
                    // Lógica para comprobar si el juego ha terminado (todos los barcos han sido hundidos)
						  
                    if (ships_remaining == 0) begin
                        game_over = 1;
                        next_state = GAME_OVER;
                    end
                end else begin
                    hit_feedback = 0;
                    next_state = START; // Moverse de vuelta a inicio
                end
            end
            GAME_OVER: begin
                // Lógica para el estado de fin de juego
            end
        endcase
    end
end




endmodule

