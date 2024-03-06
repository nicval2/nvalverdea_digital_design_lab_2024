# Especificación de la frecuencia máxima de operación
create_clock -name clk -period 7 [get_ports {*}]

# Establecer restricciones de tiempo para las señales de entrada
set_input_delay -clock clk -max 2 [get_ports a[*]]
set_input_delay -clock clk -max 2 [get_ports b[*]]
set_input_delay -clock clk -max 2 [get_ports op]
set_input_delay -clock clk -max 2 [get_ports start]

# Establecer restricciones de tiempo para la salida
set_output_delay -clock clk -max 2 [get_ports result]

