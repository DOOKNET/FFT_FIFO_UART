vlib work
vlib riviera

vlib riviera/fifo_generator_v13_1_3
vlib riviera/xil_defaultlib

vmap fifo_generator_v13_1_3 riviera/fifo_generator_v13_1_3
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work fifo_generator_v13_1_3  -v2k5 \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_3 -93 \
"../../../ipstatic/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_3  -v2k5 \
"../../../ipstatic/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../Design/IP_Core/FIFO/FIFO/sim/FIFO.v" \


vlog -work xil_defaultlib "glbl.v"

