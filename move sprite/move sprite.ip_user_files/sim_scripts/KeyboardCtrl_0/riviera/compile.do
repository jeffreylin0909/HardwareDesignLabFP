vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -sv2k12 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../move sprite.gen/sources_1/ip/KeyboardCtrl_0/src/Ps2Interface.v" \
"../../../../move sprite.gen/sources_1/ip/KeyboardCtrl_0/src/KeyboardCtrl.v" \
"../../../../move sprite.gen/sources_1/ip/KeyboardCtrl_0/sim/KeyboardCtrl_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

