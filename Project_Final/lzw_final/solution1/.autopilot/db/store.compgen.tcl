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
    id 32 \
    name outstream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_outstream \
    op interface \
    ports { outstream_dout { I 16 vector } outstream_empty_n { I 1 bit } outstream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name p2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p2 \
    op interface \
    ports { m_axi_p2_AWVALID { O 1 bit } m_axi_p2_AWREADY { I 1 bit } m_axi_p2_AWADDR { O 64 vector } m_axi_p2_AWID { O 1 vector } m_axi_p2_AWLEN { O 32 vector } m_axi_p2_AWSIZE { O 3 vector } m_axi_p2_AWBURST { O 2 vector } m_axi_p2_AWLOCK { O 2 vector } m_axi_p2_AWCACHE { O 4 vector } m_axi_p2_AWPROT { O 3 vector } m_axi_p2_AWQOS { O 4 vector } m_axi_p2_AWREGION { O 4 vector } m_axi_p2_AWUSER { O 1 vector } m_axi_p2_WVALID { O 1 bit } m_axi_p2_WREADY { I 1 bit } m_axi_p2_WDATA { O 16 vector } m_axi_p2_WSTRB { O 2 vector } m_axi_p2_WLAST { O 1 bit } m_axi_p2_WID { O 1 vector } m_axi_p2_WUSER { O 1 vector } m_axi_p2_ARVALID { O 1 bit } m_axi_p2_ARREADY { I 1 bit } m_axi_p2_ARADDR { O 64 vector } m_axi_p2_ARID { O 1 vector } m_axi_p2_ARLEN { O 32 vector } m_axi_p2_ARSIZE { O 3 vector } m_axi_p2_ARBURST { O 2 vector } m_axi_p2_ARLOCK { O 2 vector } m_axi_p2_ARCACHE { O 4 vector } m_axi_p2_ARPROT { O 3 vector } m_axi_p2_ARQOS { O 4 vector } m_axi_p2_ARREGION { O 4 vector } m_axi_p2_ARUSER { O 1 vector } m_axi_p2_RVALID { I 1 bit } m_axi_p2_RREADY { O 1 bit } m_axi_p2_RDATA { I 16 vector } m_axi_p2_RLAST { I 1 bit } m_axi_p2_RID { I 1 vector } m_axi_p2_RUSER { I 1 vector } m_axi_p2_RRESP { I 2 vector } m_axi_p2_BVALID { I 1 bit } m_axi_p2_BREADY { O 1 bit } m_axi_p2_BRESP { I 2 vector } m_axi_p2_BID { I 1 vector } m_axi_p2_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name outlen_stream \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_outlen_stream \
    op interface \
    ports { outlen_stream_dout { I 32 vector } outlen_stream_empty_n { I 1 bit } outlen_stream_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name p3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_p3 \
    op interface \
    ports { m_axi_p3_AWVALID { O 1 bit } m_axi_p3_AWREADY { I 1 bit } m_axi_p3_AWADDR { O 64 vector } m_axi_p3_AWID { O 1 vector } m_axi_p3_AWLEN { O 32 vector } m_axi_p3_AWSIZE { O 3 vector } m_axi_p3_AWBURST { O 2 vector } m_axi_p3_AWLOCK { O 2 vector } m_axi_p3_AWCACHE { O 4 vector } m_axi_p3_AWPROT { O 3 vector } m_axi_p3_AWQOS { O 4 vector } m_axi_p3_AWREGION { O 4 vector } m_axi_p3_AWUSER { O 1 vector } m_axi_p3_WVALID { O 1 bit } m_axi_p3_WREADY { I 1 bit } m_axi_p3_WDATA { O 32 vector } m_axi_p3_WSTRB { O 4 vector } m_axi_p3_WLAST { O 1 bit } m_axi_p3_WID { O 1 vector } m_axi_p3_WUSER { O 1 vector } m_axi_p3_ARVALID { O 1 bit } m_axi_p3_ARREADY { I 1 bit } m_axi_p3_ARADDR { O 64 vector } m_axi_p3_ARID { O 1 vector } m_axi_p3_ARLEN { O 32 vector } m_axi_p3_ARSIZE { O 3 vector } m_axi_p3_ARBURST { O 2 vector } m_axi_p3_ARLOCK { O 2 vector } m_axi_p3_ARCACHE { O 4 vector } m_axi_p3_ARPROT { O 3 vector } m_axi_p3_ARQOS { O 4 vector } m_axi_p3_ARREGION { O 4 vector } m_axi_p3_ARUSER { O 1 vector } m_axi_p3_RVALID { I 1 bit } m_axi_p3_RREADY { O 1 bit } m_axi_p3_RDATA { I 32 vector } m_axi_p3_RLAST { I 1 bit } m_axi_p3_RID { I 1 vector } m_axi_p3_RUSER { I 1 vector } m_axi_p3_RRESP { I 2 vector } m_axi_p3_BVALID { I 1 bit } m_axi_p3_BREADY { O 1 bit } m_axi_p3_BRESP { I 2 vector } m_axi_p3_BID { I 1 vector } m_axi_p3_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name outArr \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_outArr \
    op interface \
    ports { outArr_dout { I 64 vector } outArr_empty_n { I 1 bit } outArr_read { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name len \
    type fifo \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_len \
    op interface \
    ports { len_dout { I 64 vector } len_empty_n { I 1 bit } len_read { O 1 bit } } \
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
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } ap_continue { I 1 bit } } \
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


