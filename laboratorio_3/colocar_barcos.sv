module colocar_barcos (
    input reg [2:0] fila,  // Entrada para la fila (0 a 4)
    input reg [2:0] columna,  // Entrada para la columna (0 a 4)
    input logic [2:0] cantidad_barcos,  // Cantidad inicial de barcos (1 a 5)
    input logic aceptar,  // Señal para confirmar la colocación del barco
    input logic clk,  // Reloj para sincronizar la operación
    input logic rst,  // Reset para inicializar/reiniciar el módulo
	 output reg [2:0] i_next_2,  // Entrada para la fila (0 a 4)
    output reg [2:0] j_next_2,  // Entrada para la columna (0 a 4)
	 output logic [2:0] barcos_restantes,
    output logic completo  // Indica si ya se colocaron todos los barcos
);

    // Inicializar la matriz y el contador de barcos en el reset
    always @(aceptar) begin  
        if (!aceptar) begin
            if (cantidad_barcos < 5) begin
					i_next_2 = columna;
					j_next_2 = fila;
					barcos_restantes = cantidad_barcos - 1;
               if (cantidad_barcos == 0) begin 
						completo = 1;
					end
				end
			end
    end
endmodule