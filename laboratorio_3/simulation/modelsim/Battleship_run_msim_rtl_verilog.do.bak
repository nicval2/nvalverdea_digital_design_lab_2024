transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3/vga.sv}
vlog -sv -work work +incdir+C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3/vgaController.sv}
vlog -sv -work work +incdir+C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3/videoGen.sv}
vlog -sv -work work +incdir+C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3/pll.sv}
vlog -sv -work work +incdir+C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3/Battleship.sv}
vlog -sv -work work +incdir+C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3/contar_unos_operador.sv}
vlog -sv -work work +incdir+C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3 {C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3/movement.sv}

vlog -sv -work work +incdir+C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3/output_files {C:/Users/nicva/nvalverdea_digital_design_lab_2024/laboratorio_3/output_files/tb_contador.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_contador

add wave *
view structure
view signals
run -all
