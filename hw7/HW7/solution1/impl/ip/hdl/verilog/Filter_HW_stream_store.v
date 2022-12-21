// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module Filter_HW_stream_store (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
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
        m_axi_p1_BUSER,
        Output_r_dout,
        Output_r_empty_n,
        Output_r_read,
        output_stream_dout,
        output_stream_empty_n,
        output_stream_read
);

parameter    ap_ST_fsm_state1 = 71'd1;
parameter    ap_ST_fsm_state2 = 71'd2;
parameter    ap_ST_fsm_pp0_stage0 = 71'd4;
parameter    ap_ST_fsm_state6 = 71'd8;
parameter    ap_ST_fsm_state7 = 71'd16;
parameter    ap_ST_fsm_state8 = 71'd32;
parameter    ap_ST_fsm_state9 = 71'd64;
parameter    ap_ST_fsm_state10 = 71'd128;
parameter    ap_ST_fsm_state11 = 71'd256;
parameter    ap_ST_fsm_state12 = 71'd512;
parameter    ap_ST_fsm_state13 = 71'd1024;
parameter    ap_ST_fsm_state14 = 71'd2048;
parameter    ap_ST_fsm_state15 = 71'd4096;
parameter    ap_ST_fsm_state16 = 71'd8192;
parameter    ap_ST_fsm_state17 = 71'd16384;
parameter    ap_ST_fsm_state18 = 71'd32768;
parameter    ap_ST_fsm_state19 = 71'd65536;
parameter    ap_ST_fsm_state20 = 71'd131072;
parameter    ap_ST_fsm_state21 = 71'd262144;
parameter    ap_ST_fsm_state22 = 71'd524288;
parameter    ap_ST_fsm_state23 = 71'd1048576;
parameter    ap_ST_fsm_state24 = 71'd2097152;
parameter    ap_ST_fsm_state25 = 71'd4194304;
parameter    ap_ST_fsm_state26 = 71'd8388608;
parameter    ap_ST_fsm_state27 = 71'd16777216;
parameter    ap_ST_fsm_state28 = 71'd33554432;
parameter    ap_ST_fsm_state29 = 71'd67108864;
parameter    ap_ST_fsm_state30 = 71'd134217728;
parameter    ap_ST_fsm_state31 = 71'd268435456;
parameter    ap_ST_fsm_state32 = 71'd536870912;
parameter    ap_ST_fsm_state33 = 71'd1073741824;
parameter    ap_ST_fsm_state34 = 71'd2147483648;
parameter    ap_ST_fsm_state35 = 71'd4294967296;
parameter    ap_ST_fsm_state36 = 71'd8589934592;
parameter    ap_ST_fsm_state37 = 71'd17179869184;
parameter    ap_ST_fsm_state38 = 71'd34359738368;
parameter    ap_ST_fsm_state39 = 71'd68719476736;
parameter    ap_ST_fsm_state40 = 71'd137438953472;
parameter    ap_ST_fsm_state41 = 71'd274877906944;
parameter    ap_ST_fsm_state42 = 71'd549755813888;
parameter    ap_ST_fsm_state43 = 71'd1099511627776;
parameter    ap_ST_fsm_state44 = 71'd2199023255552;
parameter    ap_ST_fsm_state45 = 71'd4398046511104;
parameter    ap_ST_fsm_state46 = 71'd8796093022208;
parameter    ap_ST_fsm_state47 = 71'd17592186044416;
parameter    ap_ST_fsm_state48 = 71'd35184372088832;
parameter    ap_ST_fsm_state49 = 71'd70368744177664;
parameter    ap_ST_fsm_state50 = 71'd140737488355328;
parameter    ap_ST_fsm_state51 = 71'd281474976710656;
parameter    ap_ST_fsm_state52 = 71'd562949953421312;
parameter    ap_ST_fsm_state53 = 71'd1125899906842624;
parameter    ap_ST_fsm_state54 = 71'd2251799813685248;
parameter    ap_ST_fsm_state55 = 71'd4503599627370496;
parameter    ap_ST_fsm_state56 = 71'd9007199254740992;
parameter    ap_ST_fsm_state57 = 71'd18014398509481984;
parameter    ap_ST_fsm_state58 = 71'd36028797018963968;
parameter    ap_ST_fsm_state59 = 71'd72057594037927936;
parameter    ap_ST_fsm_state60 = 71'd144115188075855872;
parameter    ap_ST_fsm_state61 = 71'd288230376151711744;
parameter    ap_ST_fsm_state62 = 71'd576460752303423488;
parameter    ap_ST_fsm_state63 = 71'd1152921504606846976;
parameter    ap_ST_fsm_state64 = 71'd2305843009213693952;
parameter    ap_ST_fsm_state65 = 71'd4611686018427387904;
parameter    ap_ST_fsm_state66 = 71'd9223372036854775808;
parameter    ap_ST_fsm_state67 = 71'd18446744073709551616;
parameter    ap_ST_fsm_state68 = 71'd36893488147419103232;
parameter    ap_ST_fsm_state69 = 71'd73786976294838206464;
parameter    ap_ST_fsm_state70 = 71'd147573952589676412928;
parameter    ap_ST_fsm_state71 = 71'd295147905179352825856;
parameter    ap_ST_fsm_state72 = 71'd590295810358705651712;
parameter    ap_ST_fsm_state73 = 71'd1180591620717411303424;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   m_axi_p1_AWVALID;
input   m_axi_p1_AWREADY;
output  [63:0] m_axi_p1_AWADDR;
output  [0:0] m_axi_p1_AWID;
output  [31:0] m_axi_p1_AWLEN;
output  [2:0] m_axi_p1_AWSIZE;
output  [1:0] m_axi_p1_AWBURST;
output  [1:0] m_axi_p1_AWLOCK;
output  [3:0] m_axi_p1_AWCACHE;
output  [2:0] m_axi_p1_AWPROT;
output  [3:0] m_axi_p1_AWQOS;
output  [3:0] m_axi_p1_AWREGION;
output  [0:0] m_axi_p1_AWUSER;
output   m_axi_p1_WVALID;
input   m_axi_p1_WREADY;
output  [127:0] m_axi_p1_WDATA;
output  [15:0] m_axi_p1_WSTRB;
output   m_axi_p1_WLAST;
output  [0:0] m_axi_p1_WID;
output  [0:0] m_axi_p1_WUSER;
output   m_axi_p1_ARVALID;
input   m_axi_p1_ARREADY;
output  [63:0] m_axi_p1_ARADDR;
output  [0:0] m_axi_p1_ARID;
output  [31:0] m_axi_p1_ARLEN;
output  [2:0] m_axi_p1_ARSIZE;
output  [1:0] m_axi_p1_ARBURST;
output  [1:0] m_axi_p1_ARLOCK;
output  [3:0] m_axi_p1_ARCACHE;
output  [2:0] m_axi_p1_ARPROT;
output  [3:0] m_axi_p1_ARQOS;
output  [3:0] m_axi_p1_ARREGION;
output  [0:0] m_axi_p1_ARUSER;
input   m_axi_p1_RVALID;
output   m_axi_p1_RREADY;
input  [127:0] m_axi_p1_RDATA;
input   m_axi_p1_RLAST;
input  [0:0] m_axi_p1_RID;
input  [0:0] m_axi_p1_RUSER;
input  [1:0] m_axi_p1_RRESP;
input   m_axi_p1_BVALID;
output   m_axi_p1_BREADY;
input  [1:0] m_axi_p1_BRESP;
input  [0:0] m_axi_p1_BID;
input  [0:0] m_axi_p1_BUSER;
input  [63:0] Output_r_dout;
input   Output_r_empty_n;
output   Output_r_read;
input  [7:0] output_stream_dout;
input   output_stream_empty_n;
output   output_stream_read;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg m_axi_p1_AWVALID;
reg m_axi_p1_WVALID;
reg m_axi_p1_BREADY;
reg Output_r_read;
reg output_stream_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [70:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    p1_blk_n_AW;
wire    ap_CS_fsm_state2;
reg    p1_blk_n_W;
reg    ap_enable_reg_pp0_iter2;
wire    ap_block_pp0_stage0;
reg   [0:0] icmp_ln315_reg_234;
reg   [0:0] icmp_ln315_reg_234_pp0_iter1_reg;
reg    p1_blk_n_B;
wire    ap_CS_fsm_state73;
reg    Output_r_blk_n;
reg    output_stream_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
reg   [0:0] icmp_ln314_reg_230;
reg   [16:0] Y_reg_116;
reg   [119:0] phi_ln315_reg_127;
reg   [59:0] trunc_ln_reg_214;
wire   [16:0] add_ln314_fu_159_p2;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage0_iter0;
reg    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_state5_pp0_stage0_iter2;
reg    ap_block_state5_io;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln314_fu_165_p2;
reg   [0:0] icmp_ln314_reg_230_pp0_iter1_reg;
wire   [0:0] icmp_ln315_fu_175_p2;
wire   [127:0] or_ln_fu_181_p3;
reg   [127:0] or_ln_reg_239;
wire   [119:0] select_ln315_fu_207_p3;
reg   [119:0] select_ln315_reg_244;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg   [119:0] ap_phi_mux_phi_ln315_phi_fu_131_p4;
wire  signed [63:0] sext_ln314_fu_149_p1;
reg    ap_block_pp0_stage0_01001;
reg    ap_block_state1;
wire   [3:0] empty_32_fu_171_p1;
wire   [111:0] tmp_1_fu_189_p4;
wire   [119:0] tmp_2_fu_199_p3;
reg   [70:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 71'd1;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state73) & (m_axi_p1_BVALID == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((m_axi_p1_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state3)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end else if (((m_axi_p1_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((m_axi_p1_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        Y_reg_116 <= 17'd0;
    end else if (((icmp_ln314_fu_165_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        Y_reg_116 <= add_ln314_fu_159_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((m_axi_p1_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        phi_ln315_reg_127 <= 120'd0;
    end else if (((icmp_ln314_reg_230_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        phi_ln315_reg_127 <= select_ln315_reg_244;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln314_reg_230 <= icmp_ln314_fu_165_p2;
        icmp_ln314_reg_230_pp0_iter1_reg <= icmp_ln314_reg_230;
        icmp_ln315_reg_234_pp0_iter1_reg <= icmp_ln315_reg_234;
    end
end

always @ (posedge ap_clk) begin
    if (((icmp_ln314_fu_165_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln315_reg_234 <= icmp_ln315_fu_175_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln314_reg_230 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        or_ln_reg_239 <= or_ln_fu_181_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln314_reg_230 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        select_ln315_reg_244 <= select_ln315_fu_207_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state1)) begin
        trunc_ln_reg_214 <= {{Output_r_dout[63:4]}};
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0)) & (1'b1 == ap_CS_fsm_state1))) begin
        Output_r_blk_n = Output_r_empty_n;
    end else begin
        Output_r_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (1'b0 == Output_r_empty_n)) & (1'b1 == ap_CS_fsm_state1))) begin
        Output_r_read = 1'b1;
    end else begin
        Output_r_read = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln314_fu_165_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state73) & (m_axi_p1_BVALID == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln314_reg_230_pp0_iter1_reg == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        ap_phi_mux_phi_ln315_phi_fu_131_p4 = select_ln315_reg_244;
    end else begin
        ap_phi_mux_phi_ln315_phi_fu_131_p4 = phi_ln315_reg_127;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state73) & (m_axi_p1_BVALID == 1'b1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((m_axi_p1_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
        m_axi_p1_AWVALID = 1'b1;
    end else begin
        m_axi_p1_AWVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state73) & (m_axi_p1_BVALID == 1'b1))) begin
        m_axi_p1_BREADY = 1'b1;
    end else begin
        m_axi_p1_BREADY = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln315_reg_234_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        m_axi_p1_WVALID = 1'b1;
    end else begin
        m_axi_p1_WVALID = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln314_reg_230 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        output_stream_blk_n = output_stream_empty_n;
    end else begin
        output_stream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln314_reg_230 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        output_stream_read = 1'b1;
    end else begin
        output_stream_read = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        p1_blk_n_AW = m_axi_p1_AWREADY;
    end else begin
        p1_blk_n_AW = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state73)) begin
        p1_blk_n_B = m_axi_p1_BVALID;
    end else begin
        p1_blk_n_B = 1'b1;
    end
end

always @ (*) begin
    if (((icmp_ln315_reg_234_pp0_iter1_reg == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        p1_blk_n_W = m_axi_p1_WREADY;
    end else begin
        p1_blk_n_W = 1'b1;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (1'b0 == Output_r_empty_n)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((m_axi_p1_AWREADY == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((icmp_ln314_fu_165_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)) & ~((ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln314_fu_165_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (ap_enable_reg_pp0_iter1 == 1'b0) & (1'b0 == ap_block_pp0_stage0_subdone)))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            ap_NS_fsm = ap_ST_fsm_state8;
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            ap_NS_fsm = ap_ST_fsm_state10;
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        ap_ST_fsm_state11 : begin
            ap_NS_fsm = ap_ST_fsm_state12;
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state13;
        end
        ap_ST_fsm_state13 : begin
            ap_NS_fsm = ap_ST_fsm_state14;
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state15;
        end
        ap_ST_fsm_state15 : begin
            ap_NS_fsm = ap_ST_fsm_state16;
        end
        ap_ST_fsm_state16 : begin
            ap_NS_fsm = ap_ST_fsm_state17;
        end
        ap_ST_fsm_state17 : begin
            ap_NS_fsm = ap_ST_fsm_state18;
        end
        ap_ST_fsm_state18 : begin
            ap_NS_fsm = ap_ST_fsm_state19;
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state20;
        end
        ap_ST_fsm_state20 : begin
            ap_NS_fsm = ap_ST_fsm_state21;
        end
        ap_ST_fsm_state21 : begin
            ap_NS_fsm = ap_ST_fsm_state22;
        end
        ap_ST_fsm_state22 : begin
            ap_NS_fsm = ap_ST_fsm_state23;
        end
        ap_ST_fsm_state23 : begin
            ap_NS_fsm = ap_ST_fsm_state24;
        end
        ap_ST_fsm_state24 : begin
            ap_NS_fsm = ap_ST_fsm_state25;
        end
        ap_ST_fsm_state25 : begin
            ap_NS_fsm = ap_ST_fsm_state26;
        end
        ap_ST_fsm_state26 : begin
            ap_NS_fsm = ap_ST_fsm_state27;
        end
        ap_ST_fsm_state27 : begin
            ap_NS_fsm = ap_ST_fsm_state28;
        end
        ap_ST_fsm_state28 : begin
            ap_NS_fsm = ap_ST_fsm_state29;
        end
        ap_ST_fsm_state29 : begin
            ap_NS_fsm = ap_ST_fsm_state30;
        end
        ap_ST_fsm_state30 : begin
            ap_NS_fsm = ap_ST_fsm_state31;
        end
        ap_ST_fsm_state31 : begin
            ap_NS_fsm = ap_ST_fsm_state32;
        end
        ap_ST_fsm_state32 : begin
            ap_NS_fsm = ap_ST_fsm_state33;
        end
        ap_ST_fsm_state33 : begin
            ap_NS_fsm = ap_ST_fsm_state34;
        end
        ap_ST_fsm_state34 : begin
            ap_NS_fsm = ap_ST_fsm_state35;
        end
        ap_ST_fsm_state35 : begin
            ap_NS_fsm = ap_ST_fsm_state36;
        end
        ap_ST_fsm_state36 : begin
            ap_NS_fsm = ap_ST_fsm_state37;
        end
        ap_ST_fsm_state37 : begin
            ap_NS_fsm = ap_ST_fsm_state38;
        end
        ap_ST_fsm_state38 : begin
            ap_NS_fsm = ap_ST_fsm_state39;
        end
        ap_ST_fsm_state39 : begin
            ap_NS_fsm = ap_ST_fsm_state40;
        end
        ap_ST_fsm_state40 : begin
            ap_NS_fsm = ap_ST_fsm_state41;
        end
        ap_ST_fsm_state41 : begin
            ap_NS_fsm = ap_ST_fsm_state42;
        end
        ap_ST_fsm_state42 : begin
            ap_NS_fsm = ap_ST_fsm_state43;
        end
        ap_ST_fsm_state43 : begin
            ap_NS_fsm = ap_ST_fsm_state44;
        end
        ap_ST_fsm_state44 : begin
            ap_NS_fsm = ap_ST_fsm_state45;
        end
        ap_ST_fsm_state45 : begin
            ap_NS_fsm = ap_ST_fsm_state46;
        end
        ap_ST_fsm_state46 : begin
            ap_NS_fsm = ap_ST_fsm_state47;
        end
        ap_ST_fsm_state47 : begin
            ap_NS_fsm = ap_ST_fsm_state48;
        end
        ap_ST_fsm_state48 : begin
            ap_NS_fsm = ap_ST_fsm_state49;
        end
        ap_ST_fsm_state49 : begin
            ap_NS_fsm = ap_ST_fsm_state50;
        end
        ap_ST_fsm_state50 : begin
            ap_NS_fsm = ap_ST_fsm_state51;
        end
        ap_ST_fsm_state51 : begin
            ap_NS_fsm = ap_ST_fsm_state52;
        end
        ap_ST_fsm_state52 : begin
            ap_NS_fsm = ap_ST_fsm_state53;
        end
        ap_ST_fsm_state53 : begin
            ap_NS_fsm = ap_ST_fsm_state54;
        end
        ap_ST_fsm_state54 : begin
            ap_NS_fsm = ap_ST_fsm_state55;
        end
        ap_ST_fsm_state55 : begin
            ap_NS_fsm = ap_ST_fsm_state56;
        end
        ap_ST_fsm_state56 : begin
            ap_NS_fsm = ap_ST_fsm_state57;
        end
        ap_ST_fsm_state57 : begin
            ap_NS_fsm = ap_ST_fsm_state58;
        end
        ap_ST_fsm_state58 : begin
            ap_NS_fsm = ap_ST_fsm_state59;
        end
        ap_ST_fsm_state59 : begin
            ap_NS_fsm = ap_ST_fsm_state60;
        end
        ap_ST_fsm_state60 : begin
            ap_NS_fsm = ap_ST_fsm_state61;
        end
        ap_ST_fsm_state61 : begin
            ap_NS_fsm = ap_ST_fsm_state62;
        end
        ap_ST_fsm_state62 : begin
            ap_NS_fsm = ap_ST_fsm_state63;
        end
        ap_ST_fsm_state63 : begin
            ap_NS_fsm = ap_ST_fsm_state64;
        end
        ap_ST_fsm_state64 : begin
            ap_NS_fsm = ap_ST_fsm_state65;
        end
        ap_ST_fsm_state65 : begin
            ap_NS_fsm = ap_ST_fsm_state66;
        end
        ap_ST_fsm_state66 : begin
            ap_NS_fsm = ap_ST_fsm_state67;
        end
        ap_ST_fsm_state67 : begin
            ap_NS_fsm = ap_ST_fsm_state68;
        end
        ap_ST_fsm_state68 : begin
            ap_NS_fsm = ap_ST_fsm_state69;
        end
        ap_ST_fsm_state69 : begin
            ap_NS_fsm = ap_ST_fsm_state70;
        end
        ap_ST_fsm_state70 : begin
            ap_NS_fsm = ap_ST_fsm_state71;
        end
        ap_ST_fsm_state71 : begin
            ap_NS_fsm = ap_ST_fsm_state72;
        end
        ap_ST_fsm_state72 : begin
            ap_NS_fsm = ap_ST_fsm_state73;
        end
        ap_ST_fsm_state73 : begin
            if (((1'b1 == ap_CS_fsm_state73) & (m_axi_p1_BVALID == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state73;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln314_fu_159_p2 = (Y_reg_116 + 17'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state73 = ap_CS_fsm[32'd70];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((icmp_ln314_reg_230 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (output_stream_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((1'b1 == ap_block_state5_io) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln314_reg_230 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (output_stream_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((1'b1 == ap_block_state5_io) & (ap_enable_reg_pp0_iter2 == 1'b1)) | ((icmp_ln314_reg_230 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (output_stream_empty_n == 1'b0)));
end

always @ (*) begin
    ap_block_state1 = ((ap_done_reg == 1'b1) | (ap_start == 1'b0) | (1'b0 == Output_r_empty_n));
end

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter1 = ((icmp_ln314_reg_230 == 1'd0) & (output_stream_empty_n == 1'b0));
end

always @ (*) begin
    ap_block_state5_io = ((icmp_ln315_reg_234_pp0_iter1_reg == 1'd1) & (m_axi_p1_WREADY == 1'b0));
end

assign ap_block_state5_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign empty_32_fu_171_p1 = Y_reg_116[3:0];

assign icmp_ln314_fu_165_p2 = ((Y_reg_116 == 17'd125136) ? 1'b1 : 1'b0);

assign icmp_ln315_fu_175_p2 = ((empty_32_fu_171_p1 == 4'd15) ? 1'b1 : 1'b0);

assign m_axi_p1_ARADDR = 64'd0;

assign m_axi_p1_ARBURST = 2'd0;

assign m_axi_p1_ARCACHE = 4'd0;

assign m_axi_p1_ARID = 1'd0;

assign m_axi_p1_ARLEN = 32'd0;

assign m_axi_p1_ARLOCK = 2'd0;

assign m_axi_p1_ARPROT = 3'd0;

assign m_axi_p1_ARQOS = 4'd0;

assign m_axi_p1_ARREGION = 4'd0;

assign m_axi_p1_ARSIZE = 3'd0;

assign m_axi_p1_ARUSER = 1'd0;

assign m_axi_p1_ARVALID = 1'b0;

assign m_axi_p1_AWADDR = sext_ln314_fu_149_p1;

assign m_axi_p1_AWBURST = 2'd0;

assign m_axi_p1_AWCACHE = 4'd0;

assign m_axi_p1_AWID = 1'd0;

assign m_axi_p1_AWLEN = 32'd7821;

assign m_axi_p1_AWLOCK = 2'd0;

assign m_axi_p1_AWPROT = 3'd0;

assign m_axi_p1_AWQOS = 4'd0;

assign m_axi_p1_AWREGION = 4'd0;

assign m_axi_p1_AWSIZE = 3'd0;

assign m_axi_p1_AWUSER = 1'd0;

assign m_axi_p1_RREADY = 1'b0;

assign m_axi_p1_WDATA = or_ln_reg_239;

assign m_axi_p1_WID = 1'd0;

assign m_axi_p1_WLAST = 1'b0;

assign m_axi_p1_WSTRB = 16'd65535;

assign m_axi_p1_WUSER = 1'd0;

assign or_ln_fu_181_p3 = {{output_stream_dout}, {ap_phi_mux_phi_ln315_phi_fu_131_p4}};

assign select_ln315_fu_207_p3 = ((icmp_ln315_reg_234[0:0] == 1'b1) ? 120'd0 : tmp_2_fu_199_p3);

assign sext_ln314_fu_149_p1 = $signed(trunc_ln_reg_214);

assign tmp_1_fu_189_p4 = {{ap_phi_mux_phi_ln315_phi_fu_131_p4[119:8]}};

assign tmp_2_fu_199_p3 = {{output_stream_dout}, {tmp_1_fu_189_p4}};

endmodule //Filter_HW_stream_store