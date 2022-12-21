set moduleName load6
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {load6}
set C_modelType { void 0 }
set C_modelArgList {
	{ p0 int 8 regular {axi_master 0}  }
	{ instream int 8 regular {fifo 1 volatile }  }
	{ p1 int 32 regular {axi_master 0}  }
	{ inlen_stream int 32 regular {fifo 1 volatile }  }
	{ input_r int 64 regular  }
	{ len int 64 regular  }
	{ output_compress int 64 regular  }
	{ output_length int 64 regular  }
	{ output_compress_out int 64 regular {fifo 1}  }
	{ output_length_out int 64 regular {fifo 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p0", "interface" : "axi_master", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "instream", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "p1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "inlen_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "input_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "len", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_compress", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_length", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_compress_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_length_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 116
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ start_full_n sc_in sc_logic 1 signal -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ start_out sc_out sc_logic 1 signal -1 } 
	{ start_write sc_out sc_logic 1 signal -1 } 
	{ m_axi_p0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_p0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_p0_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_p0_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_p0_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_p0_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_p0_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_p0_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_p0_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_p0_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_WDATA sc_out sc_lv 8 signal 0 } 
	{ m_axi_p0_WSTRB sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_p0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_p0_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_p0_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_p0_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_p0_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_p0_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_p0_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_p0_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_p0_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_RDATA sc_in sc_lv 8 signal 0 } 
	{ m_axi_p0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_p0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_p0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_p0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_p0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_p0_BUSER sc_in sc_lv 1 signal 0 } 
	{ instream_din sc_out sc_lv 8 signal 1 } 
	{ instream_full_n sc_in sc_logic 1 signal 1 } 
	{ instream_write sc_out sc_logic 1 signal 1 } 
	{ m_axi_p1_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_p1_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_p1_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_p1_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_p1_AWLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_p1_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_p1_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_p1_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_p1_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_p1_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_p1_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_p1_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_p1_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_p1_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_p1_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_p1_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_p1_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_p1_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_p1_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_p1_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_p1_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_p1_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_p1_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_p1_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_p1_ARLEN sc_out sc_lv 32 signal 2 } 
	{ m_axi_p1_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_p1_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_p1_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_p1_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_p1_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_p1_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_p1_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_p1_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_p1_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_p1_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_p1_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_p1_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_p1_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_p1_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_p1_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_p1_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_p1_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_p1_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_p1_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_p1_BUSER sc_in sc_lv 1 signal 2 } 
	{ inlen_stream_din sc_out sc_lv 32 signal 3 } 
	{ inlen_stream_full_n sc_in sc_logic 1 signal 3 } 
	{ inlen_stream_write sc_out sc_logic 1 signal 3 } 
	{ input_r sc_in sc_lv 64 signal 4 } 
	{ len sc_in sc_lv 64 signal 5 } 
	{ output_compress sc_in sc_lv 64 signal 6 } 
	{ output_length sc_in sc_lv 64 signal 7 } 
	{ output_compress_out_din sc_out sc_lv 64 signal 8 } 
	{ output_compress_out_full_n sc_in sc_logic 1 signal 8 } 
	{ output_compress_out_write sc_out sc_logic 1 signal 8 } 
	{ output_length_out_din sc_out sc_lv 64 signal 9 } 
	{ output_length_out_full_n sc_in sc_logic 1 signal 9 } 
	{ output_length_out_write sc_out sc_logic 1 signal 9 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "start_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_full_n", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "start_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_out", "role": "default" }} , 
 	{ "name": "start_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "start_write", "role": "default" }} , 
 	{ "name": "m_axi_p0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_p0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_p0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_p0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "AWID" }} , 
 	{ "name": "m_axi_p0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p0", "role": "AWLEN" }} , 
 	{ "name": "m_axi_p0_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p0", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_p0_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p0", "role": "AWBURST" }} , 
 	{ "name": "m_axi_p0_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p0", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_p0_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p0", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_p0_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p0", "role": "AWPROT" }} , 
 	{ "name": "m_axi_p0_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p0", "role": "AWQOS" }} , 
 	{ "name": "m_axi_p0_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p0", "role": "AWREGION" }} , 
 	{ "name": "m_axi_p0_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "AWUSER" }} , 
 	{ "name": "m_axi_p0_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "WVALID" }} , 
 	{ "name": "m_axi_p0_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "WREADY" }} , 
 	{ "name": "m_axi_p0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p0", "role": "WDATA" }} , 
 	{ "name": "m_axi_p0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_p0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "WLAST" }} , 
 	{ "name": "m_axi_p0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "WID" }} , 
 	{ "name": "m_axi_p0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "WUSER" }} , 
 	{ "name": "m_axi_p0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_p0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_p0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_p0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "ARID" }} , 
 	{ "name": "m_axi_p0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p0", "role": "ARLEN" }} , 
 	{ "name": "m_axi_p0_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p0", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_p0_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p0", "role": "ARBURST" }} , 
 	{ "name": "m_axi_p0_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p0", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_p0_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p0", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_p0_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p0", "role": "ARPROT" }} , 
 	{ "name": "m_axi_p0_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p0", "role": "ARQOS" }} , 
 	{ "name": "m_axi_p0_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p0", "role": "ARREGION" }} , 
 	{ "name": "m_axi_p0_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "ARUSER" }} , 
 	{ "name": "m_axi_p0_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "RVALID" }} , 
 	{ "name": "m_axi_p0_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "RREADY" }} , 
 	{ "name": "m_axi_p0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p0", "role": "RDATA" }} , 
 	{ "name": "m_axi_p0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "RLAST" }} , 
 	{ "name": "m_axi_p0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "RID" }} , 
 	{ "name": "m_axi_p0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "RUSER" }} , 
 	{ "name": "m_axi_p0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p0", "role": "RRESP" }} , 
 	{ "name": "m_axi_p0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "BVALID" }} , 
 	{ "name": "m_axi_p0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "BREADY" }} , 
 	{ "name": "m_axi_p0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p0", "role": "BRESP" }} , 
 	{ "name": "m_axi_p0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "BID" }} , 
 	{ "name": "m_axi_p0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "BUSER" }} , 
 	{ "name": "instream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "instream", "role": "din" }} , 
 	{ "name": "instream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "instream", "role": "full_n" }} , 
 	{ "name": "instream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "instream", "role": "write" }} , 
 	{ "name": "m_axi_p1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_p1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_p1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_p1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "AWID" }} , 
 	{ "name": "m_axi_p1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p1", "role": "AWLEN" }} , 
 	{ "name": "m_axi_p1_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p1", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_p1_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "AWBURST" }} , 
 	{ "name": "m_axi_p1_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_p1_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p1", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_p1_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p1", "role": "AWPROT" }} , 
 	{ "name": "m_axi_p1_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p1", "role": "AWQOS" }} , 
 	{ "name": "m_axi_p1_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p1", "role": "AWREGION" }} , 
 	{ "name": "m_axi_p1_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "AWUSER" }} , 
 	{ "name": "m_axi_p1_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "WVALID" }} , 
 	{ "name": "m_axi_p1_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "WREADY" }} , 
 	{ "name": "m_axi_p1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p1", "role": "WDATA" }} , 
 	{ "name": "m_axi_p1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_p1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "WLAST" }} , 
 	{ "name": "m_axi_p1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "WID" }} , 
 	{ "name": "m_axi_p1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "WUSER" }} , 
 	{ "name": "m_axi_p1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_p1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_p1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_p1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "ARID" }} , 
 	{ "name": "m_axi_p1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p1", "role": "ARLEN" }} , 
 	{ "name": "m_axi_p1_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p1", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_p1_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "ARBURST" }} , 
 	{ "name": "m_axi_p1_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_p1_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p1", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_p1_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p1", "role": "ARPROT" }} , 
 	{ "name": "m_axi_p1_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p1", "role": "ARQOS" }} , 
 	{ "name": "m_axi_p1_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p1", "role": "ARREGION" }} , 
 	{ "name": "m_axi_p1_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "ARUSER" }} , 
 	{ "name": "m_axi_p1_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RVALID" }} , 
 	{ "name": "m_axi_p1_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RREADY" }} , 
 	{ "name": "m_axi_p1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p1", "role": "RDATA" }} , 
 	{ "name": "m_axi_p1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RLAST" }} , 
 	{ "name": "m_axi_p1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RID" }} , 
 	{ "name": "m_axi_p1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RUSER" }} , 
 	{ "name": "m_axi_p1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "RRESP" }} , 
 	{ "name": "m_axi_p1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BVALID" }} , 
 	{ "name": "m_axi_p1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BREADY" }} , 
 	{ "name": "m_axi_p1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "BRESP" }} , 
 	{ "name": "m_axi_p1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BID" }} , 
 	{ "name": "m_axi_p1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BUSER" }} , 
 	{ "name": "inlen_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inlen_stream", "role": "din" }} , 
 	{ "name": "inlen_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inlen_stream", "role": "full_n" }} , 
 	{ "name": "inlen_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inlen_stream", "role": "write" }} , 
 	{ "name": "input_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_r", "role": "default" }} , 
 	{ "name": "len", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "len", "role": "default" }} , 
 	{ "name": "output_compress", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_compress", "role": "default" }} , 
 	{ "name": "output_length", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length", "role": "default" }} , 
 	{ "name": "output_compress_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_compress_out", "role": "din" }} , 
 	{ "name": "output_compress_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_compress_out", "role": "full_n" }} , 
 	{ "name": "output_compress_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_compress_out", "role": "write" }} , 
 	{ "name": "output_length_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "output_length_out", "role": "din" }} , 
 	{ "name": "output_length_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length_out", "role": "full_n" }} , 
 	{ "name": "output_length_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_length_out", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "load6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "73", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "p0", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "p0_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "p0_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "instream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "instream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "p1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "p1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "inlen_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inlen_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "len", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_compress", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_compress_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_compress_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_out_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	load6 {
		p0 {Type I LastRead 143 FirstWrite -1}
		instream {Type O LastRead -1 FirstWrite 144}
		p1 {Type I LastRead 70 FirstWrite -1}
		inlen_stream {Type O LastRead -1 FirstWrite 143}
		input_r {Type I LastRead 72 FirstWrite -1}
		len {Type I LastRead 0 FirstWrite -1}
		output_compress {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		output_compress_out {Type O LastRead -1 FirstWrite 0}
		output_length_out {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "73", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "73", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p0 { m_axi {  { m_axi_p0_AWVALID VALID 1 1 }  { m_axi_p0_AWREADY READY 0 1 }  { m_axi_p0_AWADDR ADDR 1 64 }  { m_axi_p0_AWID ID 1 1 }  { m_axi_p0_AWLEN LEN 1 32 }  { m_axi_p0_AWSIZE SIZE 1 3 }  { m_axi_p0_AWBURST BURST 1 2 }  { m_axi_p0_AWLOCK LOCK 1 2 }  { m_axi_p0_AWCACHE CACHE 1 4 }  { m_axi_p0_AWPROT PROT 1 3 }  { m_axi_p0_AWQOS QOS 1 4 }  { m_axi_p0_AWREGION REGION 1 4 }  { m_axi_p0_AWUSER USER 1 1 }  { m_axi_p0_WVALID VALID 1 1 }  { m_axi_p0_WREADY READY 0 1 }  { m_axi_p0_WDATA DATA 1 8 }  { m_axi_p0_WSTRB STRB 1 1 }  { m_axi_p0_WLAST LAST 1 1 }  { m_axi_p0_WID ID 1 1 }  { m_axi_p0_WUSER USER 1 1 }  { m_axi_p0_ARVALID VALID 1 1 }  { m_axi_p0_ARREADY READY 0 1 }  { m_axi_p0_ARADDR ADDR 1 64 }  { m_axi_p0_ARID ID 1 1 }  { m_axi_p0_ARLEN LEN 1 32 }  { m_axi_p0_ARSIZE SIZE 1 3 }  { m_axi_p0_ARBURST BURST 1 2 }  { m_axi_p0_ARLOCK LOCK 1 2 }  { m_axi_p0_ARCACHE CACHE 1 4 }  { m_axi_p0_ARPROT PROT 1 3 }  { m_axi_p0_ARQOS QOS 1 4 }  { m_axi_p0_ARREGION REGION 1 4 }  { m_axi_p0_ARUSER USER 1 1 }  { m_axi_p0_RVALID VALID 0 1 }  { m_axi_p0_RREADY READY 1 1 }  { m_axi_p0_RDATA DATA 0 8 }  { m_axi_p0_RLAST LAST 0 1 }  { m_axi_p0_RID ID 0 1 }  { m_axi_p0_RUSER USER 0 1 }  { m_axi_p0_RRESP RESP 0 2 }  { m_axi_p0_BVALID VALID 0 1 }  { m_axi_p0_BREADY READY 1 1 }  { m_axi_p0_BRESP RESP 0 2 }  { m_axi_p0_BID ID 0 1 }  { m_axi_p0_BUSER USER 0 1 } } }
	instream { ap_fifo {  { instream_din fifo_data 1 8 }  { instream_full_n fifo_status 0 1 }  { instream_write fifo_update 1 1 } } }
	p1 { m_axi {  { m_axi_p1_AWVALID VALID 1 1 }  { m_axi_p1_AWREADY READY 0 1 }  { m_axi_p1_AWADDR ADDR 1 64 }  { m_axi_p1_AWID ID 1 1 }  { m_axi_p1_AWLEN LEN 1 32 }  { m_axi_p1_AWSIZE SIZE 1 3 }  { m_axi_p1_AWBURST BURST 1 2 }  { m_axi_p1_AWLOCK LOCK 1 2 }  { m_axi_p1_AWCACHE CACHE 1 4 }  { m_axi_p1_AWPROT PROT 1 3 }  { m_axi_p1_AWQOS QOS 1 4 }  { m_axi_p1_AWREGION REGION 1 4 }  { m_axi_p1_AWUSER USER 1 1 }  { m_axi_p1_WVALID VALID 1 1 }  { m_axi_p1_WREADY READY 0 1 }  { m_axi_p1_WDATA DATA 1 32 }  { m_axi_p1_WSTRB STRB 1 4 }  { m_axi_p1_WLAST LAST 1 1 }  { m_axi_p1_WID ID 1 1 }  { m_axi_p1_WUSER USER 1 1 }  { m_axi_p1_ARVALID VALID 1 1 }  { m_axi_p1_ARREADY READY 0 1 }  { m_axi_p1_ARADDR ADDR 1 64 }  { m_axi_p1_ARID ID 1 1 }  { m_axi_p1_ARLEN LEN 1 32 }  { m_axi_p1_ARSIZE SIZE 1 3 }  { m_axi_p1_ARBURST BURST 1 2 }  { m_axi_p1_ARLOCK LOCK 1 2 }  { m_axi_p1_ARCACHE CACHE 1 4 }  { m_axi_p1_ARPROT PROT 1 3 }  { m_axi_p1_ARQOS QOS 1 4 }  { m_axi_p1_ARREGION REGION 1 4 }  { m_axi_p1_ARUSER USER 1 1 }  { m_axi_p1_RVALID VALID 0 1 }  { m_axi_p1_RREADY READY 1 1 }  { m_axi_p1_RDATA DATA 0 32 }  { m_axi_p1_RLAST LAST 0 1 }  { m_axi_p1_RID ID 0 1 }  { m_axi_p1_RUSER USER 0 1 }  { m_axi_p1_RRESP RESP 0 2 }  { m_axi_p1_BVALID VALID 0 1 }  { m_axi_p1_BREADY READY 1 1 }  { m_axi_p1_BRESP RESP 0 2 }  { m_axi_p1_BID ID 0 1 }  { m_axi_p1_BUSER USER 0 1 } } }
	inlen_stream { ap_fifo {  { inlen_stream_din fifo_data 1 32 }  { inlen_stream_full_n fifo_status 0 1 }  { inlen_stream_write fifo_update 1 1 } } }
	input_r { ap_none {  { input_r in_data 0 64 } } }
	len { ap_none {  { len in_data 0 64 } } }
	output_compress { ap_none {  { output_compress in_data 0 64 } } }
	output_length { ap_none {  { output_length in_data 0 64 } } }
	output_compress_out { ap_fifo {  { output_compress_out_din fifo_data 1 64 }  { output_compress_out_full_n fifo_status 0 1 }  { output_compress_out_write fifo_update 1 1 } } }
	output_length_out { ap_fifo {  { output_length_out_din fifo_data 1 64 }  { output_length_out_full_n fifo_status 0 1 }  { output_length_out_write fifo_update 1 1 } } }
}
