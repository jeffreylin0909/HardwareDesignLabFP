onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+BM_basys_3_fpga_down -L xpm -L blk_mem_gen_v8_4_4 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.BM_basys_3_fpga_down xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {BM_basys_3_fpga_down.udo}

run -all

endsim

quit -force
