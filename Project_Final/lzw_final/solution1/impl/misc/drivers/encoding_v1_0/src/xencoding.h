// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XENCODING_H
#define XENCODING_H

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
#include "xencoding_hw.h"

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
} XEncoding_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XEncoding;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XEncoding_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XEncoding_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XEncoding_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XEncoding_ReadReg(BaseAddress, RegOffset) \
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
int XEncoding_Initialize(XEncoding *InstancePtr, u16 DeviceId);
XEncoding_Config* XEncoding_LookupConfig(u16 DeviceId);
int XEncoding_CfgInitialize(XEncoding *InstancePtr, XEncoding_Config *ConfigPtr);
#else
int XEncoding_Initialize(XEncoding *InstancePtr, const char* InstanceName);
int XEncoding_Release(XEncoding *InstancePtr);
#endif

void XEncoding_Start(XEncoding *InstancePtr);
u32 XEncoding_IsDone(XEncoding *InstancePtr);
u32 XEncoding_IsIdle(XEncoding *InstancePtr);
u32 XEncoding_IsReady(XEncoding *InstancePtr);
void XEncoding_Continue(XEncoding *InstancePtr);
void XEncoding_EnableAutoRestart(XEncoding *InstancePtr);
void XEncoding_DisableAutoRestart(XEncoding *InstancePtr);

void XEncoding_Set_buff(XEncoding *InstancePtr, u64 Data);
u64 XEncoding_Get_buff(XEncoding *InstancePtr);
void XEncoding_Set_input_length(XEncoding *InstancePtr, u64 Data);
u64 XEncoding_Get_input_length(XEncoding *InstancePtr);
void XEncoding_Set_output_compress(XEncoding *InstancePtr, u64 Data);
u64 XEncoding_Get_output_compress(XEncoding *InstancePtr);
void XEncoding_Set_output_length(XEncoding *InstancePtr, u64 Data);
u64 XEncoding_Get_output_length(XEncoding *InstancePtr);

void XEncoding_InterruptGlobalEnable(XEncoding *InstancePtr);
void XEncoding_InterruptGlobalDisable(XEncoding *InstancePtr);
void XEncoding_InterruptEnable(XEncoding *InstancePtr, u32 Mask);
void XEncoding_InterruptDisable(XEncoding *InstancePtr, u32 Mask);
void XEncoding_InterruptClear(XEncoding *InstancePtr, u32 Mask);
u32 XEncoding_InterruptGetEnabled(XEncoding *InstancePtr);
u32 XEncoding_InterruptGetStatus(XEncoding *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
