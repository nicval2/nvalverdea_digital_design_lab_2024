transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/adder_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/subtractor_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/alu_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/multiplier_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/and_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/divider_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/or_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/shiftLeft_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/shiftRight_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/xor_4bit.sv}

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/4bits/alu_4bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_4bit_tb

add wave *
view structure
view signals
run -all
