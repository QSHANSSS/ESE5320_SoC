set moduleName hash_search
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
set C_modelName {hash_search}
set C_modelType { int 16 }
set C_modelArgList {
	{ key int 8 regular {array 8192 { 1 1 } 1 1 }  }
	{ hashArr_location int 16 regular {array 133000 { 1 3 } 1 1 }  }
	{ hashArr_start int 16 regular {array 133000 { 1 1 } 1 1 }  }
	{ hashArr_empty_flag int 1 regular {array 133000 { 1 1 } 1 1 }  }
	{ key_offset int 13 regular  }
	{ hash int 14 regular  }
	{ len int 18 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "key", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "hashArr_location", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "hashArr_start", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "hashArr_empty_flag", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "key_offset", "interface" : "wire", "bitwidth" : 13, "direction" : "READONLY"} , 
 	{ "Name" : "hash", "interface" : "wire", "bitwidth" : 14, "direction" : "READONLY"} , 
 	{ "Name" : "len", "interface" : "wire", "bitwidth" : 18, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 16} ]}
# RTL Port declarations: 
set portNum 31
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ key_address0 sc_out sc_lv 13 signal 0 } 
	{ key_ce0 sc_out sc_logic 1 signal 0 } 
	{ key_q0 sc_in sc_lv 8 signal 0 } 
	{ key_address1 sc_out sc_lv 13 signal 0 } 
	{ key_ce1 sc_out sc_logic 1 signal 0 } 
	{ key_q1 sc_in sc_lv 8 signal 0 } 
	{ hashArr_location_address0 sc_out sc_lv 18 signal 1 } 
	{ hashArr_location_ce0 sc_out sc_logic 1 signal 1 } 
	{ hashArr_location_q0 sc_in sc_lv 16 signal 1 } 
	{ hashArr_start_address0 sc_out sc_lv 18 signal 2 } 
	{ hashArr_start_ce0 sc_out sc_logic 1 signal 2 } 
	{ hashArr_start_q0 sc_in sc_lv 16 signal 2 } 
	{ hashArr_start_address1 sc_out sc_lv 18 signal 2 } 
	{ hashArr_start_ce1 sc_out sc_logic 1 signal 2 } 
	{ hashArr_start_q1 sc_in sc_lv 16 signal 2 } 
	{ hashArr_empty_flag_address0 sc_out sc_lv 18 signal 3 } 
	{ hashArr_empty_flag_ce0 sc_out sc_logic 1 signal 3 } 
	{ hashArr_empty_flag_q0 sc_in sc_lv 1 signal 3 } 
	{ hashArr_empty_flag_address1 sc_out sc_lv 18 signal 3 } 
	{ hashArr_empty_flag_ce1 sc_out sc_logic 1 signal 3 } 
	{ hashArr_empty_flag_q1 sc_in sc_lv 1 signal 3 } 
	{ key_offset sc_in sc_lv 13 signal 4 } 
	{ hash sc_in sc_lv 14 signal 5 } 
	{ len sc_in sc_lv 18 signal 6 } 
	{ ap_return sc_out sc_lv 16 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "key_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "key", "role": "address0" }} , 
 	{ "name": "key_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce0" }} , 
 	{ "name": "key_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key", "role": "q0" }} , 
 	{ "name": "key_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "key", "role": "address1" }} , 
 	{ "name": "key_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "key", "role": "ce1" }} , 
 	{ "name": "key_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "key", "role": "q1" }} , 
 	{ "name": "hashArr_location_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hashArr_location", "role": "address0" }} , 
 	{ "name": "hashArr_location_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hashArr_location", "role": "ce0" }} , 
 	{ "name": "hashArr_location_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hashArr_location", "role": "q0" }} , 
 	{ "name": "hashArr_start_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hashArr_start", "role": "address0" }} , 
 	{ "name": "hashArr_start_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hashArr_start", "role": "ce0" }} , 
 	{ "name": "hashArr_start_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hashArr_start", "role": "q0" }} , 
 	{ "name": "hashArr_start_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hashArr_start", "role": "address1" }} , 
 	{ "name": "hashArr_start_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hashArr_start", "role": "ce1" }} , 
 	{ "name": "hashArr_start_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "hashArr_start", "role": "q1" }} , 
 	{ "name": "hashArr_empty_flag_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hashArr_empty_flag", "role": "address0" }} , 
 	{ "name": "hashArr_empty_flag_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hashArr_empty_flag", "role": "ce0" }} , 
 	{ "name": "hashArr_empty_flag_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "hashArr_empty_flag", "role": "q0" }} , 
 	{ "name": "hashArr_empty_flag_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "hashArr_empty_flag", "role": "address1" }} , 
 	{ "name": "hashArr_empty_flag_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "hashArr_empty_flag", "role": "ce1" }} , 
 	{ "name": "hashArr_empty_flag_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "hashArr_empty_flag", "role": "q1" }} , 
 	{ "name": "key_offset", "direction": "in", "datatype": "sc_lv", "bitwidth":13, "type": "signal", "bundle":{"name": "key_offset", "role": "default" }} , 
 	{ "name": "hash", "direction": "in", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "hash", "role": "default" }} , 
 	{ "name": "len", "direction": "in", "datatype": "sc_lv", "bitwidth":18, "type": "signal", "bundle":{"name": "len", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.temp_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flag_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	hash_search {
		key {Type I LastRead 13 FirstWrite -1}
		hashArr_location {Type I LastRead 14 FirstWrite -1}
		hashArr_start {Type I LastRead 9 FirstWrite -1}
		hashArr_empty_flag {Type I LastRead 9 FirstWrite -1}
		key_offset {Type I LastRead 0 FirstWrite -1}
		hash {Type I LastRead 0 FirstWrite -1}
		len {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "32", "Max" : "917617"}
	, {"Name" : "Interval", "Min" : "32", "Max" : "917617"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	key { ap_memory {  { key_address0 mem_address 1 13 }  { key_ce0 mem_ce 1 1 }  { key_q0 mem_dout 0 8 }  { key_address1 MemPortADDR2 1 13 }  { key_ce1 MemPortCE2 1 1 }  { key_q1 MemPortDOUT2 0 8 } } }
	hashArr_location { ap_memory {  { hashArr_location_address0 mem_address 1 18 }  { hashArr_location_ce0 mem_ce 1 1 }  { hashArr_location_q0 mem_dout 0 16 } } }
	hashArr_start { ap_memory {  { hashArr_start_address0 mem_address 1 18 }  { hashArr_start_ce0 mem_ce 1 1 }  { hashArr_start_q0 mem_dout 0 16 }  { hashArr_start_address1 MemPortADDR2 1 18 }  { hashArr_start_ce1 MemPortCE2 1 1 }  { hashArr_start_q1 MemPortDOUT2 0 16 } } }
	hashArr_empty_flag { ap_memory {  { hashArr_empty_flag_address0 mem_address 1 18 }  { hashArr_empty_flag_ce0 mem_ce 1 1 }  { hashArr_empty_flag_q0 mem_dout 0 1 }  { hashArr_empty_flag_address1 MemPortADDR2 1 18 }  { hashArr_empty_flag_ce1 MemPortCE2 1 1 }  { hashArr_empty_flag_q1 MemPortDOUT2 0 1 } } }
	key_offset { ap_none {  { key_offset in_data 0 13 } } }
	hash { ap_none {  { hash in_data 0 14 } } }
	len { ap_none {  { len in_data 0 18 } } }
}
