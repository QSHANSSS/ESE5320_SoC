// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="Filter_HW_stream_Filter_HW_stream,hls_ip_2020_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu3eg-sbva484-1-i,HLS_INPUT_CLOCK=6.670000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=4.869100,HLS_SYN_LAT=131025,HLS_SYN_TPT=130952,HLS_SYN_MEM=44,HLS_SYN_DSP=0,HLS_SYN_FF=5130,HLS_SYN_LUT=5384,HLS_VERSION=2020_2}" *)

module Filter_HW_stream (
        s_axi_control_AWVALID,
        s_axi_control_AWREADY,
        s_axi_control_AWADDR,
        s_axi_control_WVALID,
        s_axi_control_WREADY,
        s_axi_control_WDATA,
        s_axi_control_WSTRB,
        s_axi_control_ARVALID,
        s_axi_control_ARREADY,
        s_axi_control_ARADDR,
        s_axi_control_RVALID,
        s_axi_control_RREADY,
        s_axi_control_RDATA,
        s_axi_control_RRESP,
        s_axi_control_BVALID,
        s_axi_control_BREADY,
        s_axi_control_BRESP,
        ap_clk,
        ap_rst_n,
        interrupt,
        m_axi_p0_AWVALID,
        m_axi_p0_AWREADY,
        m_axi_p0_AWADDR,
        m_axi_p0_AWID,
        m_axi_p0_AWLEN,
        m_axi_p0_AWSIZE,
        m_axi_p0_AWBURST,
        m_axi_p0_AWLOCK,
        m_axi_p0_AWCACHE,
        m_axi_p0_AWPROT,
        m_axi_p0_AWQOS,
        m_axi_p0_AWREGION,
        m_axi_p0_AWUSER,
        m_axi_p0_WVALID,
        m_axi_p0_WREADY,
        m_axi_p0_WDATA,
        m_axi_p0_WSTRB,
        m_axi_p0_WLAST,
        m_axi_p0_WID,
        m_axi_p0_WUSER,
        m_axi_p0_ARVALID,
        m_axi_p0_ARREADY,
        m_axi_p0_ARADDR,
        m_axi_p0_ARID,
        m_axi_p0_ARLEN,
        m_axi_p0_ARSIZE,
        m_axi_p0_ARBURST,
        m_axi_p0_ARLOCK,
        m_axi_p0_ARCACHE,
        m_axi_p0_ARPROT,
        m_axi_p0_ARQOS,
        m_axi_p0_ARREGION,
        m_axi_p0_ARUSER,
        m_axi_p0_RVALID,
        m_axi_p0_RREADY,
        m_axi_p0_RDATA,
        m_axi_p0_RLAST,
        m_axi_p0_RID,
        m_axi_p0_RUSER,
        m_axi_p0_RRESP,
        m_axi_p0_BVALID,
        m_axi_p0_BREADY,
        m_axi_p0_BRESP,
        m_axi_p0_BID,
        m_axi_p0_BUSER,
        m_axi_p1_AWVALID,
        m_axi_p1_AWREADY,
        m_axi_p1_AWADDR,
        m_axi_p1_AWID,
        m_axi_p1_AWLEN,
        m_axi_p1_AWSIZE,
        m_axi_p1_AWBURST,
        m_axi_p1_AWLOCK,
        m_axi_p1_AWCACHE,
        m_axi_p1_AWPROT,
        m_axi_p1_AWQOS,
        m_axi_p1_AWREGION,
        m_axi_p1_AWUSER,
        m_axi_p1_WVALID,
        m_axi_p1_WREADY,
        m_axi_p1_WDATA,
        m_axi_p1_WSTRB,
        m_axi_p1_WLAST,
        m_axi_p1_WID,
        m_axi_p1_WUSER,
        m_axi_p1_ARVALID,
        m_axi_p1_ARREADY,
        m_axi_p1_ARADDR,
        m_axi_p1_ARID,
        m_axi_p1_ARLEN,
        m_axi_p1_ARSIZE,
        m_axi_p1_ARBURST,
        m_axi_p1_ARLOCK,
        m_axi_p1_ARCACHE,
        m_axi_p1_ARPROT,
        m_axi_p1_ARQOS,
        m_axi_p1_ARREGION,
        m_axi_p1_ARUSER,
        m_axi_p1_RVALID,
        m_axi_p1_RREADY,
        m_axi_p1_RDATA,
        m_axi_p1_RLAST,
        m_axi_p1_RID,
        m_axi_p1_RUSER,
        m_axi_p1_RRESP,
        m_axi_p1_BVALID,
        m_axi_p1_BREADY,
        m_axi_p1_BRESP,
        m_axi_p1_BID,
        m_axi_p1_BUSER
);

parameter    C_S_AXI_CONTROL_DATA_WIDTH = 32;
parameter    C_S_AXI_CONTROL_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    C_S_AXI_ADDR_WIDTH = 32;
parameter    C_M_AXI_P0_ID_WIDTH = 1;
parameter    C_M_AXI_P0_ADDR_WIDTH = 64;
parameter    C_M_AXI_P0_DATA_WIDTH = 512;
parameter    C_M_AXI_P0_AWUSER_WIDTH = 1;
parameter    C_M_AXI_P0_ARUSER_WIDTH = 1;
parameter    C_M_AXI_P0_WUSER_WIDTH = 1;
parameter    C_M_AXI_P0_RUSER_WIDTH = 1;
parameter    C_M_AXI_P0_BUSER_WIDTH = 1;
parameter    C_M_AXI_P0_USER_VALUE = 0;
parameter    C_M_AXI_P0_PROT_VALUE = 0;
parameter    C_M_AXI_P0_CACHE_VALUE = 3;
parameter    C_M_AXI_ID_WIDTH = 1;
parameter    C_M_AXI_ADDR_WIDTH = 64;
parameter    C_M_AXI_DATA_WIDTH = 32;
parameter    C_M_AXI_AWUSER_WIDTH = 1;
parameter    C_M_AXI_ARUSER_WIDTH = 1;
parameter    C_M_AXI_WUSER_WIDTH = 1;
parameter    C_M_AXI_RUSER_WIDTH = 1;
parameter    C_M_AXI_BUSER_WIDTH = 1;
parameter    C_M_AXI_P1_ID_WIDTH = 1;
parameter    C_M_AXI_P1_ADDR_WIDTH = 64;
parameter    C_M_AXI_P1_DATA_WIDTH = 128;
parameter    C_M_AXI_P1_AWUSER_WIDTH = 1;
parameter    C_M_AXI_P1_ARUSER_WIDTH = 1;
parameter    C_M_AXI_P1_WUSER_WIDTH = 1;
parameter    C_M_AXI_P1_RUSER_WIDTH = 1;
parameter    C_M_AXI_P1_BUSER_WIDTH = 1;
parameter    C_M_AXI_P1_USER_VALUE = 0;
parameter    C_M_AXI_P1_PROT_VALUE = 0;
parameter    C_M_AXI_P1_CACHE_VALUE = 3;

