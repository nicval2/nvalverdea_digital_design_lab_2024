module videoGen(
    input logic [9:0] x, y,
    input logic [1:0] matriz_barcos [4:0][4:0],
    input logic [1:0] matriz_golpes [4:0][4:0],
    input logic [1:0] matriz_disparos [4:0][4:0],
	 input logic display_lose,
	 input logic display_win,
    output logic [7:0] r, g, b
);

    // Define colors
    parameter GREY = 24'b100110011001100110011001;   // Grey for ships
    parameter GREEN = 24'b000000001010011001000001;  // Green for successful shot
    parameter YELLOW = 24'b111000111101010000000000; // Yellow for missed shot
    parameter RED = 24'b110100000011000100101101;    // Red for successful hit
    parameter WHITE = 24'b111000111101101011001001;  // White for missed hit
    parameter BLACK = 24'b0;  // Black for borders
    parameter OCEANBLUE = 24'b000000000111011110111110; // Skyblue for default background

	 // Define characters for "YOU LOSE" message
	// Define characters for "YOU LOSE" message
	parameter YOU = 8'b01111001; // Character "Y"
	parameter SPACE = 8'b00000000; // Space character
	parameter LOSE = 8'b01111100; // Character "L"

	 
    // Calculate square width and height
    parameter SQUARE_WIDTH = 640 / 11; //All squares plus 1 for the margin
    parameter SQUARE_HEIGHT = (480-189) / 5; //Para cuadricular
	 
	 int square_x;
	 int square_y;
	 logic is_left_half;
	 logic on_border;
	 logic [23:0] square_color;
	
    // Determine which half of the screen we are in
	 //      Probar sin el Square_width/2
	assign is_left_half = (x < (320-(SQUARE_WIDTH/2))); // removing the margin

	// Calculate square position within the grid
	assign square_x = is_left_half ? (x / SQUARE_WIDTH) : (x / SQUARE_WIDTH)-6;
	assign square_y = y / SQUARE_HEIGHT;

	

    // Check if the current pixel is on the border of a square
    assign on_border = ((x % SQUARE_WIDTH) < 2) || ((x % SQUARE_WIDTH) > (SQUARE_WIDTH - 3)) || ((y % SQUARE_HEIGHT) < 2) || ((y % SQUARE_HEIGHT) > (SQUARE_HEIGHT - 3))
	 || ((x > (SQUARE_WIDTH*5)) && (x < (SQUARE_WIDTH*6))) || (y > (SQUARE_HEIGHT*5));

	 // Module instance for displaying "YOU LOSE" message
	logic pixel_lose;
	you_lose lose_message(
	  .hpos(x),
	  .vpos(y),
	  .pixel(pixel_lose)
	);
	
	logic pixel_win;
	you_win win_message(
	  .hpos(x),
	  .vpos(y),
	  .pixel(pixel_win)
	);
	 
    // Assign colors based on combinational logic
	always_comb begin
	  if (display_lose) begin
		if (pixel_lose)
			square_color = BLACK;
		else
			square_color = RED;
	  end
	  else if (display_win) begin
		if (pixel_win)
			square_color = BLACK;
		else
			square_color = GREEN;
	  end
	  else begin
		 if (on_border)
			square_color = BLACK;
		 else if (is_left_half) begin
			// Left half: ships and hits
			case ({matriz_barcos[4 - square_y][4 - square_x], matriz_golpes[4 - square_y][4 - square_x]})
			  4'b0100: square_color = GREY; // Ship
			  4'b0001: square_color = YELLOW; // Missed hit
			  4'b0110: square_color = RED; // Successful hit
			  default: square_color = OCEANBLUE; // Default background
			endcase
		 end else begin
			// Right half: shots
			case (matriz_disparos[4 - square_y][4 - square_x])
			  2'b01: square_color = WHITE; // Missed shot
			  2'b10: square_color = GREEN; // Successful shot
			  default: square_color = OCEANBLUE; // Default background
			endcase
		 end
	  end
	end

    // Output the final color
    assign r = square_color[23:16];
	 assign g = square_color[15:8];
	 assign b = square_color[7:0];

endmodule
