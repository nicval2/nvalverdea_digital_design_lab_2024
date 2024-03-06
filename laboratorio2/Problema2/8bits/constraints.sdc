#crea una señal del reloj
create_clock -period 7 -name clk [get_ports {*}]

#Limita el tiempo máximo de retardo desde cualquier entrada hasta cualquier salida a 5 unidades de tiempo
set_max_delay -from [all_inputs] -to [all_outputs] 5

create_clock -period 10 [get_ports {clk}]

#establece el tiempo máximo de retardo de entrada a salida en 5 unidades de tiempo
set_max_delay -from [all_inputs] -to [all_outputs] 5

#establece un retardo mínimo para la señal de entrada "start" 
set_input_delay -clock clk -min 2 [get_ports {start}]

#establece un retardo máximo para la señal de entrada "start"
set_input_delay -clock clk -max 2 [get_ports {start}]
