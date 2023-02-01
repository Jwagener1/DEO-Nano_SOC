transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {G:/My Drive/Tuks/2021/EES 424/Practical/Clock.vhd}
vcom -93 -work work {G:/My Drive/Tuks/2021/EES 424/Practical/Bessel.vhd}
vcom -93 -work work {G:/My Drive/Tuks/2021/EES 424/Practical/Prac.vhd}

