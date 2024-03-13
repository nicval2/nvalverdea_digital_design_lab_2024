# Especificación de la frecuencia de reloj
create_clock -name clk -period 7 [get_ports {*}]

# Establecer restricciones de tiempo
set_input_delay -clock clk -max 3 [get_ports {a[*]}]
set_input_delay -clock clk -max 3 [get_ports {b[*]}]
set_input_delay -clock clk -max 3 [get_ports {op}]
set_input_delay -clock clk -max 3 [get_ports {start}]


# Establecer restricciones de tiempo para la salida
set_output_delay -clock clk -max 2 [get_ports result]
set_output_delay -clock clk -max 2 [get_ports NFlag]
set_output_delay -clock clk -max 2 [get_ports ZFlag]
set_output_delay -clock clk -max 2 [get_ports CFlag]
set_output_delay -clock clk -max 2 [get_ports VFlag]
