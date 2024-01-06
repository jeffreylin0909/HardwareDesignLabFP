onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib BM_CS_student_opt

do {wave.do}

view wave
view structure
view signals

do {BM_CS_student.udo}

run -all

quit -force