parameter C_S_AXI_CONTROL_WSTRB_WIDTH = (32 / 8);
parameter C_S_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_P0_WSTRB_WIDTH = (512 / 8);
parameter C_M_AXI_WSTRB_WIDTH = (32 / 8);
parameter C_M_AXI_P1_WSTRB_WIDTH = (128 / 8);

input   s_axi_control_AWVALID;
output   s_axi_control_AWREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_AWADDR;
input   s_axi_control_WVALID;
output   s_axi_control_WREADY;
input  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_WDATA;
input  [C_S_AXI_CONTROL_WSTRB_WIDTH - 1:0] s_axi_control_WSTRB;
input   s_axi_control_ARVALID;
output   s_axi_control_ARREADY;
input  [C_S_AXI_CONTROL_ADDR_WIDTH - 1:0] s_axi_control_ARADDR;
output   s_axi_control_RVALID;
input   s_axi_control_RREADY;
output  [C_S_AXI_CONTROL_DATA_WIDTH - 1:0] s_axi_control_RDATA;
output  [1:0] s_axi_control_RRESP;
output   s_axi_control_BVALID;
input   s_axi_control_BREADY;
output  [1:0] s_axi_control_BRESP;
input   ap_clk;
input   ap_rst_n;
output   interrupt;
output   m_axi_p0_AWVALID;
input   m_axi_p0_AWREADY;
output  [C_M_AXI_P0_ADDR_WIDTH - 1:0] m_axi_p0_AWADDR;
output  [C_M_AXI_P0_ID_WIDTH - 1:0] m_axi_p0_AWID;
output  [7:0] m_axi_p0_AWLEN;
output  [2:0] m_axi_p0_AWSIZE;
output  [1:0] m_axi_p0_AWBURST;
output  [1:0] m_axi_p0_AWLOCK;
output  [3:0] m_axi_p0_AWCACHE;
output  [2:0] m_axi_p0_AWPROT;
output  [3:0] m_axi_p0_AWQOS;
output  [3:0] m_axi_p0_AWREGION;
output  [C_M_AXI_P0_AWUSER_WIDTH - 1:0] m_axi_p0_AWUSER;
output   m_axi_p0_WVALID;
input   m_axi_p0_WREADY;
output  [C_M_AXI_P0_DATA_WIDTH - 1:0] m_axi_p0_WDATA;
output  [C_M_AXI_P0_WSTRB_WIDTH - 1:0] m_axi_p0_WSTRB;
output   m_axi_p0_WLAST;
output  [C_M_AXI_P0_ID_WIDTH - 1:0] m_axi_p0_WID;
output  [C_M_AXI_P0_WUSER_WIDTH - 1:0] m_axi_p0_WUSER;
output   m_axi_p0_ARVALID;
input   m_axi_p0_ARREADY;
output  [C_M_AXI_P0_ADDR_WIDTH - 1:0] m_axi_p0_ARADDR;
output  [C_M_AXI_P0_ID_WIDTH - 1:0] m_axi_p0_ARID;
output  [7:0] m_axi_p0_ARLEN;
output  [2:0] m_axi_p0_ARSIZE;
output  [1:0] m_axi_p0_ARBURST;
output  [1:0] m_axi_p0_ARLOCK;
output  [3:0] m_axi_p0_ARCACHE;
output  [2:0] m_axi_p0_ARPROT;
output  [3:0] m_axi_p0_ARQOS;
output  [3:0] m_axi_p0_ARREGION;
output  [C_M_AXI_P0_ARUSER_WIDTH - 1:0] m_axi_p0_ARUSER;
input   m_axi_p0_RVALID;
output   m_axi_p0_RREADY;
input  [C_M_AXI_P0_DATA_WIDTH - 1:0] m_axi_p0_RDATA;
input   m_axi_p0_RLAST;
input  [C_M_AXI_P0_ID_WIDTH - 1:0] m_axi_p0_RID;
input  [C_M_AXI_P0_RUSER_WIDTH - 1:0] m_axi_p0_RUSER;
input  [1:0] m_axi_p0_RRESP;
input   m_axi_p0_BVALID;
output   m_axi_p0_BREADY;
input  [1:0] m_axi_p0_BRESP;
input  [C_M_AXI_P0_ID_WIDTH - 1:0] m_axi_p0_BID;
input  [C_M_AXI_P0_BUSER_WIDTH - 1:0] m_axi_p0_BUSER;
output   m_axi_p1_AWVALID;
input   m_axi_p1_AWREADY;
output  [C_M_AXI_P1_ADDR_WIDTH - 1:0] m_axi_p1_AWADDR;
output  [C_M_AXI_P1_ID_WIDTH - 1:0] m_axi_p1_AWID;
output  [7:0] m_axi_p1_AWLEN;
output  [2:0] m_axi_p1_AWSIZE;
output  [1:0] m_axi_p1_AWBURST;
output  [1:0] m_axi_p1_AWLOCK;
output  [3:0] m_axi_p1_AWCACHE;
output  [2:0] m_axi_p1_AWPROT;
output  [3:0] m_axi_p1_AWQOS;
output  [3:0] m_axi_p1_AWREGION;
output  [C_M_AXI_P1_AWUSER_WIDTH - 1:0] m_axi_p1_AWUSER;
output   m_axi_p1_WVALID;
input   m_axi_p1_WREADY;
output  [C_M_AXI_P1_DATA_WIDTH - 1:0] m_axi_p1_WDATA;
output  [C_M_AXI_P1_WSTRB_WIDTH - 1:0] m_axi_p1_WSTRB;
output   m_axi_p1_WLAST;
output  [C_M_AXI_P1_ID_WIDTH - 1:0] m_axi_p1_WID;
output  [C_M_AXI_P1_WUSER_WIDTH - 1:0] m_axi_p1_WUSER;
output   m_axi_p1_ARVALID;
input   m_axi_p1_ARREADY;
output  [C_M_AXI_P1_ADDR_WIDTH - 1:0] m_axi_p1_ARADDR;
output  [C_M_AXI_P1_ID_WIDTH - 1:0] m_axi_p1_ARID;
output  [7:0] m_axi_p1_ARLEN;
output  [2:0] m_axi_p1_ARSIZE;
output  [1:0] m_axi_p1_ARBURST;
output  [1:0] m_axi_p1_ARLOCK;
output  [3:0] m_axi_p1_ARCACHE;
output  [2:0] m_axi_p1_ARPROT;
output  [3:0] m_axi_p1_ARQOS;
output  [3:0] m_axi_p1_ARREGION;
output  [C_M_AXI_P1_ARUSER_WIDTH - 1:0] m_axi_p1_ARUSER;
input   m_axi_p1_RVALID;
output   m_axi_p1_RREADY;
input  [C_M_AXI_P1_DATA_WIDTH - 1:0] m_axi_p1_RDATA;
input   m_axi_p1_RLAST;
input  [C_M_AXI_P1_ID_WIDTH - 1:0] m_axi_p1_RID;
input  [C_M_AXI_P1_RUSER_WIDTH - 1:0] m_axi_p1_RUSER;
input  [1:0] m_axi_p1_RRESP;
input   m_axi_p1_BVALID;
output   m_axi_p1_BREADY;
input  [1:0] m_axi_p1_BRESP;
input  [C_M_AXI_P1_ID_WIDTH - 1:0] m_axi_p1_BID;
input  [C_M_AXI_P1_BUSER_WIDTH - 1:0] m_axi_p1_BUSER;

