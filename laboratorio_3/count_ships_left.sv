module count_ships_left(
    input logic [1:0] matriz_barcos [4:0][4:0],
    input logic [1:0] matriz_disparos [4:0][4:0],
    output int ships_left
);

    // Temporary variable to check if a ship is destroyed
    logic ship_destroyed;

    // Initialize the ships_left count
    initial begin
        ships_left = 0;
    end

    // Function to check if a ship is destroyed
    function logic is_ship_destroyed(input int row, input int start_col, input int ship_length);
        for (int i = start_col; i < (start_col + ship_length); i++) begin
            if (matriz_disparos[row][i] != 2'b10) begin
                return 0; // Ship is not destroyed
            end
        end
        return 1; // Ship is destroyed
    endfunction

    // Count the number of ships left
    always_comb begin
        ships_left = 0;
        for (int row = 0; row < 5; row++) begin
            int ship_length = 0;
            for (int col = 0; col < 5; col++) begin
                // Check for the start of a ship
                if (matriz_barcos[row][col] == 2'b01) begin
                    ship_length++;
                    // Check if it's the end of the row or the next cell is not part of the ship
                    if (col == 4 || matriz_barcos[row][col + 1] != 2'b01) begin
                        // Check if the ship is not destroyed
                        ship_destroyed = is_ship_destroyed(row, col + 1 - ship_length, ship_length);
                        if (!ship_destroyed) begin
                            ships_left++;
                        end
                        ship_length = 0; // Reset ship_length for the next ship
                    end
                end
            end
        end
    end

endmodule