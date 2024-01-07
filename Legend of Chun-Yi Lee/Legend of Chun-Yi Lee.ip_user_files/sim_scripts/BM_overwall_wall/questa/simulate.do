onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_overwall_wall_opt

do {wave.do}

view wave
view structure
view signals

do {BM_overwall_wall.udo}

run -all

quit -force
