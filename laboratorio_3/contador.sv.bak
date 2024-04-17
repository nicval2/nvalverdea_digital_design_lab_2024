module contador(
    input logic right,
    input logic left,
    input logic up,
    input logic down,
    input logic clk,
    output logic [3:0] position
);

// Declaración de la matriz
logic [3:0] matrix_posicion [0:3][0:3];

// Posición inicial del 1
integer initial_row = 0;
integer initial_col = 0;

// Asignación del 1 en la posición inicial
always_comb begin
    matrix_posicion[initial_row][initial_col] = 1;
end

// Proceso para mover el 1 según las entradas
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

// Salida de la posición actual del 1
assign position = {initial_row, initial_col};

endmodule
