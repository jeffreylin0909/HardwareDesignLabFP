onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_computer_room_entrance_opt

do {wave.do}

view wave
view structure
view signals

do {BM_computer_room_entrance.udo}

run -all

quit -force
