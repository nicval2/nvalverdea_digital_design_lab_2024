transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/alu_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/adder_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/and_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/divider_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/multiplier_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/or_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/shiftLeft_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/shiftRight_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/subtractor_2bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/xor_2bit.sv}

vlog -sv -work work +incdir+C:/Users/nicva/2_bit {C:/Users/nicva/2_bit/alu_2bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_2bit_tb

add wave *
view structure
view signals
run -all
