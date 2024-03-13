transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/alu_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/adder_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/and_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/divider_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/multiplier_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/or_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/shiftLeft_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/shiftRight_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/subtractor_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/xor_2bit.sv}

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_20242222/laboratorio2/Problema2/2bits/alu_2bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_2bit_tb

add wave *
view structure
view signals
run -all
