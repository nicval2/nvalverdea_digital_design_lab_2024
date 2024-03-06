transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/xor_32bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/subtractor_32bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/shiftRight_32bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/shiftLeft_32bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/or_32bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/multiplier_32bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/divider_32bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/and_32bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/alu_32bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/adder_32bit.sv}

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/32bits/alu_32bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_32bit_tb

add wave *
view structure
view signals
run -all
