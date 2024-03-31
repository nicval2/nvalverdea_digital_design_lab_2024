module videoGen(
    input logic [9:0] x, y,
    input logic [4:0][4:0] matriz_barcos,
    input logic [4:0][4:0] matriz_golpes,
    input logic [4:0][4:0] matriz_disparos,
    output logic [7:0] r, g, b
);

    // Define colors
    parameter GREY = 8'b10010010;   // Grey for ships
    parameter GREEN = 8'b00001100;  // Green for successful shot
    parameter YELLOW = 8'b11111000; // Yellow for missed shot
    parameter RED = 8'b11100000;    // Red for successful hit
    parameter WHITE = 8'b11111111;  // White for missed hit
    parameter BLACK = 8'b00000000;  // Black for borders
    parameter SKYBLUE = 8'b01010111; // Skyblue for default background

    // Calculate square width and height
    parameter SQUARE_WIDTH = 640 / 10;
    parameter SQUARE_HEIGHT = 480 / 5;
	 
	 logic [3:0] square_x;
	 logic [3:0] square_y;
	 logic is_left_half;
	 logic on_border;
	 logic [7:0] square_color;
		
    // Calculate square position within the grid
    assign square_x = x / SQUARE_WIDTH;
    assign square_y = y / SQUARE_HEIGHT;

    // Determine which half of the screen we are in
    assign is_left_half = (x < 320);

    // Check if the current pixel is on the border of a square
    assign on_border = ((x % SQUARE_WIDTH) < 2) || ((x % SQUARE_WIDTH) > (SQUARE_WIDTH - 3)) || ((y % SQUARE_HEIGHT) < 2) || ((y % SQUARE_HEIGHT) > (SQUARE_HEIGHT - 3));

    // Assign colors based on combinational logic
    always_comb begin
        if (on_border)
            square_color = BLACK;
        else if (is_left_half) begin
            // Left half: ships and hits
            case ({matriz_barcos[square_y][square_x], matriz_golpes[square_y][square_x]})
                 2'b10: square_color = GREY;   // Ship
                 2'b01: square_color = YELLOW; // Missed hit
                 default: begin
                      if (matriz_golpes[square_y][square_x] == 2)
                            square_color = RED;     // Successful hit
                      else
                            square_color = SKYBLUE; // Default background
                 end
            endcase
        end else begin
            // Right half: shots
            case (matriz_disparos[square_y][square_x])
                2: square_color = GREEN;  // Successful shot
                1: square_color = WHITE;  // Missed shot
                default: square_color = SKYBLUE; // Default background
            endcase
        end
    end

    // Output the final color
    assign {r, g, b} = square_color;

endmodule
