module videoGen(
    input logic [9:0] x, y,
    output logic [7:0] r, g, b,
    output logic [8:0] address,
    input logic [31:0] data
);

    // Character dimensions
    localparam CHAR_WIDTH = 8;
    localparam CHAR_HEIGHT = 16;
    localparam CHARS_PER_LINE = 640 / CHAR_WIDTH; // 80 characters
    localparam LINES_PER_SCREEN = 480 / CHAR_HEIGHT; // 30 lines

    // Declare char_x and char_y as variables
    int char_x;
    int char_y;
	 logic [2:0] xoff; // 3 bits for x offset
	logic [2:0] yoff; // 3 bits for y offset

    // Calculate character position based on pixel coordinates
    always_comb begin
        char_x = x / CHAR_WIDTH;
        char_y = y / CHAR_HEIGHT;
		  xoff = x % CHAR_WIDTH;
		  yoff = y % CHAR_HEIGHT;
    end

    // Calculate RAM address based on character position
    // Assuming each address in RAM holds 4 characters (32 bits)
    always_comb begin
        address = char_y * (CHARS_PER_LINE / 4) + (char_x / 4);
    end

    // Extract the character to display from the 32-bit word
    // Each character is 8 bits, so we need to select the correct 8 bits based on the x coordinate
    logic [7:0] character;
    always_comb begin
        case (x % 32)
            0: character = data[31:24];
            8: character = data[23:16];
            16: character = data[15:8];
            24: character = data[7:0];
            default: character = 8'h20; // Space character for padding
        endcase
    end

    // Instantiate the character generator ROM module for the current character

	logic pixel;      // 1 bit for pixel
    chargenrom char_gen_rom(
        .ch(character),
        .xoff(xoff),
        .yoff(yoff),
        .pixel(pixel)
    );

    // Output the final color (assuming monochrome text for simplicity)
    assign r = pixel ? 8'hFF : 8'h00;
    assign g = pixel ? 8'hFF : 8'h00;
    assign b = pixel ? 8'hFF : 8'h00;

endmodule