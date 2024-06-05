module chargenrom(
    input logic [7:0] ch,
    input logic [2:0] xoff, yoff,
    output logic pixel
);
    // Each character is 6x6 bits, so for 26 characters plus space, we need an array of 27*6 lines
    logic [5:0] charrom[27*6-1:0]; // character generator ROM, 6 bits wide for 26 characters plus space

    initial
        $readmemb("charrom.txt", charrom);

    // Index into ROM to find line of character
    // ASCII codes for 'A' to 'Z' are 65 to 90, which map to indices 0 to 25
    // ASCII code for space (32) maps to the last index (26)
    logic [5:0] line;
    always_comb begin
        if (ch == 32) begin
            // Space character
            line = charrom[26 * 6 + yoff];
        end else if (ch >= 65 && ch <= 90) begin
            // Characters 'A' to 'Z'
            line = charrom[(ch - 65) * 6 + yoff];
        end else begin
            // Invalid character, default to all zeros
            line = 6'b000000;
        end
    end

    // Reverse order of bits if needed and extract the pixel
    // Check if xoff is within the 6-bit range
    assign pixel = (xoff < 6) ? line[5 - xoff] : 0;
endmodule