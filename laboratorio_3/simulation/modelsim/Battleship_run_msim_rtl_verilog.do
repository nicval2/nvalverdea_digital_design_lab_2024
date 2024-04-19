transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Admin/OneDrive/Desktop/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/Admin/OneDrive/Desktop/nvalverdea_digital_design_lab_2024/laboratorio_3/random.sv}
vlog -sv -work work +incdir+C:/Users/Admin/OneDrive/Desktop/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/Admin/OneDrive/Desktop/nvalverdea_digital_design_lab_2024/laboratorio_3/shot_PC.sv}

vlog -sv -work work +incdir+C:/Users/Admin/OneDrive/Desktop/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/Admin/OneDrive/Desktop/nvalverdea_digital_design_lab_2024/laboratorio_3/shot_PC_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  shot_PC_tb

add wave *
view structure
view signals
run -all
