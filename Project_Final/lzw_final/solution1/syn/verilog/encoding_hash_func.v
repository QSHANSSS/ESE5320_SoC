// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module encoding_hash_func (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        key_address0,
        key_ce0,
        key_q0,
        key_offset,
        len,
        ap_return
);

parameter    ap_ST_fsm_state1 = 15'd1;
parameter    ap_ST_fsm_state2 = 15'd2;
parameter    ap_ST_fsm_pp0_stage0 = 15'd4;
parameter    ap_ST_fsm_state5 = 15'd8;
parameter    ap_ST_fsm_state6 = 15'd16;
parameter    ap_ST_fsm_state7 = 15'd32;
parameter    ap_ST_fsm_state8 = 15'd64;
parameter    ap_ST_fsm_state9 = 15'd128;
parameter    ap_ST_fsm_state10 = 15'd256;
parameter    ap_ST_fsm_state11 = 15'd512;
parameter    ap_ST_fsm_state12 = 15'd1024;
parameter    ap_ST_fsm_state13 = 15'd2048;
parameter    ap_ST_fsm_state14 = 15'd4096;
parameter    ap_ST_fsm_state15 = 15'd8192;
parameter    ap_ST_fsm_state16 = 15'd16384;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [12:0] key_address0;
output   key_ce0;
input  [7:0] key_q0;
input  [12:0] key_offset;
input  [17:0] len;
output  [13:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg key_ce0;
reg[13:0] ap_return;

(* fsm_encoding = "none" *) reg   [14:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg  signed [7:0] i_reg_321;
wire   [7:0] temp_key_q0;
reg   [7:0] reg_333;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state9;
wire   [7:0] temp_key_q1;
wire    ap_CS_fsm_state12;
reg   [7:0] reg_338;
wire    ap_CS_fsm_state7;
wire    ap_CS_fsm_state11;
wire   [4:0] empty_45_fu_342_p2;
wire    ap_CS_fsm_state2;
wire   [0:0] exitcond3_fu_353_p2;
wire   [7:0] i_2_fu_359_p2;
reg   [7:0] i_2_reg_680;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state3_pp0_stage0_iter0;
wire    ap_block_state4_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [0:0] icmp_ln30_fu_369_p2;
reg   [0:0] icmp_ln30_reg_685;
wire    ap_CS_fsm_state5;
reg   [7:0] temp_key_load_2_reg_714;
reg   [7:0] temp_key_load_1_reg_724;
wire    ap_CS_fsm_state8;
reg   [7:0] temp_key_load_4_reg_734;
wire   [8:0] empty_47_fu_401_p2;
reg   [8:0] empty_47_reg_754;
wire    ap_CS_fsm_state10;
wire   [8:0] empty_49_fu_422_p2;
reg   [8:0] empty_49_reg_769;
wire   [8:0] hash_5_fu_428_p2;
reg   [8:0] hash_5_reg_774;
wire   [8:0] empty_50_fu_441_p2;
reg   [8:0] empty_50_reg_789;
wire   [8:0] empty_48_fu_455_p2;
reg   [8:0] empty_48_reg_804;
wire    ap_CS_fsm_state13;
wire   [9:0] tmp114_fu_472_p2;
reg   [9:0] tmp114_reg_819;
wire   [9:0] hash_6_fu_481_p2;
reg   [9:0] hash_6_reg_824;
wire    ap_CS_fsm_state14;
wire   [11:0] hash_7_fu_553_p2;
reg   [11:0] hash_7_reg_839;
wire   [13:0] add_ln41_fu_559_p2;
reg   [13:0] add_ln41_reg_844;
wire    ap_CS_fsm_state15;
wire   [9:0] tmp210_fu_586_p2;
reg   [9:0] tmp210_reg_854;
wire   [9:0] tmp86_fu_599_p2;
reg   [9:0] tmp86_reg_859;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state3;
reg    ap_enable_reg_pp0_iter1;
reg   [4:0] temp_key_address0;
reg    temp_key_ce0;
reg    temp_key_we0;
reg   [7:0] temp_key_d0;
reg   [4:0] temp_key_address1;
reg    temp_key_ce1;
reg   [4:0] empty_reg_310;
reg  signed [7:0] ap_phi_mux_i_phi_fu_325_p4;
wire    ap_block_pp0_stage0;
wire   [63:0] p_cast6_fu_348_p1;
wire   [63:0] zext_ln31_1_fu_383_p1;
wire   [63:0] zext_ln31_fu_388_p1;
wire  signed [17:0] sext_ln30_fu_365_p1;
wire  signed [12:0] sext_ln31_fu_374_p1;
wire   [12:0] add_ln31_fu_378_p2;
wire   [8:0] temp_key_load_7_cast_fu_397_p1;
wire   [8:0] temp_key_load_1_cast_fu_393_p1;
wire   [8:0] temp_key_load_9_cast_fu_418_p1;
wire   [8:0] temp_key_load_3_cast_fu_415_p1;
wire   [8:0] zext_ln38_fu_411_p1;
wire   [8:0] zext_ln27_fu_407_p1;
wire   [8:0] temp_key_load_8_cast_fu_437_p1;
wire   [8:0] temp_key_load_2_cast_fu_434_p1;
wire   [8:0] temp_key_load_10_cast_fu_451_p1;
wire   [8:0] temp_key_load_4_cast_fu_447_p1;
wire   [9:0] p_cast4_fu_469_p1;
wire   [9:0] temp_key_load_15_cast_fu_465_p1;
wire   [9:0] zext_ln38_1_fu_478_p1;
wire   [9:0] zext_ln27_1_fu_461_p1;
wire   [8:0] temp_key_load_5_cast_fu_487_p1;
wire   [8:0] temp_key_load_17_cast8_fu_494_p1;
wire   [8:0] tmp1_fu_498_p2;
wire   [8:0] temp_key_load_11_cast_fu_490_p1;
wire   [8:0] tmp58_fu_504_p2;
wire   [12:0] tmp7_fu_518_p3;
wire   [9:0] p_cast5_fu_533_p1;
wire   [9:0] temp_key_load_14_cast_fu_529_p1;
wire   [9:0] tmp142_fu_536_p2;
wire   [11:0] tmp8_fu_542_p3;
wire   [11:0] zext_ln38_2_fu_550_p1;
wire   [13:0] tmp6_fu_510_p3;
wire   [13:0] tmp12_cast_fu_525_p1;
wire   [8:0] temp_key_load_12_cast_fu_565_p1;
wire   [8:0] temp_key_load_18_cast_fu_572_p1;
wire   [8:0] tmp_fu_576_p2;
wire   [9:0] tmp_cast_fu_582_p1;
wire   [9:0] p_cast_fu_569_p1;
wire   [9:0] p_cast3_fu_596_p1;
wire   [9:0] temp_key_load_16_cast_fu_592_p1;
wire    ap_CS_fsm_state16;
wire   [10:0] tmp3_fu_609_p3;
wire   [13:0] tmp9_fu_620_p3;
wire   [11:0] tmp3_cast_fu_616_p1;
wire   [11:0] zext_ln38_3_fu_605_p1;
wire   [11:0] add_ln41_2_fu_635_p2;
wire   [12:0] zext_ln41_1_fu_641_p1;
wire   [12:0] zext_ln41_fu_627_p1;
wire   [12:0] add_ln41_3_fu_645_p2;
wire   [13:0] zext_ln41_2_fu_651_p1;
wire   [13:0] add_ln41_1_fu_630_p2;
wire   [13:0] hash_4_fu_655_p2;
reg   [13:0] ap_return_preg;
reg   [14:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 15'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_return_preg = 14'd0;
end

encoding_hash_func_temp_key #(
    .DataWidth( 8 ),
    .AddressRange( 20 ),
    .AddressWidth( 5 ))
temp_key_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(temp_key_address0),
    .ce0(temp_key_ce0),
    .we0(temp_key_we0),
    .d0(temp_key_d0),
    .q0(temp_key_q0),
    .address1(temp_key_address1),
    .ce1(temp_key_ce1),
    .q1(temp_key_q1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((exitcond3_fu_353_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state3) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state3);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((exitcond3_fu_353_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_return_preg <= 14'd0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state16)) begin
            ap_return_preg <= hash_4_fu_655_p2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond3_fu_353_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        empty_reg_310 <= empty_45_fu_342_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        empty_reg_310 <= 5'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((exitcond3_fu_353_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
        i_reg_321 <= 8'd0;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln30_reg_685 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_reg_321 <= i_2_reg_680;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        reg_333 <= temp_key_q1;
    end else if (((1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state6))) begin
        reg_333 <= temp_key_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        add_ln41_reg_844[13 : 3] <= add_ln41_fu_559_p2[13 : 3];
        hash_7_reg_839 <= hash_7_fu_553_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        empty_47_reg_754 <= empty_47_fu_401_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        empty_48_reg_804 <= empty_48_fu_455_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        empty_49_reg_769 <= empty_49_fu_422_p2;
        hash_5_reg_774 <= hash_5_fu_428_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        empty_50_reg_789 <= empty_50_fu_441_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state13)) begin
        hash_6_reg_824 <= hash_6_fu_481_p2;
        tmp114_reg_819 <= tmp114_fu_472_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        i_2_reg_680 <= i_2_fu_359_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        icmp_ln30_reg_685 <= icmp_ln30_fu_369_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state7))) begin
        reg_338 <= temp_key_q1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state8)) begin
        temp_key_load_1_reg_724 <= temp_key_q0;
        temp_key_load_4_reg_734 <= temp_key_q1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        temp_key_load_2_reg_714 <= temp_key_q0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state15)) begin
        tmp210_reg_854 <= tmp210_fu_586_p2;
        tmp86_reg_859 <= tmp86_fu_599_p2;
    end
