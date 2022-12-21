// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xencoding.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XEncoding_CfgInitialize(XEncoding *InstancePtr, XEncoding_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XEncoding_Start(XEncoding *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_AP_CTRL) & 0x80;
    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XEncoding_IsDone(XEncoding *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XEncoding_IsIdle(XEncoding *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XEncoding_IsReady(XEncoding *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XEncoding_Continue(XEncoding *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_AP_CTRL) & 0x80;
    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XEncoding_EnableAutoRestart(XEncoding *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XEncoding_DisableAutoRestart(XEncoding *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_AP_CTRL, 0);
}

void XEncoding_Set_buff(XEncoding *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_BUFF_DATA, (u32)(Data));
    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_BUFF_DATA + 4, (u32)(Data >> 32));
}

u64 XEncoding_Get_buff(XEncoding *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_BUFF_DATA);
    Data += (u64)XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_BUFF_DATA + 4) << 32;
    return Data;
}

void XEncoding_Set_input_length(XEncoding *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_INPUT_LENGTH_DATA, (u32)(Data));
    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_INPUT_LENGTH_DATA + 4, (u32)(Data >> 32));
}

u64 XEncoding_Get_input_length(XEncoding *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_INPUT_LENGTH_DATA);
    Data += (u64)XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_INPUT_LENGTH_DATA + 4) << 32;
    return Data;
}

void XEncoding_Set_output_compress(XEncoding *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_OUTPUT_COMPRESS_DATA, (u32)(Data));
    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_OUTPUT_COMPRESS_DATA + 4, (u32)(Data >> 32));
}

u64 XEncoding_Get_output_compress(XEncoding *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_OUTPUT_COMPRESS_DATA);
    Data += (u64)XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_OUTPUT_COMPRESS_DATA + 4) << 32;
    return Data;
}

void XEncoding_Set_output_length(XEncoding *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_OUTPUT_LENGTH_DATA, (u32)(Data));
    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_OUTPUT_LENGTH_DATA + 4, (u32)(Data >> 32));
}

u64 XEncoding_Get_output_length(XEncoding *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_OUTPUT_LENGTH_DATA);
    Data += (u64)XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_OUTPUT_LENGTH_DATA + 4) << 32;
    return Data;
}

void XEncoding_InterruptGlobalEnable(XEncoding *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_GIE, 1);
}

void XEncoding_InterruptGlobalDisable(XEncoding *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_GIE, 0);
}

void XEncoding_InterruptEnable(XEncoding *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_IER);
    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_IER, Register | Mask);
}

void XEncoding_InterruptDisable(XEncoding *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_IER);
    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_IER, Register & (~Mask));
}

void XEncoding_InterruptClear(XEncoding *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XEncoding_WriteReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_ISR, Mask);
}

u32 XEncoding_InterruptGetEnabled(XEncoding *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_IER);
}

u32 XEncoding_InterruptGetStatus(XEncoding *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XEncoding_ReadReg(InstancePtr->Control_BaseAddress, XENCODING_CONTROL_ADDR_ISR);
}

