module FSM(
    input rst,          // Reset de la FSM
    input logic clk,    // Clock de la FSM
    input logic btn,      // Botón de select (presionado = 0, no presionado = 1)
	 output logic [1:0] matriz_barcos [4:0][4:0],
    output logic [1:0] matriz_golpes [4:0][4:0],
    output logic [1:0] matriz_disparos [4:0][4:0],
	 output logic displayLose,
	 output logic displayWins
);

// Declaración de parámetros
localparam STATE_INTIIAL = 4'b0000;
localparam STATE_SET_SHIPS = 4'b0001;
localparam STATE_PLAYER_TURN = 4'b0010;
localparam STATE_VERIFY_SHOTS = 4'b0011;
localparam STATE_VERIFY_WIN = 4'b0100;
localparam STATE_WIN_SCREEN = 4'b0101;
localparam STATE_PC_TURN = 4'b0110;
localparam STATE_VERIFY_HITS= 4'b0111;
localparam STATE_VERIFY_LOSE= 4'b1000;
localparam STATE_LOSE_SCREEN = 4'b1001;

//Declaracion variables
logic [3:0] estado_actual, estado_siguiente;
logic all_ships_set; //Jugador ha colocado todos los barcos
logic reached_15sec; //Contador 15 segundos turno jugador

logic [1:0] matriz_barcos_pc [4:0][4:0];
logic [1:0] matriz_barcos_jugador [4:0][4:0];
logic [1:0] matriz_disparos_a_pc_sin_verf [4:0][4:0];
logic [1:0] matriz_disparos_a_pc_verf [4:0][4:0];
logic [1:0] matriz_disparos_a_jugador_sin_verf [4:0][4:0];
logic [1:0] matriz_disparos_a_jugador_verf [4:0][4:0];
logic [1:0] matriz_posicion_jugador_atacar [4:0][4:0];
logic [1:0] matriz_posicion_jugador_colocar [4:0][4:0];
logic player_wins;
logic player_lose;
int pc_ships_left;
int player_ships_left;

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
				if (player_wins)
                estado_siguiente = STATE_WIN_SCREEN;
            else
                estado_siguiente = STATE_PC_TURN;
					 
			STATE_PC_TURN:
				estado_siguiente = STATE_VERIFY_HITS;
        
        STATE_VERIFY_HITS:
				estado_siguiente = STATE_VERIFY_LOSE;
				
		STATE_VERIFY_LOSE:
			if (player_lose)
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

verify_shots player_to_pc(matriz_barcos_pc, matriz_disparos_a_pc_sin_verf, matriz_disparos_a_pc_verf);
count_ships_left pc_ships(matriz_barcos_pc, matriz_disparos_a_pc_verf, pc_ships_left);

verify_shots pc_to_player(matriz_barcos_jugador, matriz_disparos_a_jugador_sin_verf, matriz_disparos_a_jugador_verf);
count_ships_left player_ships(matriz_barcos_jugador, matriz_disparos_a_jugador_verf, player_ships_left);


// Acciones en cada estado

always_ff @(posedge clk or posedge rst)
begin
    if (rst) begin
        estado_actual <= STATE_INTIIAL;
		  displayLose <= 0;
        displayWins <= 0;
        player_wins <= 0;
        player_lose <= 0;
    end
    else begin
        case (estado_actual)
				//STATE_INTIIAL:
					//Crear matriz barcos de la pc
				//STATE_SET_SHIPS:
					//Actualizar matriz barcos jugador
				//STATE_PLAYER_TURN:
                //Actualizar FLAG contador de 15 seg
            STATE_VERIFY_SHOTS:
					// Actualizar matrix de disparos sin verf (Agregar 01 a nuevo disparo del jugador)
                matriz_disparos <= matriz_disparos_a_pc_verf; // Actualiza la matriz de disparos
				STATE_VERIFY_WIN:
					player_wins <= (pc_ships_left == 0);
				//STATE_PC_TURN:
					//Generar numero random y hacer golpe a jugador, actualizar matriz matriz_disparos_a_jugador_sin_verf, solo a 01
            STATE_VERIFY_HITS:
					matriz_golpes <= matriz_disparos_a_jugador_verf;
				STATE_VERIFY_LOSE:
					player_lose <= (player_ships_left == 0);
				STATE_WIN_SCREEN:
					displayWins <= 1;
				STATE_LOSE_SCREEN:
					displayLose <= 1;
        endcase
    end
end


endmodule