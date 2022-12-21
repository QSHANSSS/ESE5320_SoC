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
    id 1 \
    name p0 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p0 \
    op interface \
    ports { m_axi_p0_AWVALID { O 1 bit } m_axi_p0_AWREADY { I 1 bit } m_axi_p0_AWADDR { O 64 vector } m_axi_p0_AWID { O 1 vector } m_axi_p0_AWLEN { O 32 vector } m_axi_p0_AWSIZE { O 3 vector } m_axi_p0_AWBURST { O 2 vector } m_axi_p0_AWLOCK { O 2 vector } m_axi_p0_AWCACHE { O 4 vector } m_axi_p0_AWPROT { O 3 vector } m_axi_p0_AWQOS { O 4 vector } m_axi_p0_AWREGION { O 4 vector } m_axi_p0_AWUSER { O 1 vector } m_axi_p0_WVALID { O 1 bit } m_axi_p0_WREADY { I 1 bit } m_axi_p0_WDATA { O 8 vector } m_axi_p0_WSTRB { O 1 vector } m_axi_p0_WLAST { O 1 bit } m_axi_p0_WID { O 1 vector } m_axi_p0_WUSER { O 1 vector } m_axi_p0_ARVALID { O 1 bit } m_axi_p0_ARREADY { I 1 bit } m_axi_p0_ARADDR { O 64 vector } m_axi_p0_ARID { O 1 vector } m_axi_p0_ARLEN { O 32 vector } m_axi_p0_ARSIZE { O 3 vector } m_axi_p0_ARBURST { O 2 vector } m_axi_p0_ARLOCK { O 2 vector } m_axi_p0_ARCACHE { O 4 vector } m_axi_p0_ARPROT { O 3 vector } m_axi_p0_ARQOS { O 4 vector } m_axi_p0_ARREGION { O 4 vector } m_axi_p0_ARUSER { O 1 vector } m_axi_p0_RVALID { I 1 bit } m_axi_p0_RREADY { O 1 bit } m_axi_p0_RDATA { I 8 vector } m_axi_p0_RLAST { I 1 bit } m_axi_p0_RID { I 1 vector } m_axi_p0_RUSER { I 1 vector } m_axi_p0_RRESP { I 2 vector } m_axi_p0_BVALID { I 1 bit } m_axi_p0_BREADY { O 1 bit } m_axi_p0_BRESP { I 2 vector } m_axi_p0_BID { I 1 vector } m_axi_p0_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name instream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_instream \
    op interface \
    ports { instream_din { O 8 vector } instream_full_n { I 1 bit } instream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name p1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p1 \
    op interface \
    ports { m_axi_p1_AWVALID { O 1 bit } m_axi_p1_AWREADY { I 1 bit } m_axi_p1_AWADDR { O 64 vector } m_axi_p1_AWID { O 1 vector } m_axi_p1_AWLEN { O 32 vector } m_axi_p1_AWSIZE { O 3 vector } m_axi_p1_AWBURST { O 2 vector } m_axi_p1_AWLOCK { O 2 vector } m_axi_p1_AWCACHE { O 4 vector } m_axi_p1_AWPROT { O 3 vector } m_axi_p1_AWQOS { O 4 vector } m_axi_p1_AWREGION { O 4 vector } m_axi_p1_AWUSER { O 1 vector } m_axi_p1_WVALID { O 1 bit } m_axi_p1_WREADY { I 1 bit } m_axi_p1_WDATA { O 32 vector } m_axi_p1_WSTRB { O 4 vector } m_axi_p1_WLAST { O 1 bit } m_axi_p1_WID { O 1 vector } m_axi_p1_WUSER { O 1 vector } m_axi_p1_ARVALID { O 1 bit } m_axi_p1_ARREADY { I 1 bit } m_axi_p1_ARADDR { O 64 vector } m_axi_p1_ARID { O 1 vector } m_axi_p1_ARLEN { O 32 vector } m_axi_p1_ARSIZE { O 3 vector } m_axi_p1_ARBURST { O 2 vector } m_axi_p1_ARLOCK { O 2 vector } m_axi_p1_ARCACHE { O 4 vector } m_axi_p1_ARPROT { O 3 vector } m_axi_p1_ARQOS { O 4 vector } m_axi_p1_ARREGION { O 4 vector } m_axi_p1_ARUSER { O 1 vector } m_axi_p1_RVALID { I 1 bit } m_axi_p1_RREADY { O 1 bit } m_axi_p1_RDATA { I 32 vector } m_axi_p1_RLAST { I 1 bit } m_axi_p1_RID { I 1 vector } m_axi_p1_RUSER { I 1 vector } m_axi_p1_RRESP { I 2 vector } m_axi_p1_BVALID { I 1 bit } m_axi_p1_BREADY { O 1 bit } m_axi_p1_BRESP { I 2 vector } m_axi_p1_BID { I 1 vector } m_axi_p1_BUSER { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name inlen_stream \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_inlen_stream \
    op interface \
    ports { inlen_stream_din { O 32 vector } inlen_stream_full_n { I 1 bit } inlen_stream_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name input_r \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_input_r \
    op interface \
    ports { input_r { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name len \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_len \
    op interface \
    ports { len { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name output_compress \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_compress \
    op interface \
    ports { output_compress { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name output_length \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_output_length \
    op interface \
    ports { output_length { I 64 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name output_compress_out \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_output_compress_out \
    op interface \
    ports { output_compress_out_din { O 64 vector } output_compress_out_full_n { I 1 bit } output_compress_out_write { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name output_length_out \
    type fifo \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_output_length_out \
    op interface \
    ports { output_length_out_din { O 64 vector } output_length_out_full_n { I 1 bit } output_length_out_write { O 1 bit } } \
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


