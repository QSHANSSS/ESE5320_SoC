############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project lzw_final
set_top encoding
add_files ../LZW.cpp
add_files -tb ../testbench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vitis
set_part {xczu3eg-sbva484-1-i}
create_clock -period 6.67 -name default
config_rtl -register_reset_num 3
config_interface -m_axi_alignment_byte_size 64 -m_axi_latency 64 -m_axi_max_widen_bitwidth 512 -m_axi_offset slave
config_export -format xo -rtl verilog
source "./lzw_final/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format xo
