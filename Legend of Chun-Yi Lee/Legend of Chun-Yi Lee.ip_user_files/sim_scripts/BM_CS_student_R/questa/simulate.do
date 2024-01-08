onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_CS_student_R_opt

do {wave.do}

view wave
view structure
view signals

do {BM_CS_student_R.udo}

run -all

quit -force