(* shreg_extract = "no" *) reg    ap_rst_reg_2;
(* shreg_extract = "no" *) reg    ap_rst_reg_1;
(* shreg_extract = "no" *) reg    ap_rst_n_inv;
wire   [63:0] Input_r;
wire   [63:0] Output_r;
wire    ap_start;
wire    ap_ready;
wire    ap_done;
wire    ap_continue;
wire    ap_idle;
wire    p0_AWREADY;
wire    p0_WREADY;
wire    p0_ARREADY;
wire    p0_RVALID;
wire   [511:0] p0_RDATA;
wire    p0_RLAST;
wire   [0:0] p0_RID;
wire   [0:0] p0_RUSER;
wire   [1:0] p0_RRESP;
wire    p0_BVALID;
wire   [1:0] p0_BRESP;
wire   [0:0] p0_BID;
wire   [0:0] p0_BUSER;
wire    p1_AWREADY;
wire    p1_WREADY;
wire    p1_ARREADY;
wire    p1_RVALID;
wire   [127:0] p1_RDATA;
wire    p1_RLAST;
wire   [0:0] p1_RID;
wire   [0:0] p1_RUSER;
wire   [1:0] p1_RRESP;
wire    p1_BVALID;
wire   [1:0] p1_BRESP;
wire   [0:0] p1_BID;
wire   [0:0] p1_BUSER;
wire    Filter_HW_stream_entry3_U0_ap_start;
wire    Filter_HW_stream_entry3_U0_ap_done;
wire    Filter_HW_stream_entry3_U0_ap_continue;
wire    Filter_HW_stream_entry3_U0_ap_idle;
wire    Filter_HW_stream_entry3_U0_ap_ready;
wire   [63:0] Filter_HW_stream_entry3_U0_Input_out_din;
wire    Filter_HW_stream_entry3_U0_Input_out_write;
wire   [63:0] Filter_HW_stream_entry3_U0_Output_out_din;
wire    Filter_HW_stream_entry3_U0_Output_out_write;
wire    load3_U0_ap_start;
wire    load3_U0_start_full_n;
wire    load3_U0_ap_done;
wire    load3_U0_ap_continue;
wire    load3_U0_ap_idle;
wire    load3_U0_ap_ready;
wire    load3_U0_start_out;
wire    load3_U0_start_write;
wire    load3_U0_m_axi_p0_AWVALID;
wire   [63:0] load3_U0_m_axi_p0_AWADDR;
wire   [0:0] load3_U0_m_axi_p0_AWID;
wire   [31:0] load3_U0_m_axi_p0_AWLEN;
wire   [2:0] load3_U0_m_axi_p0_AWSIZE;
wire   [1:0] load3_U0_m_axi_p0_AWBURST;
wire   [1:0] load3_U0_m_axi_p0_AWLOCK;
wire   [3:0] load3_U0_m_axi_p0_AWCACHE;
wire   [2:0] load3_U0_m_axi_p0_AWPROT;
wire   [3:0] load3_U0_m_axi_p0_AWQOS;
wire   [3:0] load3_U0_m_axi_p0_AWREGION;
wire   [0:0] load3_U0_m_axi_p0_AWUSER;
wire    load3_U0_m_axi_p0_WVALID;
wire   [511:0] load3_U0_m_axi_p0_WDATA;
wire   [63:0] load3_U0_m_axi_p0_WSTRB;
wire    load3_U0_m_axi_p0_WLAST;
wire   [0:0] load3_U0_m_axi_p0_WID;
wire   [0:0] load3_U0_m_axi_p0_WUSER;
wire    load3_U0_m_axi_p0_ARVALID;
wire   [63:0] load3_U0_m_axi_p0_ARADDR;
wire   [0:0] load3_U0_m_axi_p0_ARID;
wire   [31:0] load3_U0_m_axi_p0_ARLEN;
wire   [2:0] load3_U0_m_axi_p0_ARSIZE;
wire   [1:0] load3_U0_m_axi_p0_ARBURST;
wire   [1:0] load3_U0_m_axi_p0_ARLOCK;
wire   [3:0] load3_U0_m_axi_p0_ARCACHE;
wire   [2:0] load3_U0_m_axi_p0_ARPROT;
wire   [3:0] load3_U0_m_axi_p0_ARQOS;
wire   [3:0] load3_U0_m_axi_p0_ARREGION;
wire   [0:0] load3_U0_m_axi_p0_ARUSER;
wire    load3_U0_m_axi_p0_RREADY;
wire    load3_U0_m_axi_p0_BREADY;
wire    load3_U0_Input_r_read;
wire    load3_U0_Output_r_read;
wire   [63:0] load3_U0_Output_out_din;
wire    load3_U0_Output_out_write;
wire   [7:0] load3_U0_input_stream_din;
wire    load3_U0_input_stream_write;
wire    compute_U0_input_stream_read;
wire   [7:0] compute_U0_output_stream_din;
wire    compute_U0_output_stream_write;
wire    compute_U0_ap_start;
wire    compute_U0_ap_done;
wire    compute_U0_ap_ready;
wire    compute_U0_ap_idle;
wire    compute_U0_ap_continue;
wire    store_U0_ap_start;
wire    store_U0_ap_done;
wire    store_U0_ap_continue;
wire    store_U0_ap_idle;
wire    store_U0_ap_ready;
wire    store_U0_m_axi_p1_AWVALID;
wire   [63:0] store_U0_m_axi_p1_AWADDR;
wire   [0:0] store_U0_m_axi_p1_AWID;
wire   [31:0] store_U0_m_axi_p1_AWLEN;
wire   [2:0] store_U0_m_axi_p1_AWSIZE;
wire   [1:0] store_U0_m_axi_p1_AWBURST;
wire   [1:0] store_U0_m_axi_p1_AWLOCK;
wire   [3:0] store_U0_m_axi_p1_AWCACHE;
wire   [2:0] store_U0_m_axi_p1_AWPROT;
wire   [3:0] store_U0_m_axi_p1_AWQOS;
wire   [3:0] store_U0_m_axi_p1_AWREGION;
wire   [0:0] store_U0_m_axi_p1_AWUSER;
wire    store_U0_m_axi_p1_WVALID;
wire   [127:0] store_U0_m_axi_p1_WDATA;
wire   [15:0] store_U0_m_axi_p1_WSTRB;
wire    store_U0_m_axi_p1_WLAST;
wire   [0:0] store_U0_m_axi_p1_WID;
wire   [0:0] store_U0_m_axi_p1_WUSER;
wire    store_U0_m_axi_p1_ARVALID;
wire   [63:0] store_U0_m_axi_p1_ARADDR;
wire   [0:0] store_U0_m_axi_p1_ARID;
wire   [31:0] store_U0_m_axi_p1_ARLEN;
wire   [2:0] store_U0_m_axi_p1_ARSIZE;
wire   [1:0] store_U0_m_axi_p1_ARBURST;
wire   [1:0] store_U0_m_axi_p1_ARLOCK;
wire   [3:0] store_U0_m_axi_p1_ARCACHE;
wire   [2:0] store_U0_m_axi_p1_ARPROT;
wire   [3:0] store_U0_m_axi_p1_ARQOS;
wire   [3:0] store_U0_m_axi_p1_ARREGION;
wire   [0:0] store_U0_m_axi_p1_ARUSER;
wire    store_U0_m_axi_p1_RREADY;
wire    store_U0_m_axi_p1_BREADY;
wire    store_U0_Output_r_read;
wire    store_U0_output_stream_read;
wire    ap_sync_continue;
wire    Input_c_full_n;
wire   [63:0] Input_c_dout;
wire    Input_c_empty_n;
wire    Output_c1_full_n;
wire   [63:0] Output_c1_dout;
wire    Output_c1_empty_n;
wire    Output_c_full_n;
wire   [63:0] Output_c_dout;
wire    Output_c_empty_n;
wire    input_stream_full_n;
wire   [7:0] input_stream_dout;
wire    input_stream_empty_n;
wire    output_stream_full_n;
wire   [7:0] output_stream_dout;
wire    output_stream_empty_n;
wire    ap_sync_done;
wire    ap_sync_ready;
reg    ap_sync_reg_Filter_HW_stream_entry3_U0_ap_ready;
wire    ap_sync_Filter_HW_stream_entry3_U0_ap_ready;
reg    ap_sync_reg_load3_U0_ap_ready;
wire    ap_sync_load3_U0_ap_ready;
wire    Filter_HW_stream_entry3_U0_start_full_n;
wire    Filter_HW_stream_entry3_U0_start_write;
wire   [0:0] start_for_compute_U0_din;
wire    start_for_compute_U0_full_n;
wire   [0:0] start_for_compute_U0_dout;
wire    start_for_compute_U0_empty_n;
wire   [0:0] start_for_store_U0_din;
wire    start_for_store_U0_full_n;
wire   [0:0] start_for_store_U0_dout;
wire    start_for_store_U0_empty_n;
wire    compute_U0_start_full_n;
wire    compute_U0_start_write;
wire    store_U0_start_full_n;
wire    store_U0_start_write;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_rst_reg_2 = 1'b1;
#0 ap_rst_reg_1 = 1'b1;
#0 ap_rst_n_inv = 1'b1;
#0 ap_sync_reg_Filter_HW_stream_entry3_U0_ap_ready = 1'b0;
#0 ap_sync_reg_load3_U0_ap_ready = 1'b0;
end

