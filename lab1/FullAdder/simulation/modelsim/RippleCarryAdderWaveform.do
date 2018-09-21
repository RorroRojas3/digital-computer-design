onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /fourbitfulladder/SW
add wave -noupdate /fourbitfulladder/Carry0
add wave -noupdate /fourbitfulladder/Carry1
add wave -noupdate /fourbitfulladder/Carry2
add wave -noupdate /fourbitfulladder/tempCout
add wave -noupdate /fourbitfulladder/tempS3
add wave -noupdate /fourbitfulladder/tempS2
add wave -noupdate /fourbitfulladder/tempS1
add wave -noupdate /fourbitfulladder/tempS0
add wave -noupdate /fourbitfulladder/Cout
add wave -noupdate /fourbitfulladder/S3
add wave -noupdate /fourbitfulladder/S2
add wave -noupdate /fourbitfulladder/S1
add wave -noupdate /fourbitfulladder/S0
add wave -noupdate /fourbitfulladder/SWLEDS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1200 ps}
