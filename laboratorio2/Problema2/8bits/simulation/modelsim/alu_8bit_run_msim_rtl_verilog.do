transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/DigitExtractor.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/adder_8bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/alu_8bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/and_8bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/divider_8bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/multiplier_8bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/or_8bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/segmentOutput.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/shiftLeft_8bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/shiftRight_8bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/subtractor_8bit.sv}
vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/xor_8bit.sv}

vlog -sv -work work +incdir+C:/Users/nicva/8_bits {C:/Users/nicva/8_bits/alu_8bit_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  alu_8bit_tb

add wave *
view structure
view signals
run -all
