// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XFILTER_HW_STREAM_H
#define XFILTER_HW_STREAM_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfilter_hw_stream_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XFilter_hw_stream_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XFilter_hw_stream;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFilter_hw_stream_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFilter_hw_stream_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFilter_hw_stream_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFilter_hw_stream_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XFilter_hw_stream_Initialize(XFilter_hw_stream *InstancePtr, u16 DeviceId);
XFilter_hw_stream_Config* XFilter_hw_stream_LookupConfig(u16 DeviceId);
int XFilter_hw_stream_CfgInitialize(XFilter_hw_stream *InstancePtr, XFilter_hw_stream_Config *ConfigPtr);
#else
int XFilter_hw_stream_Initialize(XFilter_hw_stream *InstancePtr, const char* InstanceName);
int XFilter_hw_stream_Release(XFilter_hw_stream *InstancePtr);
#endif

void XFilter_hw_stream_Start(XFilter_hw_stream *InstancePtr);
u32 XFilter_hw_stream_IsDone(XFilter_hw_stream *InstancePtr);
u32 XFilter_hw_stream_IsIdle(XFilter_hw_stream *InstancePtr);
u32 XFilter_hw_stream_IsReady(XFilter_hw_stream *InstancePtr);
void XFilter_hw_stream_Continue(XFilter_hw_stream *InstancePtr);
void XFilter_hw_stream_EnableAutoRestart(XFilter_hw_stream *InstancePtr);
void XFilter_hw_stream_DisableAutoRestart(XFilter_hw_stream *InstancePtr);

void XFilter_hw_stream_Set_Input_r(XFilter_hw_stream *InstancePtr, u64 Data);
u64 XFilter_hw_stream_Get_Input_r(XFilter_hw_stream *InstancePtr);
void XFilter_hw_stream_Set_Output_r(XFilter_hw_stream *InstancePtr, u64 Data);
u64 XFilter_hw_stream_Get_Output_r(XFilter_hw_stream *InstancePtr);

void XFilter_hw_stream_InterruptGlobalEnable(XFilter_hw_stream *InstancePtr);
void XFilter_hw_stream_InterruptGlobalDisable(XFilter_hw_stream *InstancePtr);
void XFilter_hw_stream_InterruptEnable(XFilter_hw_stream *InstancePtr, u32 Mask);
void XFilter_hw_stream_InterruptDisable(XFilter_hw_stream *InstancePtr, u32 Mask);
void XFilter_hw_stream_InterruptClear(XFilter_hw_stream *InstancePtr, u32 Mask);
u32 XFilter_hw_stream_InterruptGetEnabled(XFilter_hw_stream *InstancePtr);
u32 XFilter_hw_stream_InterruptGetStatus(XFilter_hw_stream *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
