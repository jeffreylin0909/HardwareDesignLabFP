onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_A_w_opt

do {wave.do}

view wave
view structure
view signals

do {BM_A_w.udo}

run -all

quit -force
