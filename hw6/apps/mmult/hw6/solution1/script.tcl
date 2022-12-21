############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project hw6
set_top mmult
add_files fpga/hls/MMult.cpp
add_files fpga/hls/MMult.h
add_files -tb fpga/hls/testbench.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xczu11eg-ffvb1517-1-e}
create_clock -period 6.7 -name default
#source "./hw6/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format xo
