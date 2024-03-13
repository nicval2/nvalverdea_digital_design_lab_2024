transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/nicva/Desktop/Taller_de_Diseño_Digital/Sumador_completo_4bit/Sumador_4bit.vhd}
vcom -93 -work work {C:/Users/nicva/Desktop/Taller_de_Diseño_Digital/Sumador_completo_4bit/Sumador_completo_1bit.vhd}

