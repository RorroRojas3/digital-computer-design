transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/FullAdder/FourBitFullAdder.vhd}
vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/FullAdder/FullAdder.vhd}

vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/FullAdder/simulation/modelsim/FourBitFullAdder.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
