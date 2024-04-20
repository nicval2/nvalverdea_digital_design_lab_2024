module gestion_turnos (
    input logic clk,
    input logic segundos,
    input logic accion_jugador,
    output logic turno_player,
    output logic turno_pc
);

    // Inicialización y gestión de estados
    always_ff @(accion_jugador) begin
        if (accion_jugador) begin
            turno_player <= 1;
            turno_pc <= 0;
        end else begin
            if (segundos >= 15) begin
                    // El tiempo expira y el turno pasa a la PC
                turno_player <= 0;
                turno_pc <= 1;
            end else begin
                turno_player <= 1;
                turno_pc <= 0;
            end
        end
    end
endmodule