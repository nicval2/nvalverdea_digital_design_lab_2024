module Battleship(
    input logic clk
);

    // Matrices de prueba, cambiar a inputs despues de probar
    logic [4:0][4:0] matriz_barcos = '{
        '{1, 1, 1, 1, 1},   
        '{0, 1, 1, 1, 0},   
        '{1, 1, 1, 1, 0},   
        '{0, 1, 1, 0, 0},   
        '{1, 0, 0, 0, 0}    
    };
    logic [4:0][4:0] matriz_golpes = '{
        '{0, 0, 2, 0, 0},   
        '{1, 2, 0, 0, 1},   
        '{2, 0, 0, 0, 0},   
        '{0, 0, 0, 1, 0},   
        '{0, 0, 0, 0, 0}    
    };
    logic [4:0][4:0] matriz_disparos = '{
        '{2, 0, 2, 0, 1},   
        '{0, 2, 0, 0, 0},   
        '{1, 0, 0, 2, 1},   
        '{0, 0, 0, 1, 0},   
        '{0, 0, 0, 0, 0}    
    };

    logic [7:0] r, g, b;

    // Instantiate videoGen module
    videoGen videoGen_inst(
        .x(0), // Assuming x and y coordinates are always 0
        .y(0),
        .matriz_barcos(matriz_barcos),
        .matriz_golpes(matriz_golpes),
        .matriz_disparos(matriz_disparos),
        .r(r),
        .g(g),
        .b(b)
    );

    // Clock divider for simulation purposes
    always_ff @(posedge clk) begin
        // Implement clock divider here if needed
    end

endmodule
