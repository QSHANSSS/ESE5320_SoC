// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Filter_HW_stream_compute (
        input_stream_dout,
        input_stream_empty_n,
        input_stream_read,
        output_stream_din,
        output_stream_full_n,
        output_stream_write,
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_ready,
        ap_idle,
        ap_continue
);


input  [7:0] input_stream_dout;
input   input_stream_empty_n;
output   input_stream_read;
output  [7:0] output_stream_din;
input   output_stream_full_n;
output   output_stream_write;
input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_ready;
output   ap_idle;
input   ap_continue;

wire    Filter_horizontal_HW_stream_U0_ap_start;
wire    Filter_horizontal_HW_stream_U0_ap_done;
wire    Filter_horizontal_HW_stream_U0_ap_continue;
wire    Filter_horizontal_HW_stream_U0_ap_idle;
wire    Filter_horizontal_HW_stream_U0_ap_ready;
wire    Filter_horizontal_HW_stream_U0_start_out;
wire    Filter_horizontal_HW_stream_U0_start_write;
wire    Filter_horizontal_HW_stream_U0_input_stream_read;
wire   [7:0] Filter_horizontal_HW_stream_U0_temp_stream_din;
wire    Filter_horizontal_HW_stream_U0_temp_stream_write;
wire    Filter_vertical_HW_stream_U0_ap_start;
wire    Filter_vertical_HW_stream_U0_ap_done;
wire    Filter_vertical_HW_stream_U0_ap_continue;
wire    Filter_vertical_HW_stream_U0_ap_idle;
wire    Filter_vertical_HW_stream_U0_ap_ready;
wire   [7:0] Filter_vertical_HW_stream_U0_output_stream_din;
wire    Filter_vertical_HW_stream_U0_output_stream_write;
wire    Filter_vertical_HW_stream_U0_temp_stream_read;
wire    ap_sync_continue;
wire    temp_stream_full_n;
wire   [7:0] temp_stream_dout;
wire    temp_stream_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
wire   [0:0] start_for_Filter_vertical_HW_stream_U0_din;
wire    start_for_Filter_vertical_HW_stream_U0_full_n;
wire   [0:0] start_for_Filter_vertical_HW_stream_U0_dout;
wire    start_for_Filter_vertical_HW_stream_U0_empty_n;
wire    Filter_vertical_HW_stream_U0_start_full_n;
wire    Filter_vertical_HW_stream_U0_start_write;

Filter_HW_stream_Filter_horizontal_HW_stream Filter_horizontal_HW_stream_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Filter_horizontal_HW_stream_U0_ap_start),
    .start_full_n(start_for_Filter_vertical_HW_stream_U0_full_n),
    .ap_done(Filter_horizontal_HW_stream_U0_ap_done),
    .ap_continue(Filter_horizontal_HW_stream_U0_ap_continue),
    .ap_idle(Filter_horizontal_HW_stream_U0_ap_idle),
    .ap_ready(Filter_horizontal_HW_stream_U0_ap_ready),
    .start_out(Filter_horizontal_HW_stream_U0_start_out),
    .start_write(Filter_horizontal_HW_stream_U0_start_write),
    .input_stream_dout(input_stream_dout),
    .input_stream_empty_n(input_stream_empty_n),
    .input_stream_read(Filter_horizontal_HW_stream_U0_input_stream_read),
    .temp_stream_din(Filter_horizontal_HW_stream_U0_temp_stream_din),
    .temp_stream_full_n(temp_stream_full_n),
    .temp_stream_write(Filter_horizontal_HW_stream_U0_temp_stream_write)
);

Filter_HW_stream_Filter_vertical_HW_stream Filter_vertical_HW_stream_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(Filter_vertical_HW_stream_U0_ap_start),
    .ap_done(Filter_vertical_HW_stream_U0_ap_done),
    .ap_continue(Filter_vertical_HW_stream_U0_ap_continue),
    .ap_idle(Filter_vertical_HW_stream_U0_ap_idle),
    .ap_ready(Filter_vertical_HW_stream_U0_ap_ready),
    .output_stream_din(Filter_vertical_HW_stream_U0_output_stream_din),
    .output_stream_full_n(output_stream_full_n),
    .output_stream_write(Filter_vertical_HW_stream_U0_output_stream_write),
    .temp_stream_dout(temp_stream_dout),
    .temp_stream_empty_n(temp_stream_empty_n),
    .temp_stream_read(Filter_vertical_HW_stream_U0_temp_stream_read)
);

Filter_HW_stream_fifo_w8_d2_S temp_stream_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Filter_horizontal_HW_stream_U0_temp_stream_din),
    .if_full_n(temp_stream_full_n),
    .if_write(Filter_horizontal_HW_stream_U0_temp_stream_write),
    .if_dout(temp_stream_dout),
    .if_empty_n(temp_stream_empty_n),
    .if_read(Filter_vertical_HW_stream_U0_temp_stream_read)
);

Filter_HW_stream_start_for_Filter_vertical_HW_stream_U0 start_for_Filter_vertical_HW_stream_U0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_Filter_vertical_HW_stream_U0_din),
    .if_full_n(start_for_Filter_vertical_HW_stream_U0_full_n),
    .if_write(Filter_horizontal_HW_stream_U0_start_write),
    .if_dout(start_for_Filter_vertical_HW_stream_U0_dout),
    .if_empty_n(start_for_Filter_vertical_HW_stream_U0_empty_n),
    .if_read(Filter_vertical_HW_stream_U0_ap_ready)
);

assign Filter_horizontal_HW_stream_U0_ap_continue = 1'b1;

assign Filter_horizontal_HW_stream_U0_ap_start = ap_start;

assign Filter_vertical_HW_stream_U0_ap_continue = ap_continue;

assign Filter_vertical_HW_stream_U0_ap_start = start_for_Filter_vertical_HW_stream_U0_empty_n;

assign Filter_vertical_HW_stream_U0_start_full_n = 1'b1;

assign Filter_vertical_HW_stream_U0_start_write = 1'b0;

assign ap_done = Filter_vertical_HW_stream_U0_ap_done;

assign ap_idle = (Filter_vertical_HW_stream_U0_ap_idle & Filter_horizontal_HW_stream_U0_ap_idle);

assign ap_ready = Filter_horizontal_HW_stream_U0_ap_ready;

assign ap_sync_continue = ap_continue;

assign ap_sync_done = Filter_vertical_HW_stream_U0_ap_done;

assign ap_sync_ready = Filter_horizontal_HW_stream_U0_ap_ready;

assign input_stream_read = Filter_horizontal_HW_stream_U0_input_stream_read;

assign output_stream_din = Filter_vertical_HW_stream_U0_output_stream_din;

assign output_stream_write = Filter_vertical_HW_stream_U0_output_stream_write;

assign start_for_Filter_vertical_HW_stream_U0_din = 1'b1;

endmodule //Filter_HW_stream_compute
