set moduleName store
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
set C_modelName {store}
set C_modelType { void 0 }
set C_modelArgList {
	{ outstream int 16 regular {fifo 0 volatile }  }
	{ p2 int 16 regular {axi_master 1}  }
	{ outlen_stream int 32 regular {fifo 0 volatile }  }
	{ p3 int 32 regular {axi_master 1}  }
	{ outArr int 64 regular {fifo 0}  }
	{ len int 64 regular {fifo 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "outstream", "interface" : "fifo", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "p2", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outlen_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "p3", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outArr", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "len", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 109
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ outstream_dout sc_in sc_lv 16 signal 0 } 
	{ outstream_empty_n sc_in sc_logic 1 signal 0 } 
	{ outstream_read sc_out sc_logic 1 signal 0 } 
	{ m_axi_p2_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_p2_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_p2_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_p2_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_p2_AWLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_p2_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_p2_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_p2_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_p2_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_p2_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_p2_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_p2_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_p2_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_p2_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_p2_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_p2_WDATA sc_out sc_lv 16 signal 1 } 
	{ m_axi_p2_WSTRB sc_out sc_lv 2 signal 1 } 
	{ m_axi_p2_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_p2_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_p2_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_p2_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_p2_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_p2_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_p2_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_p2_ARLEN sc_out sc_lv 32 signal 1 } 
	{ m_axi_p2_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_p2_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_p2_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_p2_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_p2_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_p2_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_p2_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_p2_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_p2_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_p2_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_p2_RDATA sc_in sc_lv 16 signal 1 } 
	{ m_axi_p2_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_p2_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_p2_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_p2_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_p2_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_p2_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_p2_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_p2_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_p2_BUSER sc_in sc_lv 1 signal 1 } 
	{ outlen_stream_dout sc_in sc_lv 32 signal 2 } 
	{ outlen_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ outlen_stream_read sc_out sc_logic 1 signal 2 } 
	{ m_axi_p3_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_p3_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_p3_AWADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_p3_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_p3_AWLEN sc_out sc_lv 32 signal 3 } 
	{ m_axi_p3_AWSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_p3_AWBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_p3_AWLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_p3_AWCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_p3_AWPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_p3_AWQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_p3_AWREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_p3_AWUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_p3_WVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_p3_WREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_p3_WDATA sc_out sc_lv 32 signal 3 } 
	{ m_axi_p3_WSTRB sc_out sc_lv 4 signal 3 } 
	{ m_axi_p3_WLAST sc_out sc_logic 1 signal 3 } 
	{ m_axi_p3_WID sc_out sc_lv 1 signal 3 } 
	{ m_axi_p3_WUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_p3_ARVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_p3_ARREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_p3_ARADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_p3_ARID sc_out sc_lv 1 signal 3 } 
	{ m_axi_p3_ARLEN sc_out sc_lv 32 signal 3 } 
	{ m_axi_p3_ARSIZE sc_out sc_lv 3 signal 3 } 
	{ m_axi_p3_ARBURST sc_out sc_lv 2 signal 3 } 
	{ m_axi_p3_ARLOCK sc_out sc_lv 2 signal 3 } 
	{ m_axi_p3_ARCACHE sc_out sc_lv 4 signal 3 } 
	{ m_axi_p3_ARPROT sc_out sc_lv 3 signal 3 } 
	{ m_axi_p3_ARQOS sc_out sc_lv 4 signal 3 } 
	{ m_axi_p3_ARREGION sc_out sc_lv 4 signal 3 } 
	{ m_axi_p3_ARUSER sc_out sc_lv 1 signal 3 } 
	{ m_axi_p3_RVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_p3_RREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_p3_RDATA sc_in sc_lv 32 signal 3 } 
	{ m_axi_p3_RLAST sc_in sc_logic 1 signal 3 } 
	{ m_axi_p3_RID sc_in sc_lv 1 signal 3 } 
	{ m_axi_p3_RUSER sc_in sc_lv 1 signal 3 } 
	{ m_axi_p3_RRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_p3_BVALID sc_in sc_logic 1 signal 3 } 
	{ m_axi_p3_BREADY sc_out sc_logic 1 signal 3 } 
	{ m_axi_p3_BRESP sc_in sc_lv 2 signal 3 } 
	{ m_axi_p3_BID sc_in sc_lv 1 signal 3 } 
	{ m_axi_p3_BUSER sc_in sc_lv 1 signal 3 } 
	{ outArr_dout sc_in sc_lv 64 signal 4 } 
	{ outArr_empty_n sc_in sc_logic 1 signal 4 } 
	{ outArr_read sc_out sc_logic 1 signal 4 } 
	{ len_dout sc_in sc_lv 64 signal 5 } 
	{ len_empty_n sc_in sc_logic 1 signal 5 } 
	{ len_read sc_out sc_logic 1 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "outstream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "outstream", "role": "dout" }} , 
 	{ "name": "outstream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outstream", "role": "empty_n" }} , 
 	{ "name": "outstream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outstream", "role": "read" }} , 
 	{ "name": "m_axi_p2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_p2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_p2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_p2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "AWID" }} , 
 	{ "name": "m_axi_p2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p2", "role": "AWLEN" }} , 
 	{ "name": "m_axi_p2_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p2", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_p2_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p2", "role": "AWBURST" }} , 
 	{ "name": "m_axi_p2_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p2", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_p2_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p2", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_p2_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p2", "role": "AWPROT" }} , 
 	{ "name": "m_axi_p2_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p2", "role": "AWQOS" }} , 
 	{ "name": "m_axi_p2_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p2", "role": "AWREGION" }} , 
 	{ "name": "m_axi_p2_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "AWUSER" }} , 
 	{ "name": "m_axi_p2_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "WVALID" }} , 
 	{ "name": "m_axi_p2_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "WREADY" }} , 
 	{ "name": "m_axi_p2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p2", "role": "WDATA" }} , 
 	{ "name": "m_axi_p2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_p2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "WLAST" }} , 
 	{ "name": "m_axi_p2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "WID" }} , 
 	{ "name": "m_axi_p2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "WUSER" }} , 
 	{ "name": "m_axi_p2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_p2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_p2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_p2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "ARID" }} , 
 	{ "name": "m_axi_p2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p2", "role": "ARLEN" }} , 
 	{ "name": "m_axi_p2_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p2", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_p2_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p2", "role": "ARBURST" }} , 
 	{ "name": "m_axi_p2_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p2", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_p2_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p2", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_p2_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p2", "role": "ARPROT" }} , 
 	{ "name": "m_axi_p2_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p2", "role": "ARQOS" }} , 
 	{ "name": "m_axi_p2_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p2", "role": "ARREGION" }} , 
 	{ "name": "m_axi_p2_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "ARUSER" }} , 
 	{ "name": "m_axi_p2_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "RVALID" }} , 
 	{ "name": "m_axi_p2_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "RREADY" }} , 
 	{ "name": "m_axi_p2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p2", "role": "RDATA" }} , 
 	{ "name": "m_axi_p2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "RLAST" }} , 
 	{ "name": "m_axi_p2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "RID" }} , 
 	{ "name": "m_axi_p2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "RUSER" }} , 
 	{ "name": "m_axi_p2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p2", "role": "RRESP" }} , 
 	{ "name": "m_axi_p2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "BVALID" }} , 
 	{ "name": "m_axi_p2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "BREADY" }} , 
 	{ "name": "m_axi_p2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p2", "role": "BRESP" }} , 
 	{ "name": "m_axi_p2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "BID" }} , 
 	{ "name": "m_axi_p2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "BUSER" }} , 
 	{ "name": "outlen_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outlen_stream", "role": "dout" }} , 
 	{ "name": "outlen_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outlen_stream", "role": "empty_n" }} , 
 	{ "name": "outlen_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outlen_stream", "role": "read" }} , 
 	{ "name": "m_axi_p3_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "AWVALID" }} , 
 	{ "name": "m_axi_p3_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "AWREADY" }} , 
 	{ "name": "m_axi_p3_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p3", "role": "AWADDR" }} , 
 	{ "name": "m_axi_p3_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "AWID" }} , 
 	{ "name": "m_axi_p3_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p3", "role": "AWLEN" }} , 
 	{ "name": "m_axi_p3_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p3", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_p3_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p3", "role": "AWBURST" }} , 
 	{ "name": "m_axi_p3_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p3", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_p3_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p3", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_p3_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p3", "role": "AWPROT" }} , 
 	{ "name": "m_axi_p3_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p3", "role": "AWQOS" }} , 
 	{ "name": "m_axi_p3_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p3", "role": "AWREGION" }} , 
 	{ "name": "m_axi_p3_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "AWUSER" }} , 
 	{ "name": "m_axi_p3_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "WVALID" }} , 
 	{ "name": "m_axi_p3_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "WREADY" }} , 
 	{ "name": "m_axi_p3_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p3", "role": "WDATA" }} , 
 	{ "name": "m_axi_p3_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p3", "role": "WSTRB" }} , 
 	{ "name": "m_axi_p3_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "WLAST" }} , 
 	{ "name": "m_axi_p3_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "WID" }} , 
 	{ "name": "m_axi_p3_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "WUSER" }} , 
 	{ "name": "m_axi_p3_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "ARVALID" }} , 
 	{ "name": "m_axi_p3_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "ARREADY" }} , 
 	{ "name": "m_axi_p3_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p3", "role": "ARADDR" }} , 
 	{ "name": "m_axi_p3_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "ARID" }} , 
 	{ "name": "m_axi_p3_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p3", "role": "ARLEN" }} , 
 	{ "name": "m_axi_p3_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p3", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_p3_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p3", "role": "ARBURST" }} , 
 	{ "name": "m_axi_p3_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p3", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_p3_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p3", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_p3_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "p3", "role": "ARPROT" }} , 
 	{ "name": "m_axi_p3_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p3", "role": "ARQOS" }} , 
 	{ "name": "m_axi_p3_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p3", "role": "ARREGION" }} , 
 	{ "name": "m_axi_p3_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "ARUSER" }} , 
 	{ "name": "m_axi_p3_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "RVALID" }} , 
 	{ "name": "m_axi_p3_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "RREADY" }} , 
 	{ "name": "m_axi_p3_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p3", "role": "RDATA" }} , 
 	{ "name": "m_axi_p3_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "RLAST" }} , 
 	{ "name": "m_axi_p3_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "RID" }} , 
 	{ "name": "m_axi_p3_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "RUSER" }} , 
 	{ "name": "m_axi_p3_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p3", "role": "RRESP" }} , 
 	{ "name": "m_axi_p3_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "BVALID" }} , 
 	{ "name": "m_axi_p3_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "BREADY" }} , 
 	{ "name": "m_axi_p3_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p3", "role": "BRESP" }} , 
 	{ "name": "m_axi_p3_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "BID" }} , 
 	{ "name": "m_axi_p3_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "BUSER" }} , 
 	{ "name": "outArr_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "outArr", "role": "dout" }} , 
 	{ "name": "outArr_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outArr", "role": "empty_n" }} , 
 	{ "name": "outArr_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outArr", "role": "read" }} , 
 	{ "name": "len_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "len", "role": "dout" }} , 
 	{ "name": "len_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "len", "role": "empty_n" }} , 
 	{ "name": "len_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "len", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "store",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "71", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "outstream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outstream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "p2_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "p2_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "p2_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "outlen_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outlen_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p3", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "p3_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "p3_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "p3_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "outArr", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "outArr_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "len", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "len_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	store {
		outstream {Type I LastRead 72 FirstWrite -1}
		p2 {Type O LastRead 72 FirstWrite 73}
		outlen_stream {Type I LastRead 0 FirstWrite -1}
		p3 {Type O LastRead 3 FirstWrite 2}
		outArr {Type I LastRead 0 FirstWrite -1}
		len {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "71", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "71", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	outstream { ap_fifo {  { outstream_dout fifo_data 0 16 }  { outstream_empty_n fifo_status 0 1 }  { outstream_read fifo_update 1 1 } } }
	p2 { m_axi {  { m_axi_p2_AWVALID VALID 1 1 }  { m_axi_p2_AWREADY READY 0 1 }  { m_axi_p2_AWADDR ADDR 1 64 }  { m_axi_p2_AWID ID 1 1 }  { m_axi_p2_AWLEN LEN 1 32 }  { m_axi_p2_AWSIZE SIZE 1 3 }  { m_axi_p2_AWBURST BURST 1 2 }  { m_axi_p2_AWLOCK LOCK 1 2 }  { m_axi_p2_AWCACHE CACHE 1 4 }  { m_axi_p2_AWPROT PROT 1 3 }  { m_axi_p2_AWQOS QOS 1 4 }  { m_axi_p2_AWREGION REGION 1 4 }  { m_axi_p2_AWUSER USER 1 1 }  { m_axi_p2_WVALID VALID 1 1 }  { m_axi_p2_WREADY READY 0 1 }  { m_axi_p2_WDATA DATA 1 16 }  { m_axi_p2_WSTRB STRB 1 2 }  { m_axi_p2_WLAST LAST 1 1 }  { m_axi_p2_WID ID 1 1 }  { m_axi_p2_WUSER USER 1 1 }  { m_axi_p2_ARVALID VALID 1 1 }  { m_axi_p2_ARREADY READY 0 1 }  { m_axi_p2_ARADDR ADDR 1 64 }  { m_axi_p2_ARID ID 1 1 }  { m_axi_p2_ARLEN LEN 1 32 }  { m_axi_p2_ARSIZE SIZE 1 3 }  { m_axi_p2_ARBURST BURST 1 2 }  { m_axi_p2_ARLOCK LOCK 1 2 }  { m_axi_p2_ARCACHE CACHE 1 4 }  { m_axi_p2_ARPROT PROT 1 3 }  { m_axi_p2_ARQOS QOS 1 4 }  { m_axi_p2_ARREGION REGION 1 4 }  { m_axi_p2_ARUSER USER 1 1 }  { m_axi_p2_RVALID VALID 0 1 }  { m_axi_p2_RREADY READY 1 1 }  { m_axi_p2_RDATA DATA 0 16 }  { m_axi_p2_RLAST LAST 0 1 }  { m_axi_p2_RID ID 0 1 }  { m_axi_p2_RUSER USER 0 1 }  { m_axi_p2_RRESP RESP 0 2 }  { m_axi_p2_BVALID VALID 0 1 }  { m_axi_p2_BREADY READY 1 1 }  { m_axi_p2_BRESP RESP 0 2 }  { m_axi_p2_BID ID 0 1 }  { m_axi_p2_BUSER USER 0 1 } } }
	outlen_stream { ap_fifo {  { outlen_stream_dout fifo_data 0 32 }  { outlen_stream_empty_n fifo_status 0 1 }  { outlen_stream_read fifo_update 1 1 } } }
	p3 { m_axi {  { m_axi_p3_AWVALID VALID 1 1 }  { m_axi_p3_AWREADY READY 0 1 }  { m_axi_p3_AWADDR ADDR 1 64 }  { m_axi_p3_AWID ID 1 1 }  { m_axi_p3_AWLEN LEN 1 32 }  { m_axi_p3_AWSIZE SIZE 1 3 }  { m_axi_p3_AWBURST BURST 1 2 }  { m_axi_p3_AWLOCK LOCK 1 2 }  { m_axi_p3_AWCACHE CACHE 1 4 }  { m_axi_p3_AWPROT PROT 1 3 }  { m_axi_p3_AWQOS QOS 1 4 }  { m_axi_p3_AWREGION REGION 1 4 }  { m_axi_p3_AWUSER USER 1 1 }  { m_axi_p3_WVALID VALID 1 1 }  { m_axi_p3_WREADY READY 0 1 }  { m_axi_p3_WDATA DATA 1 32 }  { m_axi_p3_WSTRB STRB 1 4 }  { m_axi_p3_WLAST LAST 1 1 }  { m_axi_p3_WID ID 1 1 }  { m_axi_p3_WUSER USER 1 1 }  { m_axi_p3_ARVALID VALID 1 1 }  { m_axi_p3_ARREADY READY 0 1 }  { m_axi_p3_ARADDR ADDR 1 64 }  { m_axi_p3_ARID ID 1 1 }  { m_axi_p3_ARLEN LEN 1 32 }  { m_axi_p3_ARSIZE SIZE 1 3 }  { m_axi_p3_ARBURST BURST 1 2 }  { m_axi_p3_ARLOCK LOCK 1 2 }  { m_axi_p3_ARCACHE CACHE 1 4 }  { m_axi_p3_ARPROT PROT 1 3 }  { m_axi_p3_ARQOS QOS 1 4 }  { m_axi_p3_ARREGION REGION 1 4 }  { m_axi_p3_ARUSER USER 1 1 }  { m_axi_p3_RVALID VALID 0 1 }  { m_axi_p3_RREADY READY 1 1 }  { m_axi_p3_RDATA DATA 0 32 }  { m_axi_p3_RLAST LAST 0 1 }  { m_axi_p3_RID ID 0 1 }  { m_axi_p3_RUSER USER 0 1 }  { m_axi_p3_RRESP RESP 0 2 }  { m_axi_p3_BVALID VALID 0 1 }  { m_axi_p3_BREADY READY 1 1 }  { m_axi_p3_BRESP RESP 0 2 }  { m_axi_p3_BID ID 0 1 }  { m_axi_p3_BUSER USER 0 1 } } }
	outArr { ap_fifo {  { outArr_dout fifo_data 0 64 }  { outArr_empty_n fifo_status 0 1 }  { outArr_read fifo_update 1 1 } } }
	len { ap_fifo {  { len_dout fifo_data 0 64 }  { len_empty_n fifo_status 0 1 }  { len_read fifo_update 1 1 } } }
}
