transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/adder_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/subtractor_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/alu_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/multiplier_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/DigitExtractor.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/segmentOutput.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/divider_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/and_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/or_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/xor_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/shiftLeft_4bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/shiftRight_4bit.sv}

vlog -sv -work work +incdir+C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1 {C:/Users/nicva/PycharmProjects/nvalverdea_digital_design_lab_202411/laboratorio_2/Problema1/alu_4bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_4bit_tb

add wave *
view structure
view signals
run -all
