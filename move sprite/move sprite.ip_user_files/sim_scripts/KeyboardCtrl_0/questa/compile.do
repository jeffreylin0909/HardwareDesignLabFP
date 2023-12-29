vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -sv \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  \
"../../../../move sprite.gen/sources_1/ip/KeyboardCtrl_0/src/Ps2Interface.v" \
"../../../../move sprite.gen/sources_1/ip/KeyboardCtrl_0/src/KeyboardCtrl.v" \
"../../../../move sprite.gen/sources_1/ip/KeyboardCtrl_0/sim/KeyboardCtrl_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

