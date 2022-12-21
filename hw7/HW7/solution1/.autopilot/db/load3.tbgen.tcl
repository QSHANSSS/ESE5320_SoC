set moduleName load3
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
set C_modelName {load3}
set C_modelType { void 0 }
set C_modelArgList {
	{ p0 int 512 regular {axi_master 0}  }
	{ Input_r int 64 regular {fifo 0}  }
	{ Output_r int 64 regular {fifo 0}  }
	{ Output_out int 64 regular {fifo 1}  }
	{ input_stream int 8 regular {fifo 1 volatile } {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "p0", "interface" : "axi_master", "bitwidth" : 512, "direction" : "READONLY"} , 
 	{ "Name" : "Input_r", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "Output_r", "interface" : "fifo", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "Output_out", "interface" : "fifo", "bitwidth" : 64, "direction" : "WRITEONLY"} , 
 	{ "Name" : "input_stream", "interface" : "fifo", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 67
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
	{ m_axi_p0_WDATA sc_out sc_lv 512 signal 0 } 
	{ m_axi_p0_WSTRB sc_out sc_lv 64 signal 0 } 
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
	{ Input_r_dout sc_in sc_lv 64 signal 1 } 
	{ Input_r_empty_n sc_in sc_logic 1 signal 1 } 
	{ Input_r_read sc_out sc_logic 1 signal 1 } 
	{ Output_r_dout sc_in sc_lv 64 signal 2 } 
	{ Output_r_empty_n sc_in sc_logic 1 signal 2 } 
	{ Output_r_read sc_out sc_logic 1 signal 2 } 
	{ Output_out_din sc_out sc_lv 64 signal 3 } 
	{ Output_out_full_n sc_in sc_logic 1 signal 3 } 
	{ Output_out_write sc_out sc_logic 1 signal 3 } 
	{ input_stream_din sc_out sc_lv 8 signal 4 } 
	{ input_stream_full_n sc_in sc_logic 1 signal 4 } 
	{ input_stream_write sc_out sc_logic 1 signal 4 } 
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
 	{ "name": "m_axi_p0_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":512, "type": "signal", "bundle":{"name": "p0", "role": "WDATA" }} , 
 	{ "name": "m_axi_p0_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p0", "role": "WSTRB" }} , 
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
 	{ "name": "Input_r_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Input_r", "role": "dout" }} , 
 	{ "name": "Input_r_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Input_r", "role": "empty_n" }} , 
 	{ "name": "Input_r_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Input_r", "role": "read" }} , 
 	{ "name": "Output_r_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Output_r", "role": "dout" }} , 
 	{ "name": "Output_r_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_r", "role": "empty_n" }} , 
 	{ "name": "Output_r_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_r", "role": "read" }} , 
 	{ "name": "Output_out_din", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "Output_out", "role": "din" }} , 
 	{ "name": "Output_out_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_out", "role": "full_n" }} , 
 	{ "name": "Output_out_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Output_out", "role": "write" }} , 
 	{ "name": "input_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "input_stream", "role": "din" }} , 
 	{ "name": "input_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_stream", "role": "full_n" }} , 
 	{ "name": "input_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "input_stream", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
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
			{"Name" : "Input_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Input_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_r", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_r_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Output_out", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "3", "DependentChanType" : "2",
				"BlockSignal" : [
					{"Name" : "Output_out_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "2", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "input_stream_blk_n", "Type" : "RtlSignal"}]}]}]}


set ArgLastReadFirstWriteLatency {
	load3 {
		p0 {Type I LastRead 72 FirstWrite -1}
		Input_r {Type I LastRead 0 FirstWrite -1}
		Output_r {Type I LastRead 0 FirstWrite -1}
		Output_out {Type O LastRead -1 FirstWrite 0}
		input_stream {Type O LastRead -1 FirstWrite 73}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "129673", "Max" : "129673"}
	, {"Name" : "Interval", "Min" : "129673", "Max" : "129673"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p0 { m_axi {  { m_axi_p0_AWVALID VALID 1 1 }  { m_axi_p0_AWREADY READY 0 1 }  { m_axi_p0_AWADDR ADDR 1 64 }  { m_axi_p0_AWID ID 1 1 }  { m_axi_p0_AWLEN LEN 1 32 }  { m_axi_p0_AWSIZE SIZE 1 3 }  { m_axi_p0_AWBURST BURST 1 2 }  { m_axi_p0_AWLOCK LOCK 1 2 }  { m_axi_p0_AWCACHE CACHE 1 4 }  { m_axi_p0_AWPROT PROT 1 3 }  { m_axi_p0_AWQOS QOS 1 4 }  { m_axi_p0_AWREGION REGION 1 4 }  { m_axi_p0_AWUSER USER 1 1 }  { m_axi_p0_WVALID VALID 1 1 }  { m_axi_p0_WREADY READY 0 1 }  { m_axi_p0_WDATA DATA 1 512 }  { m_axi_p0_WSTRB STRB 1 64 }  { m_axi_p0_WLAST LAST 1 1 }  { m_axi_p0_WID ID 1 1 }  { m_axi_p0_WUSER USER 1 1 }  { m_axi_p0_ARVALID VALID 1 1 }  { m_axi_p0_ARREADY READY 0 1 }  { m_axi_p0_ARADDR ADDR 1 64 }  { m_axi_p0_ARID ID 1 1 }  { m_axi_p0_ARLEN LEN 1 32 }  { m_axi_p0_ARSIZE SIZE 1 3 }  { m_axi_p0_ARBURST BURST 1 2 }  { m_axi_p0_ARLOCK LOCK 1 2 }  { m_axi_p0_ARCACHE CACHE 1 4 }  { m_axi_p0_ARPROT PROT 1 3 }  { m_axi_p0_ARQOS QOS 1 4 }  { m_axi_p0_ARREGION REGION 1 4 }  { m_axi_p0_ARUSER USER 1 1 }  { m_axi_p0_RVALID VALID 0 1 }  { m_axi_p0_RREADY READY 1 1 }  { m_axi_p0_RDATA DATA 0 512 }  { m_axi_p0_RLAST LAST 0 1 }  { m_axi_p0_RID ID 0 1 }  { m_axi_p0_RUSER USER 0 1 }  { m_axi_p0_RRESP RESP 0 2 }  { m_axi_p0_BVALID VALID 0 1 }  { m_axi_p0_BREADY READY 1 1 }  { m_axi_p0_BRESP RESP 0 2 }  { m_axi_p0_BID ID 0 1 }  { m_axi_p0_BUSER USER 0 1 } } }
	Input_r { ap_fifo {  { Input_r_dout fifo_data 0 64 }  { Input_r_empty_n fifo_status 0 1 }  { Input_r_read fifo_update 1 1 } } }
	Output_r { ap_fifo {  { Output_r_dout fifo_data 0 64 }  { Output_r_empty_n fifo_status 0 1 }  { Output_r_read fifo_update 1 1 } } }
	Output_out { ap_fifo {  { Output_out_din fifo_data 1 64 }  { Output_out_full_n fifo_status 0 1 }  { Output_out_write fifo_update 1 1 } } }
	input_stream { ap_fifo {  { input_stream_din fifo_data 1 8 }  { input_stream_full_n fifo_status 0 1 }  { input_stream_write fifo_update 1 1 } } }
}
