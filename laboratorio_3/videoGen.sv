module videoGen(
    input logic [9:0] x, y,
    input logic [1:0] matriz_barcos [4:0][4:0],
    input logic [1:0] matriz_golpes [4:0][4:0],
    input logic [1:0] matriz_disparos [4:0][4:0],
    output logic [7:0] r, g, b
);

    // Define colors
    parameter GREY = 24'b100110011001100110011001;   // Grey for ships
    parameter GREEN = 24'b000000001010011001000001;  // Green for successful shot
    parameter YELLOW = 24'b111000111101010000000000; // Yellow for missed shot
    parameter RED = 24'b110100000011000100101101;    // Red for successful hit
    parameter WHITE = 24'b1;  // White for missed hit
    parameter BLACK = 24'b0;  // Black for borders
    parameter OCEANBLUE = 24'b000000000111011110111110; // Skyblue for default background

    // Calculate square width and height
    parameter SQUARE_WIDTH = 640 / 11; //All squares plus 1 for the margin
    parameter SQUARE_HEIGHT = (480-189) / 5; //Para cuadricular
	 
	 logic [3:0] square_x;
	 logic [3:0] square_y;
	 logic is_left_half;
	 logic on_border;
	 logic [23:0] square_color;
		
    // Determine which half of the screen we are in
	assign is_left_half = (x < (320 - (SQUARE_WIDTH/2))); // removing the margin

	// Calculate square position within the grid
	assign square_x = is_left_half ? (x / SQUARE_WIDTH) : ((x - (320 - (SQUARE_WIDTH/2))) / SQUARE_WIDTH);
	assign square_y = (480 - y) / SQUARE_HEIGHT;



    // Check if the current pixel is on the border of a square
    assign on_border = ((x % SQUARE_WIDTH) < 2) || ((x % SQUARE_WIDTH) > (SQUARE_WIDTH - 3)) || ((y % SQUARE_HEIGHT) < 2) || ((y % SQUARE_HEIGHT) > (SQUARE_HEIGHT - 3))
	 || ((x > (SQUARE_WIDTH*5)) && (x < (SQUARE_WIDTH*6))) || (y > (SQUARE_HEIGHT*5));

    // Assign colors based on combinational logic
    always_comb begin
        if (on_border)
            square_color = BLACK;
        else if (is_left_half) begin
            // Left half: ships and hits
            case ({matriz_barcos[square_y][square_x], matriz_golpes[square_y][square_x]})
                 4'b0100: square_color = GREY;   // Ship
                 4'bxx01: square_color = YELLOW; // Missed hit
					  4'bxx10: square_color = RED; // Succesfull hit
                 default: square_color = OCEANBLUE; // Default background
            endcase
        end else begin
            // Right half: shots
            case (matriz_disparos[square_y][square_x])
                2'b01: square_color = WHITE;  // Missed shot
                2'b10: square_color = GREEN;  // Successful shot
                default: square_color = OCEANBLUE; // Default background
            endcase
        end
    end

    // Output the final color
    assign r = square_color[23:16];
	 assign g = square_color[15:8];
	 assign b = square_color[7:0];

endmodule
