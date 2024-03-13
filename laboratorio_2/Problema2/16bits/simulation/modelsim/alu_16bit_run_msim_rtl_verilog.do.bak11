transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/alu_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/adder_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/and_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/divider_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/multiplier_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/or_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/shiftLeft_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/shiftRight_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/subtractor_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/xor_16bit.sv}

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/16bits/alu_16bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_16bit_tb

add wave *
view structure
view signals
run -all
