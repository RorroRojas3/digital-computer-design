transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/rodrigo/Dropbox/Fall 2017/ece3270/lab4/control/control.vhd}

vcom -93 -work work {/home/rodrigo/Dropbox/Fall 2017/ece3270/lab4/control/simulation/modelsim/control.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  TBControl

add wave *
view structure
view signals
run -all
