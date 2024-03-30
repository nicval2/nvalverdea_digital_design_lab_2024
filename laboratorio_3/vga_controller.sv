module vga_controller (
    input wire clock,
    input wire reset,
    input wire [4:0] matriz_barcos [4:0],
    input wire [4:0] matriz_disparos [4:0],
    input wire [4:0] matriz_golpes [4:0],
    input wire turno_activo,
    input wire screen_ganar,
    input wire screen_perder,
    output wire hsync,
    output wire vsync,
    output reg [7:0] red,
    output reg [7:0] green,
    output reg [7:0] blue
);

    // Resolución VGA 640x480
    parameter H_ACTIVE = 640;
    parameter V_ACTIVE = 480;

    // Registros para coordenadas x, y
    reg [9:0] x_coord, y_coord;

    // Constantes para el tamaño y espaciado de los cuadrados
    parameter SQUARE_SIZE = 40;
    parameter SQUARE_SPACING = 10;

    // Colores
    parameter SKY_BLUE = 24'h87CEEB;
    parameter BLACK = 24'h000000;
    parameter RED = 24'hFF0000;
    parameter GREEN = 24'h00FF00;
    parameter YELLOW = 24'hFFFF00;

    // Instancia del módulo vga_driver
    vga_driver vga_driver_inst (
        .clock(clock),
        .reset(reset),
        .color_in({red, green, blue}),
        .next_x(x_coord),
        .next_y(y_coord),
        .hsync(hsync),
        .vsync(vsync),
        .red(red),
        .green(green),
        .blue(blue)
    );

    // Lógica para dibujar el fondo, la matriz de cuadrados y los estados de juego
    always @(posedge clock) begin
        if (reset) begin
            red <= 8'd135;
            green <= 8'd206;
            blue <= 8'd235;
        end else if (screen_ganar) begin
            // Pantalla de ganador
            red <= GREEN[23:16];
            green <= GREEN[15:8];
            blue <= GREEN[7:0];
        end else if (screen_perder) begin
            // Pantalla de perdedor
            red <= RED[23:16];
            green <= RED[15:8];
            blue <= RED[7:0];
        end else begin
            red <= SKY_BLUE[23:16];
            green <= SKY_BLUE[15:8];
            blue <= SKY_BLUE[7:0];

            // Dibujar cuadrados en una matriz 5x5
            for (int i = 0; i < 5; i = i + 1) begin
                for (int j = 0; j < 5; j = j + 1) begin
                    if (matriz_barcos[i][j]) begin
                        // Dibujar barco
                        red <= BLACK[23:16];
                        green <= BLACK[15:8];
                        blue <= BLACK[7:0];
                    end else if (matriz_disparos[i][j] == 2) begin
                        // Disparo exitoso
                        red <= RED[23:16];
                        green <= RED[15:8];
                        blue <= RED[7:0];
                    end else if (matriz_disparos[i][j] == 1) begin
                        // Disparo fallido
                        red <= YELLOW[23:16];
                        green <= YELLOW[15:8];
                        blue <= YELLOW[7:0];
                    end else if (matriz_golpes[i][j] == 2) begin
                        // Golpe exitoso
                        red <= GREEN[23:16];
                        green <= GREEN[15:8];
                        blue <= GREEN[7:0];
                    end else if (matriz_golpes[i][j] == 1) begin
                        // Golpe fallido
                        red <= YELLOW[23:16];
                        green <= YELLOW[15:8];
                        blue <= YELLOW[7:0];
                    end else begin
                         //Cuadro vacio
                         red <= SKY_BLUE[23:16];
                         green <= SKY_BLUE[15:8];
                         blue <= SKY_BLUE[7:0];
                    end
                end
            end
        end
    end

endmodule