Filter_HW_stream_control_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_DATA_WIDTH ))
control_s_axi_U(
    .AWVALID(s_axi_control_AWVALID),
    .AWREADY(s_axi_control_AWREADY),
    .AWADDR(s_axi_control_AWADDR),
    .WVALID(s_axi_control_WVALID),
    .WREADY(s_axi_control_WREADY),
    .WDATA(s_axi_control_WDATA),
    .WSTRB(s_axi_control_WSTRB),
    .ARVALID(s_axi_control_ARVALID),
    .ARREADY(s_axi_control_ARREADY),
    .ARADDR(s_axi_control_ARADDR),
    .RVALID(s_axi_control_RVALID),
    .RREADY(s_axi_control_RREADY),
    .RDATA(s_axi_control_RDATA),
    .RRESP(s_axi_control_RRESP),
    .BVALID(s_axi_control_BVALID),
    .BREADY(s_axi_control_BREADY),
    .BRESP(s_axi_control_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .Input_r(Input_r),
    .Output_r(Output_r),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_continue(ap_continue),
    .ap_idle(ap_idle)
);

Filter_HW_stream_p0_m_axi #(
    .CONSERVATIVE( 0 ),
    .USER_DW( 512 ),
    .USER_AW( 64 ),
    .USER_MAXREQS( 69 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_P0_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_P0_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_P0_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_P0_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_P0_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_P0_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_P0_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_P0_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_P0_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_P0_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_P0_CACHE_VALUE ))
