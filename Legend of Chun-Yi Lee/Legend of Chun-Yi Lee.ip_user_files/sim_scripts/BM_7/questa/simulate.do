onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_7_opt

do {wave.do}

view wave
view structure
view signals

do {BM_7.udo}

run -all

quit -force
