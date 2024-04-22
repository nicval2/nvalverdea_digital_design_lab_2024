module colocar_barcos (
    input reg [2:0] fila,  // Entrada para la fila (0 a 4)
    input reg [2:0] columna,  // Entrada para la columna (0 a 4)
    input logic [2:0] cantidad_barcos,  // Cantidad inicial de barcos (1 a 5)
    input logic aceptar,  // Señal para confirmar la colocación del barco
    input logic clk,  // Reloj para sincronizar la operación
    input logic rst,  // Reset para inicializar/reiniciar el módulo
	 output logic [1:0] matriz [4:0][4:0],  // Matriz para colocar posiciones
    output logic completo  // Indica si ya se colocaron todos los barcos
);

    // Registros internos para manejar la lógica
    logic [2:0] barcos_restantes;

    // Inicializar la matriz y el contador de barcos en el reset
    always @(aceptar) begin  
        if (aceptar && barcos_restantes > 0 && !matriz[fila][columna]) begin
            matriz[fila][columna] = 1;  // Coloca un barco en la posición especificada
            barcos_restantes = barcos_restantes - 1;  // Decrementa el contador de barcos restantes
            if (barcos_restantes == 0) begin
                completo = 1;  // Todos los barcos han sido colocados
            end
        end
    end
endmodule