onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_W_y_opt

do {wave.do}

view wave
view structure
view signals

do {BM_W_y.udo}

run -all

quit -force
