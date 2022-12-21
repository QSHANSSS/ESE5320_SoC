// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xencoding.h"

extern XEncoding_Config XEncoding_ConfigTable[];

XEncoding_Config *XEncoding_LookupConfig(u16 DeviceId) {
	XEncoding_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XENCODING_NUM_INSTANCES; Index++) {
		if (XEncoding_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XEncoding_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XEncoding_Initialize(XEncoding *InstancePtr, u16 DeviceId) {
	XEncoding_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XEncoding_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XEncoding_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

