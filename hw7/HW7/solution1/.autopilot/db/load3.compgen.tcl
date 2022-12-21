# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name p0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p0 \
    op interface \
    ports { m_axi_p0_AWVALID { O 1 bit } m_axi_p0_AWREADY { I 1 bit } m_axi_p0_AWADDR { O 64 vector } m_axi_p0_AWID { O 1 vector } m_axi_p0_AWLEN { O 32 vector } m_axi_p0_AWSIZE { O 3 vector } m_axi_p0_AWBURST { O 2 vector } m_axi_p0_AWLOCK { O 2 vector } m_axi_p0_AWCACHE { O 4 vector } m_axi_p0_AWPROT { O 3 vector } m_axi_p0_AWQOS { O 4 vector } m_axi_p0_AWREGION { O 4 vector } m_axi_p0_AWUSER { O 1 vector } m_axi_p0_WVALID { O 1 bit } m_axi_p0_WREADY { I 1 bit } m_axi_p0_WDATA { O 512 vector } m_axi_p0_WSTRB { O 64 vector } m_axi_p0_WLAST { O 1 bit } m_axi_p0_WID { O 1 vector } m_axi_p0_WUSER { O 1 vector } m_axi_p0_ARVALID { O 1 bit } m_axi_p0_ARREADY { I 1 bit } m_axi_p0_ARADDR { O 64 vector } m_axi_p0_ARID { O 1 vector } m_axi_p0_ARLEN { O 32 vector } m_axi_p0_ARSIZE { O 3 vector } m_axi_p0_ARBURST { O 2 vector } m_axi_p0_ARLOCK { O 2 vector } m_axi_p0_ARCACHE { O 4 vector } m_axi_p0_ARPROT { O 3 vector } m_axi_p0_ARQOS { O 4 vector } m_axi_p0_ARREGION { O 4 vector } m_axi_p0_ARUSER { O 1 vector } m_axi_p0_RVALID { I 1 bit } m_axi_p0_RREADY { O 1 bit } m_axi_p0_RDATA { I 512 vector } m_axi_p0_RLAST { I 1 bit } m_axi_p0_RID { I 1 vector } m_axi_p0_RUSER { I 1 vector } m_axi_p0_RRESP { I 2 vector } m_axi_p0_BVALID { I 1 bit } m_axi_p0_BREADY { O 1 bit } m_axi_p0_BRESP { I 2 vector } m_axi_p0_BID { I 1 vector } m_axi_p0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name Input_r \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Input_r \
    op interface \
    ports { Input_r_dout { I 64 vector } Input_r_empty_n { I 1 bit } Input_r_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name Output_r \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_Output_r \
    op interface \
    ports { Output_r_dout { I 64 vector } Output_r_empty_n { I 1 bit } Output_r_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name Output_out \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_Output_out \
    op interface \
    ports { Output_out_din { O 64 vector } Output_out_full_n { I 1 bit } Output_out_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name input_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_input_stream \
    op interface \
    ports { input_stream_din { O 8 vector } input_stream_full_n { I 1 bit } input_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


