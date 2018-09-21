transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/Part3/PartThree.vhd}
vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/Part3/FourBitBinary.vhd}
vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/Part3/FourBitDisplay.vhd}
vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/Part3/FourBitFullAdder.vhd}
vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/Part3/FullAdder.vhd}
vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/Part3/FiveBitBinary.vhd}
vcom -93 -work work {D:/Dropbox/Fall 2017/ece3270/Lab 1/Part3/FiveBitDisplay.vhd}

