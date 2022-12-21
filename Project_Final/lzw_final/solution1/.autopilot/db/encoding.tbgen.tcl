set moduleName encoding
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
set C_modelName {encoding}
set C_modelType { void 0 }
set C_modelArgList {
	{ p0 int 8 regular {axi_master 0}  }
	{ p1 int 32 regular {axi_master 0}  }
	{ p2 int 16 regular {axi_master 1}  }
	{ p3 int 32 regular {axi_master 1}  }
	{ buff int 64 regular {axi_slave 0}  }
	{ input_length int 64 regular {axi_slave 0}  }
	{ output_compress int 64 regular {axi_slave 0}  }
	{ output_length int 64 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p0", "interface" : "axi_master", "bitwidth" : 8, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "buff","cData": "char","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "buff","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "p1", "interface" : "axi_master", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "input_length","cData": "int","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "input_length","bundle": "control"},"direction": "READONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "p2", "interface" : "axi_master", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "output_compress","cData": "short","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "output_compress","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "p3", "interface" : "axi_master", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "output_length","cData": "int","bit_use": { "low": 0,"up": 0},"offset": { "type": "dynamic","port_name": "output_length","bundle": "control"},"direction": "WRITEONLY","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "buff", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":27}} , 
 	{ "Name" : "input_length", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":28}, "offset_end" : {"in":39}} , 
 	{ "Name" : "output_compress", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":40}, "offset_end" : {"in":51}} , 
 	{ "Name" : "output_length", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 64, "direction" : "READONLY", "offset" : {"in":52}, "offset_end" : {"in":63}} ]}
# RTL Port declarations: 
set portNum 200
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
	{ m_axi_p0_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_p0_WSTRB sc_out sc_lv 4 signal 0 } 
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
	{ m_axi_p0_RDATA sc_in sc_lv 32 signal 0 } 
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
	{ m_axi_p1_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_p1_WSTRB sc_out sc_lv 4 signal 1 } 
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
	{ m_axi_p1_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_p1_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_p1_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_p1_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_p1_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_p1_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_p1_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_p1_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_p1_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_p1_BUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_p2_AWVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_p2_AWREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_p2_AWADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_p2_AWID sc_out sc_lv 1 signal 2 } 
	{ m_axi_p2_AWLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_p2_AWSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_p2_AWBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_p2_AWLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_p2_AWCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_p2_AWPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_p2_AWQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_p2_AWREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_p2_AWUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_p2_WVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_p2_WREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_p2_WDATA sc_out sc_lv 32 signal 2 } 
	{ m_axi_p2_WSTRB sc_out sc_lv 4 signal 2 } 
	{ m_axi_p2_WLAST sc_out sc_logic 1 signal 2 } 
	{ m_axi_p2_WID sc_out sc_lv 1 signal 2 } 
	{ m_axi_p2_WUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_p2_ARVALID sc_out sc_logic 1 signal 2 } 
	{ m_axi_p2_ARREADY sc_in sc_logic 1 signal 2 } 
	{ m_axi_p2_ARADDR sc_out sc_lv 64 signal 2 } 
	{ m_axi_p2_ARID sc_out sc_lv 1 signal 2 } 
	{ m_axi_p2_ARLEN sc_out sc_lv 8 signal 2 } 
	{ m_axi_p2_ARSIZE sc_out sc_lv 3 signal 2 } 
	{ m_axi_p2_ARBURST sc_out sc_lv 2 signal 2 } 
	{ m_axi_p2_ARLOCK sc_out sc_lv 2 signal 2 } 
	{ m_axi_p2_ARCACHE sc_out sc_lv 4 signal 2 } 
	{ m_axi_p2_ARPROT sc_out sc_lv 3 signal 2 } 
	{ m_axi_p2_ARQOS sc_out sc_lv 4 signal 2 } 
	{ m_axi_p2_ARREGION sc_out sc_lv 4 signal 2 } 
	{ m_axi_p2_ARUSER sc_out sc_lv 1 signal 2 } 
	{ m_axi_p2_RVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_p2_RREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_p2_RDATA sc_in sc_lv 32 signal 2 } 
	{ m_axi_p2_RLAST sc_in sc_logic 1 signal 2 } 
	{ m_axi_p2_RID sc_in sc_lv 1 signal 2 } 
	{ m_axi_p2_RUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_p2_RRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_p2_BVALID sc_in sc_logic 1 signal 2 } 
	{ m_axi_p2_BREADY sc_out sc_logic 1 signal 2 } 
	{ m_axi_p2_BRESP sc_in sc_lv 2 signal 2 } 
	{ m_axi_p2_BID sc_in sc_lv 1 signal 2 } 
	{ m_axi_p2_BUSER sc_in sc_lv 1 signal 2 } 
	{ m_axi_p3_AWVALID sc_out sc_logic 1 signal 3 } 
	{ m_axi_p3_AWREADY sc_in sc_logic 1 signal 3 } 
	{ m_axi_p3_AWADDR sc_out sc_lv 64 signal 3 } 
	{ m_axi_p3_AWID sc_out sc_lv 1 signal 3 } 
	{ m_axi_p3_AWLEN sc_out sc_lv 8 signal 3 } 
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
	{ m_axi_p3_ARLEN sc_out sc_lv 8 signal 3 } 
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
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"encoding","role":"start","value":"0","valid_bit":"0"},{"name":"encoding","role":"continue","value":"0","valid_bit":"4"},{"name":"encoding","role":"auto_start","value":"0","valid_bit":"7"},{"name":"buff","role":"data","value":"16"},{"name":"input_length","role":"data","value":"28"},{"name":"output_compress","role":"data","value":"40"},{"name":"output_length","role":"data","value":"52"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"encoding","role":"start","value":"0","valid_bit":"0"},{"name":"encoding","role":"done","value":"0","valid_bit":"1"},{"name":"encoding","role":"idle","value":"0","valid_bit":"2"},{"name":"encoding","role":"ready","value":"0","valid_bit":"3"},{"name":"encoding","role":"auto_start","value":"0","valid_bit":"7"}] },
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
 	{ "name": "m_axi_p0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p0", "role": "WDATA" }} , 
 	{ "name": "m_axi_p0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p0", "role": "WSTRB" }} , 
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
 	{ "name": "m_axi_p0_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p0", "role": "RDATA" }} , 
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
 	{ "name": "m_axi_p1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p1", "role": "WDATA" }} , 
 	{ "name": "m_axi_p1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p1", "role": "WSTRB" }} , 
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
 	{ "name": "m_axi_p2_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "AWVALID" }} , 
 	{ "name": "m_axi_p2_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "AWREADY" }} , 
 	{ "name": "m_axi_p2_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p2", "role": "AWADDR" }} , 
 	{ "name": "m_axi_p2_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "AWID" }} , 
 	{ "name": "m_axi_p2_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p2", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_p2_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p2", "role": "WDATA" }} , 
 	{ "name": "m_axi_p2_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "p2", "role": "WSTRB" }} , 
 	{ "name": "m_axi_p2_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "WLAST" }} , 
 	{ "name": "m_axi_p2_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "WID" }} , 
 	{ "name": "m_axi_p2_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "WUSER" }} , 
 	{ "name": "m_axi_p2_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "ARVALID" }} , 
 	{ "name": "m_axi_p2_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "ARREADY" }} , 
 	{ "name": "m_axi_p2_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p2", "role": "ARADDR" }} , 
 	{ "name": "m_axi_p2_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "ARID" }} , 
 	{ "name": "m_axi_p2_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p2", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_p2_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "p2", "role": "RDATA" }} , 
 	{ "name": "m_axi_p2_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "RLAST" }} , 
 	{ "name": "m_axi_p2_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "RID" }} , 
 	{ "name": "m_axi_p2_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "RUSER" }} , 
 	{ "name": "m_axi_p2_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p2", "role": "RRESP" }} , 
 	{ "name": "m_axi_p2_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "BVALID" }} , 
 	{ "name": "m_axi_p2_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "BREADY" }} , 
 	{ "name": "m_axi_p2_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p2", "role": "BRESP" }} , 
 	{ "name": "m_axi_p2_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "BID" }} , 
 	{ "name": "m_axi_p2_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p2", "role": "BUSER" }} , 
 	{ "name": "m_axi_p3_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "AWVALID" }} , 
 	{ "name": "m_axi_p3_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "AWREADY" }} , 
 	{ "name": "m_axi_p3_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p3", "role": "AWADDR" }} , 
 	{ "name": "m_axi_p3_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "AWID" }} , 
 	{ "name": "m_axi_p3_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p3", "role": "AWLEN" }} , 
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
 	{ "name": "m_axi_p3_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p3", "role": "ARLEN" }} , 
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
 	{ "name": "m_axi_p3_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p3", "role": "BUSER" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "17", "18", "19", "20", "21", "22", "23", "24", "25"],
		"CDFG" : "encoding",
		"Protocol" : "ap_ctrl_chain",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"InputProcess" : [
			{"ID" : "6", "Name" : "load6_U0"}],
		"OutputProcess" : [
			{"ID" : "17", "Name" : "store_U0"}],
		"Port" : [
			{"Name" : "p0", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "load6_U0", "Port" : "p0"}]},
			{"Name" : "p1", "Type" : "MAXI", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "6", "SubInstance" : "load6_U0", "Port" : "p1"}]},
			{"Name" : "p2", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "store_U0", "Port" : "p2"}]},
			{"Name" : "p3", "Type" : "MAXI", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "17", "SubInstance" : "store_U0", "Port" : "p3"}]},
			{"Name" : "buff", "Type" : "None", "Direction" : "I"},
			{"Name" : "input_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_compress", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "code", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "7", "SubInstance" : "lzw_compute_U0", "Port" : "code"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p0_m_axi_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p1_m_axi_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p2_m_axi_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p3_m_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.load6_U0", "Parent" : "0",
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
			{"Name" : "instream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "18", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "instream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p1", "Type" : "MAXI", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "p1_blk_n_AR", "Type" : "RtlSignal"},
					{"Name" : "p1_blk_n_R", "Type" : "RtlSignal"}]},
			{"Name" : "inlen_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "7", "DependentChan" : "19", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inlen_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_r", "Type" : "None", "Direction" : "I"},
			{"Name" : "len", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_compress", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_length", "Type" : "None", "Direction" : "I"},
			{"Name" : "output_compress_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "17", "DependentChan" : "20", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_compress_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_length_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "17", "DependentChan" : "21", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "output_length_out_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0", "Parent" : "0", "Child" : ["8", "9", "10", "11", "12", "15"],
		"CDFG" : "lzw_compute",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"StartSource" : "6",
		"StartFifo" : "start_for_lzw_compute_U0_U",
		"Port" : [
			{"Name" : "instream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "18", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "instream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inlen_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "19", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inlen_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outstream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "17", "DependentChan" : "22", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outstream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outlen_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "17", "DependentChan" : "23", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outlen_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "code", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0.table_location_U", "Parent" : "7"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0.table_start_U", "Parent" : "7"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0.table_empty_flag_U", "Parent" : "7"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0.chunk_U", "Parent" : "7"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0.grp_hash_search_fu_7677", "Parent" : "7", "Child" : ["13", "14"],
		"CDFG" : "hash_search",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "32", "EstimateLatencyMax" : "917617",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "key", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "hashArr_location", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "hashArr_start", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "hashArr_empty_flag", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "hash", "Type" : "None", "Direction" : "I"},
			{"Name" : "len", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "13", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0.grp_hash_search_fu_7677.temp_U", "Parent" : "12"},
	{"ID" : "14", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0.grp_hash_search_fu_7677.flag_U", "Parent" : "12"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0.grp_hash_func_fu_7689", "Parent" : "7", "Child" : ["16"],
		"CDFG" : "hash_func",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "key", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "key_offset", "Type" : "None", "Direction" : "I"},
			{"Name" : "len", "Type" : "None", "Direction" : "I"}]},
	{"ID" : "16", "Level" : "3", "Path" : "`AUTOTB_DUT_INST.lzw_compute_U0.grp_hash_func_fu_7689.temp_key_U", "Parent" : "15"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.store_U0", "Parent" : "0",
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
		"StartSource" : "6",
		"StartFifo" : "start_for_store_U0_U",
		"Port" : [
			{"Name" : "outstream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "22", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outstream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p2", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "p2_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "p2_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "p2_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "outlen_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "7", "DependentChan" : "23", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outlen_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "p3", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "p3_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "p3_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "p3_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "outArr", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "20", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "outArr_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "len", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "6", "DependentChan" : "21", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "len_blk_n", "Type" : "RtlSignal"}]}]},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.instream_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.inlen_stream_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_compress_c_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.output_length_c_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.outstream_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.outlen_stream_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_lzw_compute_U0_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.start_for_store_U0_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	encoding {
		p0 {Type I LastRead 143 FirstWrite -1}
		p1 {Type I LastRead 70 FirstWrite -1}
		p2 {Type O LastRead 72 FirstWrite 73}
		p3 {Type O LastRead 3 FirstWrite 2}
		buff {Type I LastRead 0 FirstWrite -1}
		input_length {Type I LastRead 0 FirstWrite -1}
		output_compress {Type I LastRead 0 FirstWrite -1}
		output_length {Type I LastRead 0 FirstWrite -1}
		code {Type IO LastRead -1 FirstWrite -1}}
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
		output_length_out {Type O LastRead -1 FirstWrite 0}}
	lzw_compute {
		instream {Type I LastRead 130 FirstWrite -1}
		inlen_stream {Type I LastRead 129 FirstWrite -1}
		outstream {Type O LastRead -1 FirstWrite 133}
		outlen_stream {Type O LastRead -1 FirstWrite 133}
		code {Type IO LastRead -1 FirstWrite -1}}
	hash_search {
		key {Type I LastRead 13 FirstWrite -1}
		hashArr_location {Type I LastRead 14 FirstWrite -1}
		hashArr_start {Type I LastRead 9 FirstWrite -1}
		hashArr_empty_flag {Type I LastRead 9 FirstWrite -1}
		key_offset {Type I LastRead 0 FirstWrite -1}
		hash {Type I LastRead 0 FirstWrite -1}
		len {Type I LastRead 0 FirstWrite -1}}
	hash_func {
		key {Type I LastRead 2 FirstWrite -1}
		key_offset {Type I LastRead 0 FirstWrite -1}
		len {Type I LastRead 0 FirstWrite -1}}
	store {
		outstream {Type I LastRead 72 FirstWrite -1}
		p2 {Type O LastRead 72 FirstWrite 73}
		outlen_stream {Type I LastRead 0 FirstWrite -1}
		p3 {Type O LastRead 3 FirstWrite 2}
		outArr {Type I LastRead 0 FirstWrite -1}
		len {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	p0 { m_axi {  { m_axi_p0_AWVALID VALID 1 1 }  { m_axi_p0_AWREADY READY 0 1 }  { m_axi_p0_AWADDR ADDR 1 64 }  { m_axi_p0_AWID ID 1 1 }  { m_axi_p0_AWLEN LEN 1 8 }  { m_axi_p0_AWSIZE SIZE 1 3 }  { m_axi_p0_AWBURST BURST 1 2 }  { m_axi_p0_AWLOCK LOCK 1 2 }  { m_axi_p0_AWCACHE CACHE 1 4 }  { m_axi_p0_AWPROT PROT 1 3 }  { m_axi_p0_AWQOS QOS 1 4 }  { m_axi_p0_AWREGION REGION 1 4 }  { m_axi_p0_AWUSER USER 1 1 }  { m_axi_p0_WVALID VALID 1 1 }  { m_axi_p0_WREADY READY 0 1 }  { m_axi_p0_WDATA DATA 1 32 }  { m_axi_p0_WSTRB STRB 1 4 }  { m_axi_p0_WLAST LAST 1 1 }  { m_axi_p0_WID ID 1 1 }  { m_axi_p0_WUSER USER 1 1 }  { m_axi_p0_ARVALID VALID 1 1 }  { m_axi_p0_ARREADY READY 0 1 }  { m_axi_p0_ARADDR ADDR 1 64 }  { m_axi_p0_ARID ID 1 1 }  { m_axi_p0_ARLEN LEN 1 8 }  { m_axi_p0_ARSIZE SIZE 1 3 }  { m_axi_p0_ARBURST BURST 1 2 }  { m_axi_p0_ARLOCK LOCK 1 2 }  { m_axi_p0_ARCACHE CACHE 1 4 }  { m_axi_p0_ARPROT PROT 1 3 }  { m_axi_p0_ARQOS QOS 1 4 }  { m_axi_p0_ARREGION REGION 1 4 }  { m_axi_p0_ARUSER USER 1 1 }  { m_axi_p0_RVALID VALID 0 1 }  { m_axi_p0_RREADY READY 1 1 }  { m_axi_p0_RDATA DATA 0 32 }  { m_axi_p0_RLAST LAST 0 1 }  { m_axi_p0_RID ID 0 1 }  { m_axi_p0_RUSER USER 0 1 }  { m_axi_p0_RRESP RESP 0 2 }  { m_axi_p0_BVALID VALID 0 1 }  { m_axi_p0_BREADY READY 1 1 }  { m_axi_p0_BRESP RESP 0 2 }  { m_axi_p0_BID ID 0 1 }  { m_axi_p0_BUSER USER 0 1 } } }
	p1 { m_axi {  { m_axi_p1_AWVALID VALID 1 1 }  { m_axi_p1_AWREADY READY 0 1 }  { m_axi_p1_AWADDR ADDR 1 64 }  { m_axi_p1_AWID ID 1 1 }  { m_axi_p1_AWLEN LEN 1 8 }  { m_axi_p1_AWSIZE SIZE 1 3 }  { m_axi_p1_AWBURST BURST 1 2 }  { m_axi_p1_AWLOCK LOCK 1 2 }  { m_axi_p1_AWCACHE CACHE 1 4 }  { m_axi_p1_AWPROT PROT 1 3 }  { m_axi_p1_AWQOS QOS 1 4 }  { m_axi_p1_AWREGION REGION 1 4 }  { m_axi_p1_AWUSER USER 1 1 }  { m_axi_p1_WVALID VALID 1 1 }  { m_axi_p1_WREADY READY 0 1 }  { m_axi_p1_WDATA DATA 1 32 }  { m_axi_p1_WSTRB STRB 1 4 }  { m_axi_p1_WLAST LAST 1 1 }  { m_axi_p1_WID ID 1 1 }  { m_axi_p1_WUSER USER 1 1 }  { m_axi_p1_ARVALID VALID 1 1 }  { m_axi_p1_ARREADY READY 0 1 }  { m_axi_p1_ARADDR ADDR 1 64 }  { m_axi_p1_ARID ID 1 1 }  { m_axi_p1_ARLEN LEN 1 8 }  { m_axi_p1_ARSIZE SIZE 1 3 }  { m_axi_p1_ARBURST BURST 1 2 }  { m_axi_p1_ARLOCK LOCK 1 2 }  { m_axi_p1_ARCACHE CACHE 1 4 }  { m_axi_p1_ARPROT PROT 1 3 }  { m_axi_p1_ARQOS QOS 1 4 }  { m_axi_p1_ARREGION REGION 1 4 }  { m_axi_p1_ARUSER USER 1 1 }  { m_axi_p1_RVALID VALID 0 1 }  { m_axi_p1_RREADY READY 1 1 }  { m_axi_p1_RDATA DATA 0 32 }  { m_axi_p1_RLAST LAST 0 1 }  { m_axi_p1_RID ID 0 1 }  { m_axi_p1_RUSER USER 0 1 }  { m_axi_p1_RRESP RESP 0 2 }  { m_axi_p1_BVALID VALID 0 1 }  { m_axi_p1_BREADY READY 1 1 }  { m_axi_p1_BRESP RESP 0 2 }  { m_axi_p1_BID ID 0 1 }  { m_axi_p1_BUSER USER 0 1 } } }
	p2 { m_axi {  { m_axi_p2_AWVALID VALID 1 1 }  { m_axi_p2_AWREADY READY 0 1 }  { m_axi_p2_AWADDR ADDR 1 64 }  { m_axi_p2_AWID ID 1 1 }  { m_axi_p2_AWLEN LEN 1 8 }  { m_axi_p2_AWSIZE SIZE 1 3 }  { m_axi_p2_AWBURST BURST 1 2 }  { m_axi_p2_AWLOCK LOCK 1 2 }  { m_axi_p2_AWCACHE CACHE 1 4 }  { m_axi_p2_AWPROT PROT 1 3 }  { m_axi_p2_AWQOS QOS 1 4 }  { m_axi_p2_AWREGION REGION 1 4 }  { m_axi_p2_AWUSER USER 1 1 }  { m_axi_p2_WVALID VALID 1 1 }  { m_axi_p2_WREADY READY 0 1 }  { m_axi_p2_WDATA DATA 1 32 }  { m_axi_p2_WSTRB STRB 1 4 }  { m_axi_p2_WLAST LAST 1 1 }  { m_axi_p2_WID ID 1 1 }  { m_axi_p2_WUSER USER 1 1 }  { m_axi_p2_ARVALID VALID 1 1 }  { m_axi_p2_ARREADY READY 0 1 }  { m_axi_p2_ARADDR ADDR 1 64 }  { m_axi_p2_ARID ID 1 1 }  { m_axi_p2_ARLEN LEN 1 8 }  { m_axi_p2_ARSIZE SIZE 1 3 }  { m_axi_p2_ARBURST BURST 1 2 }  { m_axi_p2_ARLOCK LOCK 1 2 }  { m_axi_p2_ARCACHE CACHE 1 4 }  { m_axi_p2_ARPROT PROT 1 3 }  { m_axi_p2_ARQOS QOS 1 4 }  { m_axi_p2_ARREGION REGION 1 4 }  { m_axi_p2_ARUSER USER 1 1 }  { m_axi_p2_RVALID VALID 0 1 }  { m_axi_p2_RREADY READY 1 1 }  { m_axi_p2_RDATA DATA 0 32 }  { m_axi_p2_RLAST LAST 0 1 }  { m_axi_p2_RID ID 0 1 }  { m_axi_p2_RUSER USER 0 1 }  { m_axi_p2_RRESP RESP 0 2 }  { m_axi_p2_BVALID VALID 0 1 }  { m_axi_p2_BREADY READY 1 1 }  { m_axi_p2_BRESP RESP 0 2 }  { m_axi_p2_BID ID 0 1 }  { m_axi_p2_BUSER USER 0 1 } } }
	p3 { m_axi {  { m_axi_p3_AWVALID VALID 1 1 }  { m_axi_p3_AWREADY READY 0 1 }  { m_axi_p3_AWADDR ADDR 1 64 }  { m_axi_p3_AWID ID 1 1 }  { m_axi_p3_AWLEN LEN 1 8 }  { m_axi_p3_AWSIZE SIZE 1 3 }  { m_axi_p3_AWBURST BURST 1 2 }  { m_axi_p3_AWLOCK LOCK 1 2 }  { m_axi_p3_AWCACHE CACHE 1 4 }  { m_axi_p3_AWPROT PROT 1 3 }  { m_axi_p3_AWQOS QOS 1 4 }  { m_axi_p3_AWREGION REGION 1 4 }  { m_axi_p3_AWUSER USER 1 1 }  { m_axi_p3_WVALID VALID 1 1 }  { m_axi_p3_WREADY READY 0 1 }  { m_axi_p3_WDATA DATA 1 32 }  { m_axi_p3_WSTRB STRB 1 4 }  { m_axi_p3_WLAST LAST 1 1 }  { m_axi_p3_WID ID 1 1 }  { m_axi_p3_WUSER USER 1 1 }  { m_axi_p3_ARVALID VALID 1 1 }  { m_axi_p3_ARREADY READY 0 1 }  { m_axi_p3_ARADDR ADDR 1 64 }  { m_axi_p3_ARID ID 1 1 }  { m_axi_p3_ARLEN LEN 1 8 }  { m_axi_p3_ARSIZE SIZE 1 3 }  { m_axi_p3_ARBURST BURST 1 2 }  { m_axi_p3_ARLOCK LOCK 1 2 }  { m_axi_p3_ARCACHE CACHE 1 4 }  { m_axi_p3_ARPROT PROT 1 3 }  { m_axi_p3_ARQOS QOS 1 4 }  { m_axi_p3_ARREGION REGION 1 4 }  { m_axi_p3_ARUSER USER 1 1 }  { m_axi_p3_RVALID VALID 0 1 }  { m_axi_p3_RREADY READY 1 1 }  { m_axi_p3_RDATA DATA 0 32 }  { m_axi_p3_RLAST LAST 0 1 }  { m_axi_p3_RID ID 0 1 }  { m_axi_p3_RUSER USER 0 1 }  { m_axi_p3_RRESP RESP 0 2 }  { m_axi_p3_BVALID VALID 0 1 }  { m_axi_p3_BREADY READY 1 1 }  { m_axi_p3_BRESP RESP 0 2 }  { m_axi_p3_BID ID 0 1 }  { m_axi_p3_BUSER USER 0 1 } } }
}

set busDeadlockParameterList { 
	{ p0 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ p1 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ p2 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
	{ p3 { NUM_READ_OUTSTANDING 16 NUM_WRITE_OUTSTANDING 16 MAX_READ_BURST_LENGTH 16 MAX_WRITE_BURST_LENGTH 16 } } \
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ p0 64 }
	{ p1 64 }
	{ p2 64 }
	{ p3 64 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ p0 64 }
	{ p1 64 }
	{ p2 64 }
	{ p3 64 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
