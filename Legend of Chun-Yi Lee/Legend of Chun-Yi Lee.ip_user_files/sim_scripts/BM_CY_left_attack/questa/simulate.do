onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_CY_left_attack_opt

do {wave.do}

view wave
view structure
view signals

do {BM_CY_left_attack.udo}

run -all

quit -force
