onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_Y_y_opt

do {wave.do}

view wave
view structure
view signals

do {BM_Y_y.udo}

run -all

quit -force
