onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_basys_3_fpga_down_opt

do {wave.do}

view wave
view structure
view signals

do {BM_basys_3_fpga_down.udo}

run -all

quit -force
