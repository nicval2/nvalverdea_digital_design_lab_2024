transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/alu_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/adder_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/and_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/divider_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/multiplier_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/or_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/shiftLeft_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/shiftRight_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/subtractor_16bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/xor_16bit.sv}

vlog -sv -work work +incdir+C:/Users/nicva/16_bit {C:/Users/nicva/16_bit/alu_16bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_16bit_tb

add wave *
view structure
view signals
run -all