p0_m_axi_U(
    .AWVALID(m_axi_p0_AWVALID),
    .AWREADY(m_axi_p0_AWREADY),
    .AWADDR(m_axi_p0_AWADDR),
    .AWID(m_axi_p0_AWID),
    .AWLEN(m_axi_p0_AWLEN),
    .AWSIZE(m_axi_p0_AWSIZE),
    .AWBURST(m_axi_p0_AWBURST),
    .AWLOCK(m_axi_p0_AWLOCK),
    .AWCACHE(m_axi_p0_AWCACHE),
    .AWPROT(m_axi_p0_AWPROT),
    .AWQOS(m_axi_p0_AWQOS),
    .AWREGION(m_axi_p0_AWREGION),
    .AWUSER(m_axi_p0_AWUSER),
    .WVALID(m_axi_p0_WVALID),
    .WREADY(m_axi_p0_WREADY),
    .WDATA(m_axi_p0_WDATA),
    .WSTRB(m_axi_p0_WSTRB),
    .WLAST(m_axi_p0_WLAST),
    .WID(m_axi_p0_WID),
    .WUSER(m_axi_p0_WUSER),
    .ARVALID(m_axi_p0_ARVALID),
    .ARREADY(m_axi_p0_ARREADY),
    .ARADDR(m_axi_p0_ARADDR),
    .ARID(m_axi_p0_ARID),
    .ARLEN(m_axi_p0_ARLEN),
    .ARSIZE(m_axi_p0_ARSIZE),
    .ARBURST(m_axi_p0_ARBURST),
    .ARLOCK(m_axi_p0_ARLOCK),
    .ARCACHE(m_axi_p0_ARCACHE),
    .ARPROT(m_axi_p0_ARPROT),
    .ARQOS(m_axi_p0_ARQOS),
    .ARREGION(m_axi_p0_ARREGION),
    .ARUSER(m_axi_p0_ARUSER),
    .RVALID(m_axi_p0_RVALID),
    .RREADY(m_axi_p0_RREADY),
    .RDATA(m_axi_p0_RDATA),
    .RLAST(m_axi_p0_RLAST),
    .RID(m_axi_p0_RID),
    .RUSER(m_axi_p0_RUSER),
    .RRESP(m_axi_p0_RRESP),
    .BVALID(m_axi_p0_BVALID),
    .BREADY(m_axi_p0_BREADY),
    .BRESP(m_axi_p0_BRESP),
    .BID(m_axi_p0_BID),
    .BUSER(m_axi_p0_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(load3_U0_m_axi_p0_ARVALID),
    .I_ARREADY(p0_ARREADY),
    .I_ARADDR(load3_U0_m_axi_p0_ARADDR),
    .I_ARID(load3_U0_m_axi_p0_ARID),
    .I_ARLEN(load3_U0_m_axi_p0_ARLEN),
    .I_ARSIZE(load3_U0_m_axi_p0_ARSIZE),
    .I_ARLOCK(load3_U0_m_axi_p0_ARLOCK),
    .I_ARCACHE(load3_U0_m_axi_p0_ARCACHE),
    .I_ARQOS(load3_U0_m_axi_p0_ARQOS),
    .I_ARPROT(load3_U0_m_axi_p0_ARPROT),
    .I_ARUSER(load3_U0_m_axi_p0_ARUSER),
    .I_ARBURST(load3_U0_m_axi_p0_ARBURST),
    .I_ARREGION(load3_U0_m_axi_p0_ARREGION),
    .I_RVALID(p0_RVALID),
    .I_RREADY(load3_U0_m_axi_p0_RREADY),
    .I_RDATA(p0_RDATA),
    .I_RID(p0_RID),
    .I_RUSER(p0_RUSER),
    .I_RRESP(p0_RRESP),
    .I_RLAST(p0_RLAST),
    .I_AWVALID(1'b0),
    .I_AWREADY(p0_AWREADY),
    .I_AWADDR(64'd0),
    .I_AWID(1'd0),
    .I_AWLEN(32'd0),
    .I_AWSIZE(3'd0),
    .I_AWLOCK(2'd0),
    .I_AWCACHE(4'd0),
    .I_AWQOS(4'd0),
    .I_AWPROT(3'd0),
    .I_AWUSER(1'd0),
    .I_AWBURST(2'd0),
    .I_AWREGION(4'd0),
    .I_WVALID(1'b0),
    .I_WREADY(p0_WREADY),
    .I_WDATA(512'd0),
    .I_WID(1'd0),
    .I_WUSER(1'd0),
    .I_WLAST(1'b0),
    .I_WSTRB(64'd0),
    .I_BVALID(p0_BVALID),
    .I_BREADY(1'b0),
    .I_BRESP(p0_BRESP),
    .I_BID(p0_BID),
    .I_BUSER(p0_BUSER)
);

Filter_HW_stream_p1_m_axi #(
    .CONSERVATIVE( 0 ),
    .USER_DW( 128 ),
    .USER_AW( 64 ),
    .USER_MAXREQS( 69 ),
    .NUM_READ_OUTSTANDING( 16 ),
    .NUM_WRITE_OUTSTANDING( 16 ),
    .MAX_READ_BURST_LENGTH( 16 ),
    .MAX_WRITE_BURST_LENGTH( 16 ),
    .C_M_AXI_ID_WIDTH( C_M_AXI_P1_ID_WIDTH ),
    .C_M_AXI_ADDR_WIDTH( C_M_AXI_P1_ADDR_WIDTH ),
    .C_M_AXI_DATA_WIDTH( C_M_AXI_P1_DATA_WIDTH ),
    .C_M_AXI_AWUSER_WIDTH( C_M_AXI_P1_AWUSER_WIDTH ),
    .C_M_AXI_ARUSER_WIDTH( C_M_AXI_P1_ARUSER_WIDTH ),
    .C_M_AXI_WUSER_WIDTH( C_M_AXI_P1_WUSER_WIDTH ),
    .C_M_AXI_RUSER_WIDTH( C_M_AXI_P1_RUSER_WIDTH ),
    .C_M_AXI_BUSER_WIDTH( C_M_AXI_P1_BUSER_WIDTH ),
    .C_USER_VALUE( C_M_AXI_P1_USER_VALUE ),
    .C_PROT_VALUE( C_M_AXI_P1_PROT_VALUE ),
    .C_CACHE_VALUE( C_M_AXI_P1_CACHE_VALUE ))
p1_m_axi_U(
    .AWVALID(m_axi_p1_AWVALID),
    .AWREADY(m_axi_p1_AWREADY),
    .AWADDR(m_axi_p1_AWADDR),
    .AWID(m_axi_p1_AWID),
    .AWLEN(m_axi_p1_AWLEN),
    .AWSIZE(m_axi_p1_AWSIZE),
    .AWBURST(m_axi_p1_AWBURST),
    .AWLOCK(m_axi_p1_AWLOCK),
    .AWCACHE(m_axi_p1_AWCACHE),
    .AWPROT(m_axi_p1_AWPROT),
    .AWQOS(m_axi_p1_AWQOS),
    .AWREGION(m_axi_p1_AWREGION),
    .AWUSER(m_axi_p1_AWUSER),
    .WVALID(m_axi_p1_WVALID),
    .WREADY(m_axi_p1_WREADY),
    .WDATA(m_axi_p1_WDATA),
    .WSTRB(m_axi_p1_WSTRB),
    .WLAST(m_axi_p1_WLAST),
    .WID(m_axi_p1_WID),
    .WUSER(m_axi_p1_WUSER),
    .ARVALID(m_axi_p1_ARVALID),
    .ARREADY(m_axi_p1_ARREADY),
    .ARADDR(m_axi_p1_ARADDR),
    .ARID(m_axi_p1_ARID),
    .ARLEN(m_axi_p1_ARLEN),
    .ARSIZE(m_axi_p1_ARSIZE),
    .ARBURST(m_axi_p1_ARBURST),
    .ARLOCK(m_axi_p1_ARLOCK),
    .ARCACHE(m_axi_p1_ARCACHE),
    .ARPROT(m_axi_p1_ARPROT),
    .ARQOS(m_axi_p1_ARQOS),
    .ARREGION(m_axi_p1_ARREGION),
    .ARUSER(m_axi_p1_ARUSER),
    .RVALID(m_axi_p1_RVALID),
    .RREADY(m_axi_p1_RREADY),
    .RDATA(m_axi_p1_RDATA),
    .RLAST(m_axi_p1_RLAST),
    .RID(m_axi_p1_RID),
    .RUSER(m_axi_p1_RUSER),
    .RRESP(m_axi_p1_RRESP),
    .BVALID(m_axi_p1_BVALID),
    .BREADY(m_axi_p1_BREADY),
    .BRESP(m_axi_p1_BRESP),
    .BID(m_axi_p1_BID),
    .BUSER(m_axi_p1_BUSER),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .I_ARVALID(1'b0),
    .I_ARREADY(p1_ARREADY),
    .I_ARADDR(64'd0),
    .I_ARID(1'd0),
    .I_ARLEN(32'd0),
    .I_ARSIZE(3'd0),
    .I_ARLOCK(2'd0),
    .I_ARCACHE(4'd0),
    .I_ARQOS(4'd0),
    .I_ARPROT(3'd0),
    .I_ARUSER(1'd0),
    .I_ARBURST(2'd0),
    .I_ARREGION(4'd0),
    .I_RVALID(p1_RVALID),
    .I_RREADY(1'b0),
    .I_RDATA(p1_RDATA),
    .I_RID(p1_RID),
    .I_RUSER(p1_RUSER),
    .I_RRESP(p1_RRESP),
    .I_RLAST(p1_RLAST),
    .I_AWVALID(store_U0_m_axi_p1_AWVALID),
    .I_AWREADY(p1_AWREADY),
    .I_AWADDR(store_U0_m_axi_p1_AWADDR),
    .I_AWID(store_U0_m_axi_p1_AWID),
    .I_AWLEN(store_U0_m_axi_p1_AWLEN),
    .I_AWSIZE(store_U0_m_axi_p1_AWSIZE),
    .I_AWLOCK(store_U0_m_axi_p1_AWLOCK),
    .I_AWCACHE(store_U0_m_axi_p1_AWCACHE),
    .I_AWQOS(store_U0_m_axi_p1_AWQOS),
    .I_AWPROT(store_U0_m_axi_p1_AWPROT),
    .I_AWUSER(store_U0_m_axi_p1_AWUSER),
    .I_AWBURST(store_U0_m_axi_p1_AWBURST),
    .I_AWREGION(store_U0_m_axi_p1_AWREGION),
    .I_WVALID(store_U0_m_axi_p1_WVALID),
    .I_WREADY(p1_WREADY),
    .I_WDATA(store_U0_m_axi_p1_WDATA),
    .I_WID(store_U0_m_axi_p1_WID),
    .I_WUSER(store_U0_m_axi_p1_WUSER),
    .I_WLAST(store_U0_m_axi_p1_WLAST),
    .I_WSTRB(store_U0_m_axi_p1_WSTRB),
    .I_BVALID(p1_BVALID),
    .I_BREADY(store_U0_m_axi_p1_BREADY),
    .I_BRESP(p1_BRESP),
    .I_BID(p1_BID),
    .I_BUSER(p1_BUSER)
);

Filter_HW_stream_Filter_HW_stream_entry3 Filter_HW_stream_entry3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(Filter_HW_stream_entry3_U0_ap_start),
    .ap_done(Filter_HW_stream_entry3_U0_ap_done),
    .ap_continue(Filter_HW_stream_entry3_U0_ap_continue),
    .ap_idle(Filter_HW_stream_entry3_U0_ap_idle),
    .ap_ready(Filter_HW_stream_entry3_U0_ap_ready),
    .Input_r(Input_r),
    .Output_r(Output_r),
    .Input_out_din(Filter_HW_stream_entry3_U0_Input_out_din),
    .Input_out_full_n(Input_c_full_n),
    .Input_out_write(Filter_HW_stream_entry3_U0_Input_out_write),
    .Output_out_din(Filter_HW_stream_entry3_U0_Output_out_din),
    .Output_out_full_n(Output_c1_full_n),
    .Output_out_write(Filter_HW_stream_entry3_U0_Output_out_write)
);

Filter_HW_stream_load3 load3_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(load3_U0_ap_start),
    .start_full_n(load3_U0_start_full_n),
    .ap_done(load3_U0_ap_done),
    .ap_continue(load3_U0_ap_continue),
    .ap_idle(load3_U0_ap_idle),
    .ap_ready(load3_U0_ap_ready),
    .start_out(load3_U0_start_out),
    .start_write(load3_U0_start_write),
    .m_axi_p0_AWVALID(load3_U0_m_axi_p0_AWVALID),
    .m_axi_p0_AWREADY(1'b0),
    .m_axi_p0_AWADDR(load3_U0_m_axi_p0_AWADDR),
    .m_axi_p0_AWID(load3_U0_m_axi_p0_AWID),
    .m_axi_p0_AWLEN(load3_U0_m_axi_p0_AWLEN),
    .m_axi_p0_AWSIZE(load3_U0_m_axi_p0_AWSIZE),
    .m_axi_p0_AWBURST(load3_U0_m_axi_p0_AWBURST),
    .m_axi_p0_AWLOCK(load3_U0_m_axi_p0_AWLOCK),
    .m_axi_p0_AWCACHE(load3_U0_m_axi_p0_AWCACHE),
    .m_axi_p0_AWPROT(load3_U0_m_axi_p0_AWPROT),
    .m_axi_p0_AWQOS(load3_U0_m_axi_p0_AWQOS),
    .m_axi_p0_AWREGION(load3_U0_m_axi_p0_AWREGION),
    .m_axi_p0_AWUSER(load3_U0_m_axi_p0_AWUSER),
    .m_axi_p0_WVALID(load3_U0_m_axi_p0_WVALID),
    .m_axi_p0_WREADY(1'b0),
    .m_axi_p0_WDATA(load3_U0_m_axi_p0_WDATA),
    .m_axi_p0_WSTRB(load3_U0_m_axi_p0_WSTRB),
    .m_axi_p0_WLAST(load3_U0_m_axi_p0_WLAST),
    .m_axi_p0_WID(load3_U0_m_axi_p0_WID),
    .m_axi_p0_WUSER(load3_U0_m_axi_p0_WUSER),
    .m_axi_p0_ARVALID(load3_U0_m_axi_p0_ARVALID),
    .m_axi_p0_ARREADY(p0_ARREADY),
    .m_axi_p0_ARADDR(load3_U0_m_axi_p0_ARADDR),
    .m_axi_p0_ARID(load3_U0_m_axi_p0_ARID),
    .m_axi_p0_ARLEN(load3_U0_m_axi_p0_ARLEN),
    .m_axi_p0_ARSIZE(load3_U0_m_axi_p0_ARSIZE),
    .m_axi_p0_ARBURST(load3_U0_m_axi_p0_ARBURST),
    .m_axi_p0_ARLOCK(load3_U0_m_axi_p0_ARLOCK),
    .m_axi_p0_ARCACHE(load3_U0_m_axi_p0_ARCACHE),
    .m_axi_p0_ARPROT(load3_U0_m_axi_p0_ARPROT),
    .m_axi_p0_ARQOS(load3_U0_m_axi_p0_ARQOS),
    .m_axi_p0_ARREGION(load3_U0_m_axi_p0_ARREGION),
    .m_axi_p0_ARUSER(load3_U0_m_axi_p0_ARUSER),
    .m_axi_p0_RVALID(p0_RVALID),
    .m_axi_p0_RREADY(load3_U0_m_axi_p0_RREADY),
    .m_axi_p0_RDATA(p0_RDATA),
    .m_axi_p0_RLAST(p0_RLAST),
    .m_axi_p0_RID(p0_RID),
    .m_axi_p0_RUSER(p0_RUSER),
    .m_axi_p0_RRESP(p0_RRESP),
    .m_axi_p0_BVALID(1'b0),
    .m_axi_p0_BREADY(load3_U0_m_axi_p0_BREADY),
    .m_axi_p0_BRESP(2'd0),
    .m_axi_p0_BID(1'd0),
    .m_axi_p0_BUSER(1'd0),
    .Input_r_dout(Input_c_dout),
    .Input_r_empty_n(Input_c_empty_n),
    .Input_r_read(load3_U0_Input_r_read),
    .Output_r_dout(Output_c1_dout),
    .Output_r_empty_n(Output_c1_empty_n),
    .Output_r_read(load3_U0_Output_r_read),
    .Output_out_din(load3_U0_Output_out_din),
    .Output_out_full_n(Output_c_full_n),
    .Output_out_write(load3_U0_Output_out_write),
    .input_stream_din(load3_U0_input_stream_din),
    .input_stream_full_n(input_stream_full_n),
    .input_stream_write(load3_U0_input_stream_write)
);

Filter_HW_stream_compute compute_U0(
    .input_stream_dout(input_stream_dout),
    .input_stream_empty_n(input_stream_empty_n),
    .input_stream_read(compute_U0_input_stream_read),
    .output_stream_din(compute_U0_output_stream_din),
    .output_stream_full_n(output_stream_full_n),
    .output_stream_write(compute_U0_output_stream_write),
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(compute_U0_ap_start),
    .ap_done(compute_U0_ap_done),
    .ap_ready(compute_U0_ap_ready),
    .ap_idle(compute_U0_ap_idle),
    .ap_continue(compute_U0_ap_continue)
);

Filter_HW_stream_store store_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(store_U0_ap_start),
    .ap_done(store_U0_ap_done),
    .ap_continue(store_U0_ap_continue),
    .ap_idle(store_U0_ap_idle),
    .ap_ready(store_U0_ap_ready),
    .m_axi_p1_AWVALID(store_U0_m_axi_p1_AWVALID),
    .m_axi_p1_AWREADY(p1_AWREADY),
    .m_axi_p1_AWADDR(store_U0_m_axi_p1_AWADDR),
    .m_axi_p1_AWID(store_U0_m_axi_p1_AWID),
    .m_axi_p1_AWLEN(store_U0_m_axi_p1_AWLEN),
    .m_axi_p1_AWSIZE(store_U0_m_axi_p1_AWSIZE),
    .m_axi_p1_AWBURST(store_U0_m_axi_p1_AWBURST),
    .m_axi_p1_AWLOCK(store_U0_m_axi_p1_AWLOCK),
    .m_axi_p1_AWCACHE(store_U0_m_axi_p1_AWCACHE),
    .m_axi_p1_AWPROT(store_U0_m_axi_p1_AWPROT),
    .m_axi_p1_AWQOS(store_U0_m_axi_p1_AWQOS),
    .m_axi_p1_AWREGION(store_U0_m_axi_p1_AWREGION),
    .m_axi_p1_AWUSER(store_U0_m_axi_p1_AWUSER),
    .m_axi_p1_WVALID(store_U0_m_axi_p1_WVALID),
    .m_axi_p1_WREADY(p1_WREADY),
    .m_axi_p1_WDATA(store_U0_m_axi_p1_WDATA),
    .m_axi_p1_WSTRB(store_U0_m_axi_p1_WSTRB),
    .m_axi_p1_WLAST(store_U0_m_axi_p1_WLAST),
    .m_axi_p1_WID(store_U0_m_axi_p1_WID),
    .m_axi_p1_WUSER(store_U0_m_axi_p1_WUSER),
    .m_axi_p1_ARVALID(store_U0_m_axi_p1_ARVALID),
    .m_axi_p1_ARREADY(1'b0),
    .m_axi_p1_ARADDR(store_U0_m_axi_p1_ARADDR),
    .m_axi_p1_ARID(store_U0_m_axi_p1_ARID),
    .m_axi_p1_ARLEN(store_U0_m_axi_p1_ARLEN),
    .m_axi_p1_ARSIZE(store_U0_m_axi_p1_ARSIZE),
    .m_axi_p1_ARBURST(store_U0_m_axi_p1_ARBURST),
    .m_axi_p1_ARLOCK(store_U0_m_axi_p1_ARLOCK),
    .m_axi_p1_ARCACHE(store_U0_m_axi_p1_ARCACHE),
    .m_axi_p1_ARPROT(store_U0_m_axi_p1_ARPROT),
    .m_axi_p1_ARQOS(store_U0_m_axi_p1_ARQOS),
    .m_axi_p1_ARREGION(store_U0_m_axi_p1_ARREGION),
    .m_axi_p1_ARUSER(store_U0_m_axi_p1_ARUSER),
    .m_axi_p1_RVALID(1'b0),
    .m_axi_p1_RREADY(store_U0_m_axi_p1_RREADY),
    .m_axi_p1_RDATA(128'd0),
    .m_axi_p1_RLAST(1'b0),
    .m_axi_p1_RID(1'd0),
    .m_axi_p1_RUSER(1'd0),
    .m_axi_p1_RRESP(2'd0),
    .m_axi_p1_BVALID(p1_BVALID),
    .m_axi_p1_BREADY(store_U0_m_axi_p1_BREADY),
    .m_axi_p1_BRESP(p1_BRESP),
    .m_axi_p1_BID(p1_BID),
    .m_axi_p1_BUSER(p1_BUSER),
    .Output_r_dout(Output_c_dout),
    .Output_r_empty_n(Output_c_empty_n),
    .Output_r_read(store_U0_Output_r_read),
    .output_stream_dout(output_stream_dout),
    .output_stream_empty_n(output_stream_empty_n),
    .output_stream_read(store_U0_output_stream_read)
);

Filter_HW_stream_fifo_w64_d2_S Input_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Filter_HW_stream_entry3_U0_Input_out_din),
    .if_full_n(Input_c_full_n),
    .if_write(Filter_HW_stream_entry3_U0_Input_out_write),
    .if_dout(Input_c_dout),
    .if_empty_n(Input_c_empty_n),
    .if_read(load3_U0_Input_r_read)
);

Filter_HW_stream_fifo_w64_d2_S Output_c1_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(Filter_HW_stream_entry3_U0_Output_out_din),
    .if_full_n(Output_c1_full_n),
    .if_write(Filter_HW_stream_entry3_U0_Output_out_write),
    .if_dout(Output_c1_dout),
    .if_empty_n(Output_c1_empty_n),
    .if_read(load3_U0_Output_r_read)
);

Filter_HW_stream_fifo_w64_d3_S Output_c_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(load3_U0_Output_out_din),
    .if_full_n(Output_c_full_n),
    .if_write(load3_U0_Output_out_write),
    .if_dout(Output_c_dout),
    .if_empty_n(Output_c_empty_n),
    .if_read(store_U0_Output_r_read)
);

Filter_HW_stream_fifo_w8_d2_S_x input_stream_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(load3_U0_input_stream_din),
    .if_full_n(input_stream_full_n),
    .if_write(load3_U0_input_stream_write),
    .if_dout(input_stream_dout),
    .if_empty_n(input_stream_empty_n),
    .if_read(compute_U0_input_stream_read)
);

Filter_HW_stream_fifo_w8_d2_S_x output_stream_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(compute_U0_output_stream_din),
    .if_full_n(output_stream_full_n),
    .if_write(compute_U0_output_stream_write),
    .if_dout(output_stream_dout),
    .if_empty_n(output_stream_empty_n),
    .if_read(store_U0_output_stream_read)
);

Filter_HW_stream_start_for_compute_U0 start_for_compute_U0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_compute_U0_din),
    .if_full_n(start_for_compute_U0_full_n),
    .if_write(load3_U0_start_write),
    .if_dout(start_for_compute_U0_dout),
    .if_empty_n(start_for_compute_U0_empty_n),
    .if_read(compute_U0_ap_ready)
);

Filter_HW_stream_start_for_store_U0 start_for_store_U0_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_store_U0_din),
    .if_full_n(start_for_store_U0_full_n),
    .if_write(load3_U0_start_write),
    .if_dout(start_for_store_U0_dout),
    .if_empty_n(start_for_store_U0_empty_n),
    .if_read(store_U0_ap_ready)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_Filter_HW_stream_entry3_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_Filter_HW_stream_entry3_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_Filter_HW_stream_entry3_U0_ap_ready <= ap_sync_Filter_HW_stream_entry3_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_sync_reg_load3_U0_ap_ready <= 1'b0;
    end else begin
        if (((ap_sync_ready & ap_start) == 1'b1)) begin
            ap_sync_reg_load3_U0_ap_ready <= 1'b0;
        end else begin
            ap_sync_reg_load3_U0_ap_ready <= ap_sync_load3_U0_ap_ready;
        end
    end
end

always @ (posedge ap_clk) begin
    ap_rst_n_inv <= ap_rst_reg_1;
end

always @ (posedge ap_clk) begin
    ap_rst_reg_1 <= ap_rst_reg_2;
end

always @ (posedge ap_clk) begin
    ap_rst_reg_2 <= ~ap_rst_n;
end

assign Filter_HW_stream_entry3_U0_ap_continue = 1'b1;

assign Filter_HW_stream_entry3_U0_ap_start = ((ap_sync_reg_Filter_HW_stream_entry3_U0_ap_ready ^ 1'b1) & ap_start);

assign Filter_HW_stream_entry3_U0_start_full_n = 1'b1;

assign Filter_HW_stream_entry3_U0_start_write = 1'b0;

assign ap_done = store_U0_ap_done;

assign ap_idle = (store_U0_ap_idle & load3_U0_ap_idle & compute_U0_ap_idle & Filter_HW_stream_entry3_U0_ap_idle);

assign ap_ready = ap_sync_ready;

assign ap_sync_Filter_HW_stream_entry3_U0_ap_ready = (ap_sync_reg_Filter_HW_stream_entry3_U0_ap_ready | Filter_HW_stream_entry3_U0_ap_ready);

assign ap_sync_continue = ap_continue;

assign ap_sync_done = store_U0_ap_done;

assign ap_sync_load3_U0_ap_ready = (load3_U0_ap_ready | ap_sync_reg_load3_U0_ap_ready);

assign ap_sync_ready = (ap_sync_load3_U0_ap_ready & ap_sync_Filter_HW_stream_entry3_U0_ap_ready);

assign compute_U0_ap_continue = 1'b1;

assign compute_U0_ap_start = start_for_compute_U0_empty_n;

assign compute_U0_start_full_n = 1'b1;

assign compute_U0_start_write = 1'b0;

assign load3_U0_ap_continue = 1'b1;

assign load3_U0_ap_start = ((ap_sync_reg_load3_U0_ap_ready ^ 1'b1) & ap_start);

assign load3_U0_start_full_n = (start_for_store_U0_full_n & start_for_compute_U0_full_n);

assign start_for_compute_U0_din = 1'b1;

assign start_for_store_U0_din = 1'b1;

assign store_U0_ap_continue = ap_continue;

assign store_U0_ap_start = start_for_store_U0_empty_n;

assign store_U0_start_full_n = 1'b1;

assign store_U0_start_write = 1'b0;

endmodule //Filter_HW_stream
