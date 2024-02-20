module contador_tb();

parameter CLK_PERIOD = 10;

reg clk = 0;
reg reset = 0;
wire [1:0] cont_2;
wire [3:0] cont_4;
wire [5:0] cont_6;

contador #(.N(2)) contador_2 (.clk(clk), .reset(reset), .cont(cont_2));
contador #(.N(4)) contador_4 (.clk(clk), .reset(reset), .cont(cont_4));
contador #(.N(6)) contador_6 (.clk(clk), .reset(reset), .cont(cont_6));

always #CLK_PERIOD clk = ~clk;

initial begin

    reset = 1;
    #20;
    reset = 0;

    #1000;

    $display("Contador de 2 bits: %d", cont_2);
    $display("Contador de 4 bits: %d", cont_4);
    $display("Contador de 6 bits: %d", cont_6);

    $finish;
end

endmodule
