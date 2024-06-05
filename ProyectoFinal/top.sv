module top(input logic clk, reset,
			output logic vgaclk, // 25.175 MHz VGA clock
    output logic hsync, vsync,
    output logic sync_b, blank_b, // To monitor & DAC
    output logic [7:0] r, g, b); // To video DAC);

  logic [31:0] PC, Instr, ReadData;
  logic [31:0] ram_data_b; // Data for the VGA port on the RAM
  logic [31:0] WriteData, DataAdr;
  logic MemWrite;
  
  // Instantiate processor and memories
  arm arm_inst(
    .clk(clk),
    .reset(reset),
    .PC(PC),
    .Instr(Instr),
    .MemWrite(MemWrite),
    .ALUResult(DataAdr), // ALUResult is used for addressing RAM
    .WriteData(WriteData),
    .ReadData(ReadData)
  );


  // Instantiate ROM
  rom rom_inst(
    .address(PC[11:2]),
    .clock(clk),
    .q(Instr)
  );
  
  vga vga(
		.clk(clk),
		.vgaclk(vgaclk),
		.hsync(hsync),
		.vsync(vsync),
		.syncb(syncb),
		.r(r),
		.g(g),
		.b(b),
		.address(vga_address),
		.data(vga_data)
  );

  // Instantiate RAM
  ram2 ram_inst(
    .address_a(PC[11:2]),
    .clock(clk),
    .data_a(WriteData),
    .wren_a(MemWrite),
    .q_a(ReadData),
    // Connections for the VGA port will be added here
    .address_b(vga_address), // To be connected to the VGA controller
    .data_b(32'b0), // VGA controller will only read data
    .wren_b(1'b0), // VGA controller will not write data
    .q_b(vga_data) // Data to be displayed by the VGA controller
  );

endmodule