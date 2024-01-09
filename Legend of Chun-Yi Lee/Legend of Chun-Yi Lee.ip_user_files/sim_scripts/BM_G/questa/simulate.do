onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_G_opt

do {wave.do}

view wave
view structure
view signals

do {BM_G.udo}

run -all

quit -force
