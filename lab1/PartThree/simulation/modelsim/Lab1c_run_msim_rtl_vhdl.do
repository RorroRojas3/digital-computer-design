transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/rodrigo/Dropbox/Fall 2017/ece3270/Lab 1/PartThree/Lab1c.vhd}

vcom -93 -work work {/home/rodrigo/Dropbox/Fall 2017/ece3270/Lab 1/PartThree/simulation/modelsim/Lab1c.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  TB1c

add wave *
view structure
view signals
run -all
