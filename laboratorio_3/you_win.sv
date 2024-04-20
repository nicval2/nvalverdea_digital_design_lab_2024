module you_win(
    input logic [9:0] hpos, // Horizontal position
    input logic [9:0] vpos, // Vertical position
    output logic pixel // Pixel output
);
    // Define the screen size and message position
    localparam SCREEN_WIDTH = 640; // Example screen width
    localparam SCREEN_HEIGHT = 480; // Example screen height
    localparam ORIG_CHAR_WIDTH = 6; // Original width of a character in the ROM
    localparam ORIG_CHAR_HEIGHT = 6; // Original height of a character in the ROM
    localparam CHAR_WIDTH = 60; // Scaled width of a character
    localparam CHAR_HEIGHT = 60; // Scaled height of a character
    localparam MESSAGE_LENGTH = 8; // Length of the message "YOU LOSE"
    localparam START_X = (SCREEN_WIDTH - MESSAGE_LENGTH * CHAR_WIDTH) / 2; // Center the message horizontally
    localparam START_Y = (SCREEN_HEIGHT - CHAR_HEIGHT) / 2; // Center the message vertically
    localparam SCALE_FACTOR_X = CHAR_WIDTH / ORIG_CHAR_WIDTH; // Scale factor for width
    localparam SCALE_FACTOR_Y = CHAR_HEIGHT / ORIG_CHAR_HEIGHT; // Scale factor for height

    // Calculate the character position
    logic [2:0] xoff, yoff;
    logic [7:0] ch;
    logic pixel_out;

    always_comb begin
        // Calculate offsets within the scaled character cell
        xoff = (hpos % CHAR_WIDTH) / SCALE_FACTOR_X;
        yoff = (vpos % CHAR_HEIGHT) / SCALE_FACTOR_Y;
        // Determine which character to display based on the horizontal position
        if (hpos >= START_X && hpos < START_X + MESSAGE_LENGTH * CHAR_WIDTH && vpos >= START_Y && vpos < START_Y + CHAR_HEIGHT) begin
            case ((hpos - START_X) / CHAR_WIDTH)
               0: ch = "Y"; // ASCII code for 'Y'
					1: ch = "O"; // ASCII code for 'O'
					2: ch = "U"; // ASCII code for 'U'
					3: ch = " "; // ASCII code for space
					4: ch = "W"; // ASCII code for 'L'
					5: ch = "I"; // ASCII code for 'O'
					6: ch = "N"; // ASCII code for 'S'
                default: ch = 8'h20; // Default to space for other positions
            endcase
        end else begin
            ch = 8'h20; // Outside the message area, display space
        end
    end

    // Instantiate the character generator ROM module for the current character
    chargenrom char_gen_rom(
        .ch(ch),
        .xoff(xoff),
        .yoff(yoff),
        .pixel(pixel_out)
    );

    // Output the pixel value
    assign pixel = (hpos >= START_X && hpos < START_X + MESSAGE_LENGTH * CHAR_WIDTH && vpos >= START_Y && vpos < START_Y + CHAR_HEIGHT) ? pixel_out : 0;

endmodule