transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {c:/misappsinstaladas/intelfpga_lite/22.1std/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/ram2.v}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/arm.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/controller.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/decoder.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/condlogic.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/condcheck.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/datapath.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/alu.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/adder_n_bit.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/subtractor_n_bit.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/mux2.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/flopr.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/regfile.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/extend.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/flopenr.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/top.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/vga.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/vgaController.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/pll.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/videoGen.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/clockDivider.sv}
vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/chargenrom.sv}

vlog -sv -work work +incdir+C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal {C:/Users/alero/Documents/GitHub/nvalverdea_digital_design_lab_2024/ProyectoFinal/top_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  top_tb

add wave *
view structure
view signals
run -all
