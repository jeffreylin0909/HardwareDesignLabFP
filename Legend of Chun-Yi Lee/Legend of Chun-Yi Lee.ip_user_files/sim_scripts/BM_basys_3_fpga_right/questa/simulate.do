onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_basys_3_fpga_right_opt

do {wave.do}

view wave
view structure
view signals

do {BM_basys_3_fpga_right.udo}

run -all

quit -force
