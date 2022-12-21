set moduleName Filter_HW_stream
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_chain
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {Filter_HW_stream}
set C_modelType { void 0 }
set C_modelArgList {
	{ p0 int 512 regular {axi_master 0}  }
	{ p1 int 128 regular {axi_master 1}  }
	{ Input_r int 64 regular {axi_slave 0}  }
	{ Output_r int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p0", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "Input","cData": "int512","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "Input_r","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "p1", "interface" : "axi_master", "bitwidth" : 128, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "Output","cData": "int128","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "Output_r","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "Input_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "Output_r", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} ]}
# RTL Port declarations: 
set portNum 110
set portList { 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
	{ m_axi_p0_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_p0_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_AWLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_p0_WDATA sc_out sc_lv 512 signal 0 } 
	{ m_axi_p0_WSTRB sc_out sc_lv 64 signal 0 } 
	{ m_axi_p0_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_p0_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_p0_ARLEN sc_out sc_lv 8 signal 0 } 
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
	{ m_axi_p0_RDATA sc_in sc_lv 512 signal 0 } 
	{ m_axi_p0_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_p0_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_p0_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_p0_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_p0_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_p0_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_p0_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_p0_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_p1_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_p1_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_p1_AWADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_p1_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_p1_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_p1_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_p1_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_p1_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_p1_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_p1_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_p1_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_p1_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_p1_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_p1_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_p1_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_p1_WDATA sc_out sc_lv 128 signal 1 } 
	{ m_axi_p1_WSTRB sc_out sc_lv 16 signal 1 } 
	{ m_axi_p1_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_p1_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_p1_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_p1_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_p1_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_p1_ARADDR sc_out sc_lv 64 signal 1 } 
	{ m_axi_p1_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_p1_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_p1_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_p1_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_p1_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_p1_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_p1_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_p1_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_p1_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_p1_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_p1_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_p1_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_p1_RDATA sc_in sc_lv 128 signal 1 } 
	{ m_axi_p1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_p1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_p1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_p1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_p1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_p1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_p1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_p1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_p1_BUSER sc_in sc_lv 1 signal 1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"Filter_HW_stream","role":"start","value":"0","valid_bit":"0"},{"name":"Filter_HW_stream","role":"continue","value":"0","valid_bit":"4"},{"name":"Filter_HW_stream","role":"auto_start","value":"0","valid_bit":"7"},{"name":"Input_r","role":"data","value":"16"},{"name":"Output_r","role":"data","value":"28"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"Filter_HW_stream","role":"start","value":"0","valid_bit":"0"},{"name":"Filter_HW_stream","role":"done","value":"0","valid_bit":"1"},{"name":"Filter_HW_stream","role":"idle","value":"0","valid_bit":"2"},{"name":"Filter_HW_stream","role":"ready","value":"0","valid_bit":"3"},{"name":"Filter_HW_stream","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "m_axi_p0_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "AWVALID" }} , 
 	{ "name": "m_axi_p0_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "AWREADY" }} , 
 	{ "name": "m_axi_p0_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p0", "role": "AWADDR" }} , 
 	{ "name": "m_axi_p0_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "AWID" }} , 
 	{ "name": "m_axi_p0_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p0", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_p0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "p0", "role": "WDATA" }} , 
 	{ "name": "m_axi_p0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p0", "role": "WSTRB" }} , 
 	{ "name": "m_axi_p0_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "WLAST" }} , 
 	{ "name": "m_axi_p0_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "WID" }} , 
 	{ "name": "m_axi_p0_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "WUSER" }} , 
 	{ "name": "m_axi_p0_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "ARVALID" }} , 
 	{ "name": "m_axi_p0_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "ARREADY" }} , 
 	{ "name": "m_axi_p0_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p0", "role": "ARADDR" }} , 
 	{ "name": "m_axi_p0_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "ARID" }} , 
 	{ "name": "m_axi_p0_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p0", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_p0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "p0", "role": "RDATA" }} , 
 	{ "name": "m_axi_p0_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "RLAST" }} , 
 	{ "name": "m_axi_p0_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "RID" }} , 
 	{ "name": "m_axi_p0_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "RUSER" }} , 
 	{ "name": "m_axi_p0_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p0", "role": "RRESP" }} , 
 	{ "name": "m_axi_p0_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "BVALID" }} , 
 	{ "name": "m_axi_p0_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "BREADY" }} , 
 	{ "name": "m_axi_p0_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p0", "role": "BRESP" }} , 
 	{ "name": "m_axi_p0_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "BID" }} , 
 	{ "name": "m_axi_p0_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p0", "role": "BUSER" }} , 
 	{ "name": "m_axi_p1_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "AWVALID" }} , 
 	{ "name": "m_axi_p1_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "AWREADY" }} , 
 	{ "name": "m_axi_p1_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p1", "role": "AWADDR" }} , 
 	{ "name": "m_axi_p1_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "AWID" }} , 
 	{ "name": "m_axi_p1_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p1", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_p1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "p1", "role": "WDATA" }} , 
 	{ "name": "m_axi_p1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p1", "role": "WSTRB" }} , 
 	{ "name": "m_axi_p1_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "WLAST" }} , 
 	{ "name": "m_axi_p1_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "WID" }} , 
 	{ "name": "m_axi_p1_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "WUSER" }} , 
 	{ "name": "m_axi_p1_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "ARVALID" }} , 
 	{ "name": "m_axi_p1_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "ARREADY" }} , 
 	{ "name": "m_axi_p1_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p1", "role": "ARADDR" }} , 
 	{ "name": "m_axi_p1_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "ARID" }} , 
 	{ "name": "m_axi_p1_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p1", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_p1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "p1", "role": "RDATA" }} , 
 	{ "name": "m_axi_p1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RLAST" }} , 
 	{ "name": "m_axi_p1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RID" }} , 
 	{ "name": "m_axi_p1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RUSER" }} , 
 	{ "name": "m_axi_p1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "RRESP" }} , 
 	{ "name": "m_axi_p1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BVALID" }} , 
 	{ "name": "m_axi_p1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BREADY" }} , 
 	{ "name": "m_axi_p1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "BRESP" }} , 
 	{ "name": "m_axi_p1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BID" }} , 
 	{ "name": "m_axi_p1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "19", "20", "21", "22", "23", "24", "25", "26"],
		"CDFG" : "Filter_HW_stream",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "131025", "EstimateLatencyMax" : "131025",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "4", "Name" : "Filter_HW_stream_entry3_U0"},
			{"ID" : "5", "Name" : "load3_U0"}],
		"OutputProcess" : [
			{"ID" : "19", "Name" : "store_U0"}],
		"Port" : [
			{"Name" : "p0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "load3_U0", "Port" : "p0"}]},
			{"Name" : "p1", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "19", "SubInstance" : "store_U0", "Port" : "p1"}]},
			{"Name" : "Input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_stream", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "compute_U0", "Port" : "input_stream"},
					{"ID" : "5", "SubInstance" : "load3_U0", "Port" : "input_stream"}]},
			{"Name" : "temp_stream", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "compute_U0", "Port" : "temp_stream"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "compute_U0", "Port" : "output_stream"},
					{"ID" : "19", "SubInstance" : "store_U0", "Port" : "output_stream"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p0_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p1_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Filter_HW_stream_entry3_U0", "Parent" : "0",
		"CDFG" : "Filter_HW_stream_entry3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "1",
		"VariableLatency" : "0", "ExactLatency" : "0", "EstimateLatencyMin" : "0", "EstimateLatencyMax" : "0",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "Input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Output_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "Input_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "20", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Input_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "5", "DependentChan" : "21", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.load3_U0", "Parent" : "0",
		"CDFG" : "load3",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "129673", "EstimateLatencyMax" : "129673",
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
			{"Name" : "Input_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "20", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Input_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "4", "DependentChan" : "21", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "19", "DependentChan" : "22", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "23", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "input_stream_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.compute_U0", "Parent" : "0", "Child" : ["7", "9", "17", "18"],
		"CDFG" : "compute",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130951", "EstimateLatencyMax" : "130951",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "5",
		"StartFifo" : "start_for_compute_U0_U",
		"InputProcess" : [
			{"ID" : "7", "Name" : "Filter_horizontal_HW_stream_U0"}],
		"OutputProcess" : [
			{"ID" : "9", "Name" : "Filter_vertical_HW_stream_U0"}],
		"Port" : [
			{"Name" : "input_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "23", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "Filter_horizontal_HW_stream_U0", "Port" : "input_stream"}]},
			{"Name" : "temp_stream", "Type" : "Fifo", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "Filter_vertical_HW_stream_U0", "Port" : "temp_stream"},
					{"ID" : "7", "SubInstance" : "Filter_horizontal_HW_stream_U0", "Port" : "temp_stream"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "19", "DependentChan" : "24", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"SubConnect" : [
					{"ID" : "9", "SubInstance" : "Filter_vertical_HW_stream_U0", "Port" : "output_stream"}]}]},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_horizontal_HW_stream_U0", "Parent" : "6", "Child" : ["8"],
		"CDFG" : "Filter_horizontal_HW_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "1",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "130951", "EstimateLatencyMax" : "130951",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "input_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "23", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "input_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "temp_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "9", "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "temp_stream_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "8", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_horizontal_HW_stream_U0.mac_muladd_8ns_8ns_16ns_16_4_1_U10", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_vertical_HW_stream_U0", "Parent" : "6", "Child" : ["10", "11", "12", "13", "14", "15", "16"],
		"CDFG" : "Filter_vertical_HW_stream",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "127985", "EstimateLatencyMax" : "127985",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "7",
		"StartFifo" : "start_for_Filter_vertical_HW_stream_U0_U",
		"Port" : [
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "19", "DependentChan" : "24", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "temp_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "17", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "temp_stream_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "10", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_vertical_HW_stream_U0.temp_0_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_vertical_HW_stream_U0.temp_1_U", "Parent" : "9"},
	{"ID" : "12", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_vertical_HW_stream_U0.temp_2_U", "Parent" : "9"},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_vertical_HW_stream_U0.temp_3_U", "Parent" : "9"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_vertical_HW_stream_U0.temp_4_U", "Parent" : "9"},
	{"ID" : "15", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_vertical_HW_stream_U0.temp_5_U", "Parent" : "9"},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.compute_U0.Filter_vertical_HW_stream_U0.mac_muladd_8ns_8ns_10ns_15_4_1_U14", "Parent" : "9"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.compute_U0.temp_stream_U", "Parent" : "6"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.compute_U0.start_for_Filter_vertical_HW_stream_U0_U", "Parent" : "6"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.store_U0", "Parent" : "0",
		"CDFG" : "store",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "125207", "EstimateLatencyMax" : "125207",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "5",
		"StartFifo" : "start_for_store_U0_U",
		"Port" : [
			{"Name" : "p1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "p1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "p1_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "p1_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "Output_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "5", "DependentChan" : "22", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "9", "DependentChan" : "24", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Input_c_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Output_c1_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Output_c_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.input_stream_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_stream_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_compute_U0_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_store_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	Filter_HW_stream {
		p0 {Type I LastRead 72 FirstWrite -1}
		p1 {Type O LastRead 3 FirstWrite 4}
		Input_r {Type I LastRead 0 FirstWrite -1}
		Output_r {Type I LastRead 0 FirstWrite -1}
		input_stream {Type IO LastRead -1 FirstWrite -1}
		temp_stream {Type IO LastRead -1 FirstWrite -1}
		output_stream {Type IO LastRead -1 FirstWrite -1}}
	Filter_HW_stream_entry3 {
		Input_r {Type I LastRead 0 FirstWrite -1}
		Output_r {Type I LastRead 0 FirstWrite -1}
		Input_out {Type O LastRead -1 FirstWrite 0}
		Output_out {Type O LastRead -1 FirstWrite 0}}
	load3 {
		p0 {Type I LastRead 72 FirstWrite -1}
		Input_r {Type I LastRead 0 FirstWrite -1}
		Output_r {Type I LastRead 0 FirstWrite -1}
		Output_out {Type O LastRead -1 FirstWrite 0}
		input_stream {Type O LastRead -1 FirstWrite 73}}
	compute {
		input_stream {Type I LastRead 8 FirstWrite -1}
		temp_stream {Type IO LastRead -1 FirstWrite -1}
		output_stream {Type O LastRead -1 FirstWrite 5}}
	Filter_horizontal_HW_stream {
		input_stream {Type I LastRead 8 FirstWrite -1}
		temp_stream {Type O LastRead -1 FirstWrite 11}}
	Filter_vertical_HW_stream {
		output_stream {Type O LastRead -1 FirstWrite 5}
		temp_stream {Type I LastRead 2 FirstWrite -1}}
	store {
		p1 {Type O LastRead 3 FirstWrite 4}
		Output_r {Type I LastRead 0 FirstWrite -1}
		output_stream {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "131025", "Max" : "131025"}
	, {"Name" : "Interval", "Min" : "130952", "Max" : "130952"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p0 { m_axi {  { m_axi_p0_AWVALID VALID 1 1 }  { m_axi_p0_AWREADY READY 0 1 }  { m_axi_p0_AWADDR ADDR 1 64 }  { m_axi_p0_AWID ID 1 1 }  { m_axi_p0_AWLEN LEN 1 8 }  { m_axi_p0_AWSIZE SIZE 1 3 }  { m_axi_p0_AWBURST BURST 1 2 }  { m_axi_p0_AWLOCK LOCK 1 2 }  { m_axi_p0_AWCACHE CACHE 1 4 }  { m_axi_p0_AWPROT PROT 1 3 }  { m_axi_p0_AWQOS QOS 1 4 }  { m_axi_p0_AWREGION REGION 1 4 }  { m_axi_p0_AWUSER USER 1 1 }  { m_axi_p0_WVALID VALID 1 1 }  { m_axi_p0_WREADY READY 0 1 }  { m_axi_p0_WDATA DATA 1 512 }  { m_axi_p0_WSTRB STRB 1 64 }  { m_axi_p0_WLAST LAST 1 1 }  { m_axi_p0_WID ID 1 1 }  { m_axi_p0_WUSER USER 1 1 }  { m_axi_p0_ARVALID VALID 1 1 }  { m_axi_p0_ARREADY READY 0 1 }  { m_axi_p0_ARADDR ADDR 1 64 }  { m_axi_p0_ARID ID 1 1 }  { m_axi_p0_ARLEN LEN 1 8 }  { m_axi_p0_ARSIZE SIZE 1 3 }  { m_axi_p0_ARBURST BURST 1 2 }  { m_axi_p0_ARLOCK LOCK 1 2 }  { m_axi_p0_ARCACHE CACHE 1 4 }  { m_axi_p0_ARPROT PROT 1 3 }  { m_axi_p0_ARQOS QOS 1 4 }  { m_axi_p0_ARREGION REGION 1 4 }  { m_axi_p0_ARUSER USER 1 1 }  { m_axi_p0_RVALID VALID 0 1 }  { m_axi_p0_RREADY READY 1 1 }  { m_axi_p0_RDATA DATA 0 512 }  { m_axi_p0_RLAST LAST 0 1 }  { m_axi_p0_RID ID 0 1 }  { m_axi_p0_RUSER USER 0 1 }  { m_axi_p0_RRESP RESP 0 2 }  { m_axi_p0_BVALID VALID 0 1 }  { m_axi_p0_BREADY READY 1 1 }  { m_axi_p0_BRESP RESP 0 2 }  { m_axi_p0_BID ID 0 1 }  { m_axi_p0_BUSER USER 0 1 } } }
	p1 { m_axi {  { m_axi_p1_AWVALID VALID 1 1 }  { m_axi_p1_AWREADY READY 0 1 }  { m_axi_p1_AWADDR ADDR 1 64 }  { m_axi_p1_AWID ID 1 1 }  { m_axi_p1_AWLEN LEN 1 8 }  { m_axi_p1_AWSIZE SIZE 1 3 }  { m_axi_p1_AWBURST BURST 1 2 }  { m_axi_p1_AWLOCK LOCK 1 2 }  { m_axi_p1_AWCACHE CACHE 1 4 }  { m_axi_p1_AWPROT PROT 1 3 }  { m_axi_p1_AWQOS QOS 1 4 }  { m_axi_p1_AWREGION REGION 1 4 }  { m_axi_p1_AWUSER USER 1 1 }  { m_axi_p1_WVALID VALID 1 1 }  { m_axi_p1_WREADY READY 0 1 }  { m_axi_p1_WDATA DATA 1 128 }  { m_axi_p1_WSTRB STRB 1 16 }  { m_axi_p1_WLAST LAST 1 1 }  { m_axi_p1_WID ID 1 1 }  { m_axi_p1_WUSER USER 1 1 }  { m_axi_p1_ARVALID VALID 1 1 }  { m_axi_p1_ARREADY READY 0 1 }  { m_axi_p1_ARADDR ADDR 1 64 }  { m_axi_p1_ARID ID 1 1 }  { m_axi_p1_ARLEN LEN 1 8 }  { m_axi_p1_ARSIZE SIZE 1 3 }  { m_axi_p1_ARBURST BURST 1 2 }  { m_axi_p1_ARLOCK LOCK 1 2 }  { m_axi_p1_ARCACHE CACHE 1 4 }  { m_axi_p1_ARPROT PROT 1 3 }  { m_axi_p1_ARQOS QOS 1 4 }  { m_axi_p1_ARREGION REGION 1 4 }  { m_axi_p1_ARUSER USER 1 1 }  { m_axi_p1_RVALID VALID 0 1 }  { m_axi_p1_RREADY READY 1 1 }  { m_axi_p1_RDATA DATA 0 128 }  { m_axi_p1_RLAST LAST 0 1 }  { m_axi_p1_RID ID 0 1 }  { m_axi_p1_RUSER USER 0 1 }  { m_axi_p1_RRESP RESP 0 2 }  { m_axi_p1_BVALID VALID 0 1 }  { m_axi_p1_BREADY READY 1 1 }  { m_axi_p1_BRESP RESP 0 2 }  { m_axi_p1_BID ID 0 1 }  { m_axi_p1_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ p0 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ p1 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ p0 64 }
	{ p1 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ p0 64 }
	{ p1 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
