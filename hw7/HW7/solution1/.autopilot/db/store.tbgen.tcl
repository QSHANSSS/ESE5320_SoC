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
	{ p1 int 128 regular {axi_master 1}  }
	{ Output_r int 64 regular {fifo 0}  }
	{ output_stream int 8 regular {fifo 0 volatile } {global 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p1", "interface" : "axi_master", "bitwidth" : 128, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Output_r", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "output_stream", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 58
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ m_axi_p1_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_p1_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_p1_AWADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_p1_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_p1_AWLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_p1_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_p1_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_p1_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_p1_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_p1_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_p1_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_p1_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_p1_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_p1_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_p1_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_p1_WDATA sc_out sc_lv 128 signal 0 } 
	{ m_axi_p1_WSTRB sc_out sc_lv 16 signal 0 } 
	{ m_axi_p1_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_p1_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_p1_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_p1_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_p1_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_p1_ARADDR sc_out sc_lv 64 signal 0 } 
	{ m_axi_p1_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_p1_ARLEN sc_out sc_lv 32 signal 0 } 
	{ m_axi_p1_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_p1_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_p1_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_p1_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_p1_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_p1_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_p1_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_p1_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_p1_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_p1_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_p1_RDATA sc_in sc_lv 128 signal 0 } 
	{ m_axi_p1_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_p1_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_p1_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_p1_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_p1_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_p1_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_p1_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_p1_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_p1_BUSER sc_in sc_lv 1 signal 0 } 
	{ Output_r_dout sc_in sc_lv 64 signal 1 } 
	{ Output_r_empty_n sc_in sc_logic 1 signal 1 } 
	{ Output_r_read sc_out sc_logic 1 signal 1 } 
	{ output_stream_dout sc_in sc_lv 8 signal 2 } 
	{ output_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ output_stream_read sc_out sc_logic 1 signal 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
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
 	{ "name": "m_axi_p1_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "p1", "role": "WDATA" }} , 
 	{ "name": "m_axi_p1_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "p1", "role": "WSTRB" }} , 
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
 	{ "name": "m_axi_p1_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":128, "type": "signal", "bundle":{"name": "p1", "role": "RDATA" }} , 
 	{ "name": "m_axi_p1_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RLAST" }} , 
 	{ "name": "m_axi_p1_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RID" }} , 
 	{ "name": "m_axi_p1_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "RUSER" }} , 
 	{ "name": "m_axi_p1_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "RRESP" }} , 
 	{ "name": "m_axi_p1_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BVALID" }} , 
 	{ "name": "m_axi_p1_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BREADY" }} , 
 	{ "name": "m_axi_p1_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "p1", "role": "BRESP" }} , 
 	{ "name": "m_axi_p1_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BID" }} , 
 	{ "name": "m_axi_p1_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p1", "role": "BUSER" }} , 
 	{ "name": "Output_r_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Output_r", "role": "dout" }} , 
 	{ "name": "Output_r_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_r", "role": "empty_n" }} , 
 	{ "name": "Output_r_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_r", "role": "read" }} , 
 	{ "name": "output_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "output_stream", "role": "dout" }} , 
 	{ "name": "output_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_stream", "role": "empty_n" }} , 
 	{ "name": "output_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "output_stream", "role": "read" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
		"Port" : [
			{"Name" : "p1", "Type" : "MAXI", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "p1_blk_n_AW", "Type" : "RtlSignal"},
					{"Name" : "p1_blk_n_W", "Type" : "RtlSignal"},
					{"Name" : "p1_blk_n_B", "Type" : "RtlSignal"}]},
			{"Name" : "Output_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "output_stream_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	store {
		p1 {Type O LastRead 3 FirstWrite 4}
		Output_r {Type I LastRead 0 FirstWrite -1}
		output_stream {Type I LastRead 3 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "125207", "Max" : "125207"}
	, {"Name" : "Interval", "Min" : "125207", "Max" : "125207"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p1 { m_axi {  { m_axi_p1_AWVALID VALID 1 1 }  { m_axi_p1_AWREADY READY 0 1 }  { m_axi_p1_AWADDR ADDR 1 64 }  { m_axi_p1_AWID ID 1 1 }  { m_axi_p1_AWLEN LEN 1 32 }  { m_axi_p1_AWSIZE SIZE 1 3 }  { m_axi_p1_AWBURST BURST 1 2 }  { m_axi_p1_AWLOCK LOCK 1 2 }  { m_axi_p1_AWCACHE CACHE 1 4 }  { m_axi_p1_AWPROT PROT 1 3 }  { m_axi_p1_AWQOS QOS 1 4 }  { m_axi_p1_AWREGION REGION 1 4 }  { m_axi_p1_AWUSER USER 1 1 }  { m_axi_p1_WVALID VALID 1 1 }  { m_axi_p1_WREADY READY 0 1 }  { m_axi_p1_WDATA DATA 1 128 }  { m_axi_p1_WSTRB STRB 1 16 }  { m_axi_p1_WLAST LAST 1 1 }  { m_axi_p1_WID ID 1 1 }  { m_axi_p1_WUSER USER 1 1 }  { m_axi_p1_ARVALID VALID 1 1 }  { m_axi_p1_ARREADY READY 0 1 }  { m_axi_p1_ARADDR ADDR 1 64 }  { m_axi_p1_ARID ID 1 1 }  { m_axi_p1_ARLEN LEN 1 32 }  { m_axi_p1_ARSIZE SIZE 1 3 }  { m_axi_p1_ARBURST BURST 1 2 }  { m_axi_p1_ARLOCK LOCK 1 2 }  { m_axi_p1_ARCACHE CACHE 1 4 }  { m_axi_p1_ARPROT PROT 1 3 }  { m_axi_p1_ARQOS QOS 1 4 }  { m_axi_p1_ARREGION REGION 1 4 }  { m_axi_p1_ARUSER USER 1 1 }  { m_axi_p1_RVALID VALID 0 1 }  { m_axi_p1_RREADY READY 1 1 }  { m_axi_p1_RDATA DATA 0 128 }  { m_axi_p1_RLAST LAST 0 1 }  { m_axi_p1_RID ID 0 1 }  { m_axi_p1_RUSER USER 0 1 }  { m_axi_p1_RRESP RESP 0 2 }  { m_axi_p1_BVALID VALID 0 1 }  { m_axi_p1_BREADY READY 1 1 }  { m_axi_p1_BRESP RESP 0 2 }  { m_axi_p1_BID ID 0 1 }  { m_axi_p1_BUSER USER 0 1 } } }
	Output_r { ap_fifo {  { Output_r_dout fifo_data 0 64 }  { Output_r_empty_n fifo_status 0 1 }  { Output_r_read fifo_update 1 1 } } }
	output_stream { ap_fifo {  { output_stream_dout fifo_data 0 8 }  { output_stream_empty_n fifo_status 0 1 }  { output_stream_read fifo_update 1 1 } } }
}
