onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_S_w_opt

do {wave.do}

view wave
view structure
view signals

do {BM_S_w.udo}

run -all

quit -force
