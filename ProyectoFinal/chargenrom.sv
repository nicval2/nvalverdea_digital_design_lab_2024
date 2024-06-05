module chargenrom(
  input logic [7:0] ch,
  input logic [2:0] xoff, yoff,
  output logic pixel
);
  // Each character is 6x6 bits, so for 62 characters (26 uppercase, 26 lowercase, 10 special), we need an array of 62*6 lines
  logic [5:0] charrom[62*6-1:0]; // character generator ROM, 6 bits wide for characters

  initial
    $readmemb("charrom.txt", charrom);

  // Index into ROM to find line of character
  // ASCII codes for 'A' to 'Z' are 65 to 90, which map to indices 0 to 25
  // ASCII codes for 'a' to 'z' are 97 to 122, which map to indices 26 to 51
  // ASCII codes for special characters (!@#$%&*) are 33, 64, 35, 36, 37, 38, 42, which map to indices 52 to 61
  logic [5:0] line;
  always_comb begin
    if (ch >= 65 && ch <= 90) begin
      // Characters 'A' to 'Z'
      line = charrom[(ch - 65) * 6 + yoff];
    end else if (ch >= 97 && ch <= 122) begin
      // Characters 'a' to 'z'
      line = charrom[(ch - 97 + 26) * 6 + yoff];
    end else if (ch == 33 || ch == 64 || ch == 35 || ch == 36 || ch == 37 || ch == 38 || ch == 42) begin
      // Special characters (!@#$%&*)
      line = charrom[(ch == 33 ? 52 : ch == 64 ? 53 : ch == 35 ? 54 : ch == 36 ? 55 : ch == 37 ? 56 : ch == 38 ? 57 : 58) * 6 + yoff];
    end else if (ch == 32) begin
      // Space character
      line = charrom[62 * 6 + yoff];
    end else begin
      // Invalid character, default to all zeros
      line = 6'b000000;
    end
  end

  // Reverse order of bits if needed and extract the pixel
  // Check if xoff is within the 6-bit range
  assign pixel = (xoff < 6) ? line[5 - xoff] : 0;
endmodule