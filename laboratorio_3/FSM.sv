module FSM(
    input rst,          // Reset de la FSM
    input logic clk,    // Clock de la FSM
    input logic btn,      // Botón de select (presionado = 0, no presionado = 1)
    output logic [7:0] segments_player,
	output logic [7:0] segments_pc,
	output logic [1:0] matriz_barcos [4:0][4:0],
    output logic [1:0] matriz_golpes [4:0][4:0],
    output logic [1:0] matriz_disparos [4:0][4:0]	// Registro de estado
);

// Declaración de parámetros
localparam STATE_INTIIAL = 4'b0000;
localparam STATE_SET_SHIPS = 4'b0001;
localparam STATE_PLAYER_TURN = 4'b0010;
localparam STATE_VERIFY_SHOTS = 4'b0011;
localparam STATE_VERIFY_WIN = 4'b0100;
localparam STATE_WIN_SCREEN = 4'b0101;
localparam STATE_PC_TURN = 4'b00110;
localparam STATE_VERIFY_HITS= 4'b0111;
localparam STATE_VERIFY_LOSE= 4'b1000;
localparam STATE_LOSE_SCREEN = 4'b0011;

//Declaracion variable
logic [3:0] estado_actual, estado_siguiente;
logic all_ships_set; //Jugador ha colocado todos los barcos
logic reached_15sec; //Contador 15 segundos turno jugador
logic playerWins;
logic playerLose;

// FSM de control
always_ff @(posedge clk or posedge rst)
begin
    if (rst) begin
        estado_actual <= STATE_INTIIAL;
    end
    else begin
        estado_actual <= estado_siguiente;
    end
end

// State machine logic
always_comb
begin
    case (estado_actual)
        STATE_INTIIAL:
            if (!btn) // Button pressed
                estado_siguiente = STATE_SET_SHIPS;
            else
                estado_siguiente = STATE_INTIIAL;
        
        STATE_SET_SHIPS:
				if(all_ships_set)
					estado_siguiente = STATE_PLAYER_TURN;
				else
					estado_siguiente = STATE_SET_SHIPS;
        
        STATE_PLAYER_TURN:
            if (reached_15sec)
                estado_siguiente = STATE_PC_TURN;
            else if (!btn)
                estado_siguiente = STATE_VERIFY_SHOTS;
        
        STATE_VERIFY_SHOTS:
				estado_siguiente = STATE_VERIFY_WIN;
					 
		  STATE_VERIFY_WIN:
				if (playerWins)
                estado_siguiente = STATE_WIN_SCREEN;
            else
                estado_siguiente = STATE_PC_TURN;
					 
			STATE_PC_TURN:
				estado_siguiente = STATE_VERIFY_HITS;
        
        STATE_VERIFY_HITS:
				estado_siguiente = STATE_VERIFY_LOSE;
				
		STATE_VERIFY_LOSE:
			if (playerLose)
				estado_siguiente = STATE_LOSE_SCREEN;
			else
				estado_siguiente = STATE_PLAYER_TURN;
		STATE_WIN_SCREEN:
			if (rst)
				estado_siguiente = STATE_INTIIAL;
			else
				estado_siguiente = STATE_WIN_SCREEN;
				
		STATE_LOSE_SCREEN:
			if (rst)
				estado_siguiente = STATE_INTIIAL;
			else
				estado_siguiente = STATE_LOSE_SCREEN;
				
       default: 
				estado_siguiente = STATE_INTIIAL;
    endcase
end

// Contador de ciclos
/*
always_ff @(posedge clk or posedge rst)
begin
    if (rst) begin
        contador_ciclos <= 8'h0;
    end
    else begin
        case (estado_actual)
            ESTADO_MANTENIMIENTO:
                contador_ciclos <= 8'h0; // Reset to 0
            ESTADO_CONT_CICLOS:
                contador_ciclos <= contador_ciclos + 1;
            default:
                contador_ciclos <= contador_ciclos;
        endcase
    end
end
*/

endmodule