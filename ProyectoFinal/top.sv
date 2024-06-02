module top (
    input logic clk,
    input logic reset,
    output logic [31:0] WriteData,
    output logic [31:0] DataAdr,
    output logic MemWrite
);
    logic [31:0] PC, Instr, ReadData;

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

    // Instanciar la memoria de instrucciones
    imem imem (
        .a(PC),
        .rd(Instr)
    );

    // Instanciar la memoria de datos (RAM)
    // Conversión para coincidir con el ancho de la memoria de 8 bits
    wire [7:0] ram_read_data;
    
    ram1 ram1_inst (
        .address(DataAdr[4:0]),  // Usando los 5 bits menos significativos para direccionar 32 palabras
        .clock(clk),
        .data(WriteData[7:0]),  // Usando solo 8 bits menos significativos de WriteData
        .wren(MemWrite),
        .q(ram_read_data) // Leyendo solo 8 bits menos significativos a ReadData
    );

    // Extensión de signo para convertir 8 bits a 32 bits en la entrada ReadData del ARM
    assign ReadData = {24'b0, ram_read_data};

endmodule
