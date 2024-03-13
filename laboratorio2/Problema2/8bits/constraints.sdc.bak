create_clock -period 7 -name clk [get_ports {*}]

# Constraint for the maximum frequency of the ALU
set_max_delay -from [all_inputs] -to [all_outputs] <max_delay_value>

# Example: Assuming a clock period of 10 ns (100 MHz) for the ALU
create_clock -period 10 [get_ports {clk}]
set_max_delay -from [all_inputs] -to [all_outputs] 5

# Constraint for the start signal setup time
set_input_delay -clock clk -min 2 [get_ports {start}]

# Constraint for the start signal hold time
set_input_delay -clock clk -max 2 [get_ports {start}]
