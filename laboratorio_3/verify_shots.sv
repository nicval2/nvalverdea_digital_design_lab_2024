module verify_shots(
    input logic [1:0] matriz_enemigo [4:0][4:0],
    input logic [1:0] matriz_disparos_vieja [4:0][4:0],
    output logic [1:0] matriz_disparos_nueva [4:0][4:0]
);

    // Iterate over the matrices to check for hits
    always_comb begin
        // Initialize the new shots matrix
        for (int i = 0; i < 5; i++) begin
            for (int j = 0; j < 5; j++) begin
                // Default to the old shots matrix
                matriz_disparos_nueva[i][j] = matriz_disparos_vieja[i][j];

                // Check if there's a ship and an old shot at the same position
                if (matriz_enemigo[i][j] == 2'b01 && matriz_disparos_vieja[i][j] == 2'b01) begin
                    // Mark as a successful shot
                    matriz_disparos_nueva[i][j] = 2'b10;
                end
            end
        end
    end

endmodule