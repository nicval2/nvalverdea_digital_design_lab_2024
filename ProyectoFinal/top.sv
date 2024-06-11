module top(input logic clk, reset, btn,
		input logic [1:0] num,
		output logic [6:0] segs,
		output logic vgaclk, // 25.175 MHz VGA clock
    output logic hsync, vsync,
    output logic sync_b, blank_b, // To monitor & DAC
    output logic [7:0] r, g, b); // To video DAC);

  logic [31:0] PC, Instr, ReadData;
  logic [31:0] WriteData, DataAdr;
  logic MemWrite;
	
	segmentOutput seg(num, segs);
	

	  // State machine for controlling the ARM processor and RAM write
  typedef enum logic {IDLE, RUNNING} state_t;
  state_t current_state, next_state;

  // Additional signal to control the ARM processor's reset
  logic arm_rst;
   logic write_enable_one_shot;

always_ff @(posedge clk or posedge reset) begin
  if (reset) begin
    current_state <= IDLE;
    arm_rst <= 1;
    write_enable_one_shot <= 0;
  end else begin
    current_state <= next_state;
    // Drive arm_rst based on the state
    arm_rst <= (next_state == RUNNING || current_state == RUNNING) ? 0 : 1;
    // Ensure the one-shot signal is only high for one clock cycle during the transition
    write_enable_one_shot <= (current_state == IDLE && next_state == RUNNING);
  end
end

always_comb begin
  next_state = current_state; // Default to stay in the current state
  case (current_state)
    IDLE: begin
      if (!btn) begin // Check if button is pressed (active low)
        next_state = RUNNING;
      end
    end
    RUNNING: begin
      // No need to assign arm_rst here as it's handled in the always_ff block
    end
  endcase
end
  
  // Instantiate processor and memories
  arm arm_inst(
    .clk(clk),
    .reset(arm_rst),
    .PC(PC),
    .Instr(Instr),
    .MemWrite(MemWrite),
    .ALUResult(DataAdr),
    .WriteData(WriteData),
    .ReadData(ReadData)
  );


  // Instantiate ROM
  rom rom_inst(
    .address(PC[10:2]),
    .clock(clk),
    .q(Instr)
  );
  
  vga vga(
		.clk(clk),
		.vgaclk(vgaclk),
		.hsync(hsync),
		.vsync(vsync),
		.sync_b(sync_b),
		.blank_b(blank_b),
		.r(r),
		.g(g),
		.b(b),
		.address(vga_address),
		.data(vga_data)
  );

  // Instantiate RAM
  ram2 ram_inst(
    .address_a(write_enable_one_shot ? 32'd1 : DataAdr[10:2]),
    .clock(clk),
    .data_a(write_enable_one_shot ? 32'd1 : DataAdr[10:2]),
    .wren_a(MemWrite | write_enable_one_shot),
    .q_a(ReadData),
    // Connections for the VGA port will be added here
    .address_b(vga_address), // To be connected to the VGA controller
    .data_b(32'b0), // VGA controller will only read data
    .wren_b(1'b0), // VGA controller will not write data
    .q_b(vga_data) // Data to be displayed by the VGA controller
  );

endmodule