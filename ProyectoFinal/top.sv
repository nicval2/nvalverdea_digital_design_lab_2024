module top (
    input logic clk,
    input logic reset,
    output logic [31:0] WriteData,
    output logic [31:0] DataAdr,
    output logic MemWrite
);
    logic [31:0] PC, Instr, ReadData;

    // Dummy VGA signals
    logic [7:0] vga_address;
    logic [7:0] vga_data_in;
    logic vga_read_enable;
    logic vga_write_enable;
    logic [7:0] vga_data_out;

    // Instanciar el procesador ARM
    arm arm (
        .clk(clk),
        .reset(reset),
        .PC(PC),
        .Instr(Instr),
        .MemWrite(MemWrite),
        .ALUResult(DataAdr),
        .WriteData(WriteData),
        .ReadData(ReadData)
    );

    // Instanciar la memoria de instrucciones (ROM)
    rom rom_inst (
        .address(PC[8:2]), // Assuming PC is word-addressed
        .clock(clk),
        .q(Instr)
    );

    // Instanciar la memoria de datos (RAM)
    ram ram_inst (
        .address_a(DataAdr[7:2]), // Use appropriate bits for addressing
        .address_b(vga_address),
        .clock(clk),
        .data_a(WriteData), // 32-bit data for writing
        .data_b(vga_data_in), // Dummy VGA data
        .wren_a(MemWrite),
        .wren_b(vga_write_enable),
        .q_a(ReadData),
        .q_b(vga_data_out)
    );

    // Dummy VGA data generation logic
    always @(posedge clk) begin
        if (reset) begin
            // Reset dummy VGA data
            vga_address <= 0;
            vga_data_in <= 0;
            vga_read_enable <= 0;
            vga_write_enable <= 0;
        end else begin
            // Generate dummy VGA data
            vga_address <= vga_address + 1; // Increment address
            vga_data_in <= vga_data_in + 1; // Increment data
            vga_write_enable <= 1; // Enable write for demonstration
            // Add any additional logic needed for dummy data generation
        end
    end

    // Add any additional logic needed for VGA read enable

endmodule