end

always @ (*) begin
    if ((icmp_ln30_fu_369_p2 == 1'd0)) begin
        ap_condition_pp0_exit_iter0_state3 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state3 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state16) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln30_reg_685 == 1'd1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_i_phi_fu_325_p4 = i_2_reg_680;
    end else begin
        ap_phi_mux_i_phi_fu_325_p4 = i_reg_321;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state16)) begin
        ap_return = hash_4_fu_655_p2;
    end else begin
        ap_return = ap_return_preg;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        key_ce0 = 1'b1;
    end else begin
        key_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state14)) begin
        temp_key_address0 = 64'd16;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        temp_key_address0 = 64'd14;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        temp_key_address0 = 64'd12;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        temp_key_address0 = 64'd10;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        temp_key_address0 = 64'd8;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        temp_key_address0 = 64'd6;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        temp_key_address0 = 64'd4;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        temp_key_address0 = 64'd2;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        temp_key_address0 = 64'd3;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        temp_key_address0 = 64'd1;
    end else if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        temp_key_address0 = zext_ln31_fu_388_p1;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        temp_key_address0 = p_cast6_fu_348_p1;
    end else begin
        temp_key_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state15)) begin
        temp_key_address1 = 64'd18;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        temp_key_address1 = 64'd19;
    end else if ((1'b1 == ap_CS_fsm_state13)) begin
        temp_key_address1 = 64'd17;
    end else if ((1'b1 == ap_CS_fsm_state12)) begin
        temp_key_address1 = 64'd15;
    end else if ((1'b1 == ap_CS_fsm_state11)) begin
        temp_key_address1 = 64'd13;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        temp_key_address1 = 64'd11;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        temp_key_address1 = 64'd9;
    end else if ((1'b1 == ap_CS_fsm_state8)) begin
        temp_key_address1 = 64'd7;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        temp_key_address1 = 64'd5;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        temp_key_address1 = 64'd0;
    end else begin
        temp_key_address1 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state8) | (1'b1 == ap_CS_fsm_state5) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        temp_key_ce0 = 1'b1;
    end else begin
        temp_key_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state11) | (1'b1 == ap_CS_fsm_state7) | (1'b1 == ap_CS_fsm_state12) | (1'b1 == ap_CS_fsm_state9) | (1'b1 == ap_CS_fsm_state6) | (1'b1 == ap_CS_fsm_state15) | (1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state13) | (1'b1 == ap_CS_fsm_state10) | (1'b1 == ap_CS_fsm_state8))) begin
        temp_key_ce1 = 1'b1;
    end else begin
        temp_key_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0))) begin
        temp_key_d0 = key_q0;
    end else if ((1'b1 == ap_CS_fsm_state2)) begin
        temp_key_d0 = 8'd0;
    end else begin
        temp_key_d0 = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (icmp_ln30_reg_685 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((exitcond3_fu_353_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2)))) begin
        temp_key_we0 = 1'b1;
    end else begin
        temp_key_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((exitcond3_fu_353_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln30_fu_369_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln30_fu_369_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state5 : begin
            ap_NS_fsm = ap_ST_fsm_state6;
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
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln31_fu_378_p2 = ($signed(sext_ln31_fu_374_p1) + $signed(key_offset));

assign add_ln41_1_fu_630_p2 = (add_ln41_reg_844 + tmp9_fu_620_p3);

assign add_ln41_2_fu_635_p2 = (tmp3_cast_fu_616_p1 + zext_ln38_3_fu_605_p1);

assign add_ln41_3_fu_645_p2 = (zext_ln41_1_fu_641_p1 + zext_ln41_fu_627_p1);

assign add_ln41_fu_559_p2 = (tmp6_fu_510_p3 + tmp12_cast_fu_525_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd8];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state13 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd12];

assign ap_CS_fsm_state15 = ap_CS_fsm[32'd13];

assign ap_CS_fsm_state16 = ap_CS_fsm[32'd14];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd7];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign empty_45_fu_342_p2 = (empty_reg_310 + 5'd1);

assign empty_47_fu_401_p2 = (temp_key_load_7_cast_fu_397_p1 + temp_key_load_1_cast_fu_393_p1);

assign empty_48_fu_455_p2 = (temp_key_load_10_cast_fu_451_p1 + temp_key_load_4_cast_fu_447_p1);

assign empty_49_fu_422_p2 = (temp_key_load_9_cast_fu_418_p1 + temp_key_load_3_cast_fu_415_p1);

assign empty_50_fu_441_p2 = (temp_key_load_8_cast_fu_437_p1 + temp_key_load_2_cast_fu_434_p1);

assign exitcond3_fu_353_p2 = ((empty_reg_310 == 5'd20) ? 1'b1 : 1'b0);

assign hash_4_fu_655_p2 = (zext_ln41_2_fu_651_p1 + add_ln41_1_fu_630_p2);

assign hash_5_fu_428_p2 = (zext_ln38_fu_411_p1 + zext_ln27_fu_407_p1);

assign hash_6_fu_481_p2 = (zext_ln38_1_fu_478_p1 + zext_ln27_1_fu_461_p1);

assign hash_7_fu_553_p2 = (tmp8_fu_542_p3 + zext_ln38_2_fu_550_p1);

assign i_2_fu_359_p2 = ($signed(ap_phi_mux_i_phi_fu_325_p4) + $signed(8'd1));

assign icmp_ln30_fu_369_p2 = (($signed(sext_ln30_fu_365_p1) < $signed(len)) ? 1'b1 : 1'b0);

assign key_address0 = zext_ln31_1_fu_383_p1;

assign p_cast3_fu_596_p1 = empty_48_reg_804;

assign p_cast4_fu_469_p1 = empty_49_reg_769;

assign p_cast5_fu_533_p1 = empty_50_reg_789;

assign p_cast6_fu_348_p1 = empty_reg_310;

assign p_cast_fu_569_p1 = empty_47_reg_754;

assign sext_ln30_fu_365_p1 = ap_phi_mux_i_phi_fu_325_p4;

assign sext_ln31_fu_374_p1 = ap_phi_mux_i_phi_fu_325_p4;

assign temp_key_load_10_cast_fu_451_p1 = temp_key_q0;

assign temp_key_load_11_cast_fu_490_p1 = reg_338;

assign temp_key_load_12_cast_fu_565_p1 = reg_333;

assign temp_key_load_14_cast_fu_529_p1 = temp_key_q0;

assign temp_key_load_15_cast_fu_465_p1 = temp_key_q1;

assign temp_key_load_16_cast_fu_592_p1 = temp_key_q0;

assign temp_key_load_17_cast8_fu_494_p1 = temp_key_q1;

assign temp_key_load_18_cast_fu_572_p1 = temp_key_q1;

assign temp_key_load_1_cast_fu_393_p1 = reg_333;

assign temp_key_load_2_cast_fu_434_p1 = temp_key_load_1_reg_724;

assign temp_key_load_3_cast_fu_415_p1 = temp_key_load_2_reg_714;

assign temp_key_load_4_cast_fu_447_p1 = reg_333;

assign temp_key_load_5_cast_fu_487_p1 = temp_key_load_4_reg_734;

assign temp_key_load_7_cast_fu_397_p1 = temp_key_q1;

assign temp_key_load_8_cast_fu_437_p1 = temp_key_q0;

assign temp_key_load_9_cast_fu_418_p1 = temp_key_q1;

assign tmp114_fu_472_p2 = (p_cast4_fu_469_p1 + temp_key_load_15_cast_fu_465_p1);

assign tmp12_cast_fu_525_p1 = tmp7_fu_518_p3;

assign tmp142_fu_536_p2 = (p_cast5_fu_533_p1 + temp_key_load_14_cast_fu_529_p1);

assign tmp1_fu_498_p2 = (temp_key_load_5_cast_fu_487_p1 + temp_key_load_17_cast8_fu_494_p1);

assign tmp210_fu_586_p2 = (tmp_cast_fu_582_p1 + p_cast_fu_569_p1);

assign tmp3_cast_fu_616_p1 = tmp3_fu_609_p3;

assign tmp3_fu_609_p3 = {{tmp210_reg_854}, {1'd0}};

assign tmp58_fu_504_p2 = (tmp1_fu_498_p2 + temp_key_load_11_cast_fu_490_p1);

assign tmp6_fu_510_p3 = {{tmp58_fu_504_p2}, {5'd0}};

assign tmp7_fu_518_p3 = {{tmp114_reg_819}, {3'd0}};

assign tmp86_fu_599_p2 = (p_cast3_fu_596_p1 + temp_key_load_16_cast_fu_592_p1);

assign tmp8_fu_542_p3 = {{tmp142_fu_536_p2}, {2'd0}};

assign tmp9_fu_620_p3 = {{tmp86_reg_859}, {4'd0}};

assign tmp_cast_fu_582_p1 = tmp_fu_576_p2;

assign tmp_fu_576_p2 = (temp_key_load_12_cast_fu_565_p1 + temp_key_load_18_cast_fu_572_p1);

assign zext_ln27_1_fu_461_p1 = temp_key_q0;

assign zext_ln27_fu_407_p1 = reg_338;

assign zext_ln31_1_fu_383_p1 = add_ln31_fu_378_p2;

assign zext_ln31_fu_388_p1 = $unsigned(i_reg_321);

assign zext_ln38_1_fu_478_p1 = hash_5_reg_774;

assign zext_ln38_2_fu_550_p1 = hash_6_reg_824;

assign zext_ln38_3_fu_605_p1 = temp_key_q1;

assign zext_ln38_fu_411_p1 = temp_key_q0;

assign zext_ln41_1_fu_641_p1 = add_ln41_2_fu_635_p2;

assign zext_ln41_2_fu_651_p1 = add_ln41_3_fu_645_p2;

assign zext_ln41_fu_627_p1 = hash_7_reg_839;

always @ (posedge ap_clk) begin
    add_ln41_reg_844[2:0] <= 3'b000;
end

endmodule //encoding_hash_func
