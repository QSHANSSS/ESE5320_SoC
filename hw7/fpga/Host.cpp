
#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS

#include <CL/cl2.hpp>
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <unistd.h>
#include <vector>
#include "Pipeline.h"
#include "Stopwatch.h"
#include "../common/EventTimer.h"
#include "../common/Utilities.h"
#define STAGES (4)

int main(int argc, char *argv[])
{
   EventTimer timer1, timer2;
    timer2.add("Main program");
    // ------------------------------------------------------------------------------------
    // Step 1: Initialize the OpenCL environment
     // ------------------------------------------------------------------------------------
    timer2.add("OpenCL Initialization");
    cl_int err;
    std::string binaryFile = argv[1];
    unsigned fileBufSize;
    std::vector<cl::Device> devices = get_xilinx_devices();
    devices.resize(1);
    cl::Device device = devices[0];
    cl::Context context(device, NULL, NULL, NULL, &err);
    char *fileBuf = read_binary_file(binaryFile, fileBufSize);
    cl::Program::Binaries bins{{fileBuf, fileBufSize}};
    cl::Program program(context, devices, bins, NULL, &err);
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE|CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE,&err);
    cl::Kernel Filter_HW(program, "Filter_HW", &err);
   unsigned char *Input_data = (unsigned char *)malloc(FRAMES * INPUT_FRAME_SIZE);
   unsigned char *Temp_data[STAGES - 1];
   unsigned char *Output_data = (unsigned char *)malloc(MAX_OUTPUT_SIZE);
   
   for (int Stage = 0; Stage < STAGES - 1; Stage++)
   {
     Temp_data[Stage] = (unsigned char *)malloc(INPUT_FRAME_SIZE);
     if (Temp_data[Stage] == NULL)
       Exit_with_error("malloc failed at main for Temp_data");
   }

    Load_data(Input_data);
    int Size=0;  



    for (int Frame = 0; Frame < FRAMES; Frame++)
  {

    Scale_SW(Input_data + Frame * INPUT_FRAME_SIZE, Temp_data[0]);
    
    // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------

    timer2.add("Allocate contiguous OpenCL buffers");
    size_t elements_per_iteration = FRAMES * INPUT_FRAME_SIZE;
    //size_t bytes_per_iteration = elements_per_iteration * sizeof(unsigned char);

    cl::Buffer in_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_READ_ONLY,  sizeof(unsigned char *) * SCALED_FRAME_SIZE, NULL, &err);
    cl::Buffer out_buf(context, CL_MEM_ALLOC_HOST_PTR | CL_MEM_WRITE_ONLY, sizeof(unsigned char *) * OUTPUT_FRAME_SIZE, NULL, &err);
    unsigned char *in = (unsigned char *)q.enqueueMapBuffer(in_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(unsigned char*) * OUTPUT_FRAME_SIZE); 
    unsigned char *out_sw = (unsigned char *)malloc(OUTPUT_FRAME_SIZE);

    timer2.add("Populating buffer inputs");
    for(int i=0;i<SCALED_FRAME_SIZE;i++)
          in[i]=Temp_data[0][i];
    // ------------------------------------------------------------------------------------
    // Step 3: Run the kernel
    // ------------------------------------------------------------------------------------

    timer2.add("Running kernel");
    std::vector<cl::Event> write_events;
    std::vector<cl::Event> exec_events, read_events;
    cl::Event write_ev, exec_ev, read_ev;

    Filter_HW.setArg(0, in_buf);
    Filter_HW.setArg(1, out_buf);

    timer2.add("Memory object migration enqueue host->device");
    cl::Event event_sp;
    q.enqueueMigrateMemObjects({in_buf}, 0 /* 0 means from host*/, NULL, &event_sp); 
    clWaitForEvents(1, (const cl_event *)&event_sp);

    timer2.add("Launch Filter kernel");
    q.enqueueTask(Filter_HW, NULL, &event_sp);
    timer2.add("Wait for Filter kernel to finish running");
    clWaitForEvents(1, (const cl_event *)&event_sp);
    
    timer2.add("Read back computation results (implicit device->host migration)");
    unsigned char *out = (unsigned char *)q.enqueueMapBuffer(out_buf, CL_TRUE, CL_MAP_READ, 0, sizeof(unsigned char *) * OUTPUT_FRAME_SIZE);
    timer2.finish();
     for(int i=0;i<OUTPUT_FRAME_SIZE;i++)
          Temp_data[1][i]=out[i];
    // ------------------------------------------------------------------------------------
    // Step 4: Release Allocated Resources
    // ------------------------------------------------------------------------------------

    //Filter_SW(in, out_sw);
   // bool match = Compare_matrices(out_sw, Temp_data[1]);
    //free(out_sw);
    delete[] fileBuf;
    q.enqueueUnmapMemObject(in_buf, in);
    q.enqueueUnmapMemObject(out_buf, Temp_data[1]);
    q.finish();

    std::cout << "--------------- Key execution times ---------------" << std::endl;
    timer2.print();

    //std::cout << "TEST " << (match ? "PASSED" : "FAILED") << std::endl; 
    //return (match ? EXIT_SUCCESS : EXIT_FAILURE);



    Differentiate_SW(Temp_data[1], Temp_data[2]);
 
    Size = Compress_SW(Temp_data[2], Output_data);
  
  }


  Store_data("Output.bin", Output_data, Size);
  Check_data(Output_data, Size);
  for (int i = 0; i < STAGES - 1; i++)
       free(Temp_data[i]);

  free(Input_data);
  free(Output_data);
  return EXIT_SUCCESS;
}

