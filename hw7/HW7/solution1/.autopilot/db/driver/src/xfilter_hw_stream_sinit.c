// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xfilter_hw_stream.h"

extern XFilter_hw_stream_Config XFilter_hw_stream_ConfigTable[];

XFilter_hw_stream_Config *XFilter_hw_stream_LookupConfig(u16 DeviceId) {
	XFilter_hw_stream_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFILTER_HW_STREAM_NUM_INSTANCES; Index++) {
		if (XFilter_hw_stream_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFilter_hw_stream_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFilter_hw_stream_Initialize(XFilter_hw_stream *InstancePtr, u16 DeviceId) {
	XFilter_hw_stream_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFilter_hw_stream_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFilter_hw_stream_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

