module contadorFPGA_tb;

    parameter CLK_PERIOD = 10;

    reg clk;
    reg reset;
    reg dec_btn;
    wire [6:0] seg;
	 
    contadorFPGA uut (
        .clk(clk),
        .reset(reset),
        .dec_btn(dec_btn),
        .seg(seg)
    );

    // Generación de señal de reloj
    always #((CLK_PERIOD/2)) clk = ~clk;

    initial begin
        clk = 0;
        reset = 0;
        dec_btn = 0;

        #100;

        reset = 1;

        #((CLK_PERIOD/2));

        reset = 0;

        #100;

        dec_btn = 1;
        #50;
        dec_btn = 0;

        #100;

        $finish;
    end

endmodule



