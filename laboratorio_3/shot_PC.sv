module shot_PC(
    input clk, rst,
    output reg [2:0] i,
    output reg [2:0] j
);

reg [2:0] seed_i = 3'b000; // Inicializar la seed i
reg [2:0] seed_j = 3'b001; // Inicializar la seed j

// Señales para almacenar los valores aleatorios generados
reg [2:0] rnd_i;
reg [2:0] rnd_j;

// Instancia módulo random
random random_i(clk, rst, seed_i, rnd_i);
random random_j(clk, rst, seed_j, rnd_j);


always @(posedge clk or negedge rst) begin
    if (!rst) begin
        i <= 3'b000;
        j <= 3'b000;
    end
    else begin
        // Actualizar las seeds para la próxima generación
        seed_i <= rnd_i;
        seed_j <= rnd_j;

        // Asignar las posiciones generadas
        i <= rnd_i;
        j <= rnd_j;
    end
end

endmodule