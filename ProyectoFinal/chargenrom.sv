module chargenrom (
    input logic clk,
    input logic [7:0] ch,
    input logic [2:0] xoff, yoff,
    output logic pixel
);

    // ROM storing character data
    logic [7:0] charrom[255:0];

    // Logic to address the ROM
    logic [9:0] address = 0;

    // Read data from ROM
    always_ff @(posedge clk) begin
        pixel <= charrom[address][xoff];
    end

    // Initial block to load ROM contents
    initial begin
    $readmemb("charrom.txt", charrom);
end

    // Logic to calculate ROM address
    always_comb begin
        address = (ch << 3) + yoff;
    end

endmodule
