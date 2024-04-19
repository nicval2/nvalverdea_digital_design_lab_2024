module manejo_matrices_seleccionar (
    input logic colocar,
    input logic clk,
    input logic rst,
    input logic [1:0] matriz_posicion [4:0][4:0],  // Matriz de posición general
    output logic [1:0] matriz_posicion_jugador_colocar [4:0][4:0],  // Matriz para colocar posiciones
    output logic [1:0] matriz_posicion_jugador_atacar [4:0][4:0] // Matriz para ataques
);

    // Proceso para manejar las actualizaciones de las matrices basadas en la señal colocar
    always_ff @(colocar) begin
        if (colocar) begin
            // Si colocar es 1, actualiza la matriz de colocar y resetea la de atacar
            matriz_posicion_jugador_colocar <= matriz_posicion;
            matriz_posicion_jugador_atacar <= '{default:0};  // Llena de ceros
        end else begin
            // Si colocar es 0, actualiza la matriz de atacar y resetea la de colocar
            matriz_posicion_jugador_atacar <= matriz_posicion;
            matriz_posicion_jugador_colocar <= '{default:0};  // Llena de ceros
        end
    end
endmodule