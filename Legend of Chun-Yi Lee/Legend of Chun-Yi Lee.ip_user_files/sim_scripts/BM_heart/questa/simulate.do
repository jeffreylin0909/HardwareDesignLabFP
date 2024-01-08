onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_heart_opt

do {wave.do}

view wave
view structure
view signals

do {BM_heart.udo}

run -all

quit -force
