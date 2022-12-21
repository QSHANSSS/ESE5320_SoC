set moduleName lzw_compute
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
set C_modelName {lzw_compute}
set C_modelType { void 0 }
set C_modelArgList {
	{ instream int 8 regular {fifo 0 volatile }  }
	{ inlen_stream int 32 regular {fifo 0 volatile }  }
	{ outstream int 16 regular {fifo 1 volatile }  }
	{ outlen_stream int 32 regular {fifo 1 volatile }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "instream", "interface" : "fifo", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "inlen_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "outstream", "interface" : "fifo", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "outlen_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 19
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_continue sc_in sc_logic 1 continue -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ instream_dout sc_in sc_lv 8 signal 0 } 
	{ instream_empty_n sc_in sc_logic 1 signal 0 } 
	{ instream_read sc_out sc_logic 1 signal 0 } 
	{ inlen_stream_dout sc_in sc_lv 32 signal 1 } 
	{ inlen_stream_empty_n sc_in sc_logic 1 signal 1 } 
	{ inlen_stream_read sc_out sc_logic 1 signal 1 } 
	{ outstream_din sc_out sc_lv 16 signal 2 } 
	{ outstream_full_n sc_in sc_logic 1 signal 2 } 
	{ outstream_write sc_out sc_logic 1 signal 2 } 
	{ outlen_stream_din sc_out sc_lv 32 signal 3 } 
	{ outlen_stream_full_n sc_in sc_logic 1 signal 3 } 
	{ outlen_stream_write sc_out sc_logic 1 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_continue", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "continue", "bundle":{"name": "ap_continue", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "instream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "instream", "role": "dout" }} , 
 	{ "name": "instream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "instream", "role": "empty_n" }} , 
 	{ "name": "instream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "instream", "role": "read" }} , 
 	{ "name": "inlen_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "inlen_stream", "role": "dout" }} , 
 	{ "name": "inlen_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inlen_stream", "role": "empty_n" }} , 
 	{ "name": "inlen_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "inlen_stream", "role": "read" }} , 
 	{ "name": "outstream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "outstream", "role": "din" }} , 
 	{ "name": "outstream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outstream", "role": "full_n" }} , 
 	{ "name": "outstream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outstream", "role": "write" }} , 
 	{ "name": "outlen_stream_din", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "outlen_stream", "role": "din" }} , 
 	{ "name": "outlen_stream_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outlen_stream", "role": "full_n" }} , 
 	{ "name": "outlen_stream_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "outlen_stream", "role": "write" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "8"],
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
		"Port" : [
			{"Name" : "instream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "instream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "inlen_stream", "Type" : "Fifo", "Direction" : "I", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "inlen_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outstream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outstream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "outlen_stream", "Type" : "Fifo", "Direction" : "O", "DependentProc" : "0", "DependentChan" : "0", "DependentChanDepth" : "8192", "DependentChanType" : "0",
				"BlockSignal" : [
					{"Name" : "outlen_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "code", "Type" : "OVld", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.table_location_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.table_start_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.table_empty_flag_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.chunk_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hash_search_fu_7677", "Parent" : "0", "Child" : ["6", "7"],
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
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hash_search_fu_7677.temp_U", "Parent" : "5"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hash_search_fu_7677.flag_U", "Parent" : "5"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hash_func_fu_7689", "Parent" : "0", "Child" : ["9"],
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
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hash_func_fu_7689.temp_key_U", "Parent" : "8"}]}


set ArgLastReadFirstWriteLatency {
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
		len {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	instream { ap_fifo {  { instream_dout fifo_data 0 8 }  { instream_empty_n fifo_status 0 1 }  { instream_read fifo_update 1 1 } } }
	inlen_stream { ap_fifo {  { inlen_stream_dout fifo_data 0 32 }  { inlen_stream_empty_n fifo_status 0 1 }  { inlen_stream_read fifo_update 1 1 } } }
	outstream { ap_fifo {  { outstream_din fifo_data 1 16 }  { outstream_full_n fifo_status 0 1 }  { outstream_write fifo_update 1 1 } } }
	outlen_stream { ap_fifo {  { outlen_stream_din fifo_data 1 32 }  { outlen_stream_full_n fifo_status 0 1 }  { outlen_stream_write fifo_update 1 1 } } }
}
