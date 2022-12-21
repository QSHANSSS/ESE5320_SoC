
#define CL_HPP_CL_1_2_DEFAULT_BUILD
#define CL_HPP_TARGET_OPENCL_VERSION 120
#define CL_HPP_MINIMUM_OPENCL_VERSION 120
#define CL_HPP_ENABLE_PROGRAM_CONSTRUCTION_FROM_ARRAY_COMPATIBILITY 1
#define CL_USE_DEPRECATED_OPENCL_1_2_APIS
#include <CL/cl2.hpp>
#include <cstdint>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include "server.h"
#include <unistd.h>
#include <fcntl.h>
#include <pthread.h>
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "stopwatch.h"
#include "encoder.h"
#include "../common/EventTimer.h"
#include "../common/Utilities.h"
#define NUM_PACKETS 8
#define pipe_depth 4
#define MAX_CHUNK_SIZE 8192
#define CHUNK_SIZE 4096
#define DONE_BIT_L (1 << 7)
#define DONE_BIT_H (1 << 15)

//#define test

int offset = 0;
unsigned char* file;
using namespace std;
void handle_input(int argc, char* argv[], int* blocksize) {
	int x;
	extern char *optarg;

	while ((x = getopt(argc, argv, ":c:")) != -1) {
		switch (x) {
		case 'c':
			*blocksize = atoi(optarg);
			printf("blocksize is set to %d optarg\n", *blocksize);
			break;
		case ':':
			printf("-%c without parameter\n", optopt);
			break;
		}
	}
}

int main(int argc, char* argv[]) {
#ifndef lzw_test 
	stopwatch ethernet_timer;
	stopwatch output_timer;
	unsigned char* input[NUM_PACKETS];
//#ifdef ethernet
	int writer = 0;
	int done = 0;
	int length = 0;
	int count = 0;
	ESE532_Server server;

	// default is 2k
	int blocksize = BLOCKSIZE;

	// set blocksize if decalred through command line
	//handle_input(argc, argv, &blocksize);

	file = (unsigned char*) malloc(sizeof(unsigned char) * 70000000);
	if (file == NULL) {
		printf("help\n");
	}

	for (int i = 0; i < NUM_PACKETS; i++) {
		input[i] = (unsigned char*) malloc(
				sizeof(unsigned char) * (NUM_ELEMENTS + HEADER));
		if (input[i] == NULL) {
			std::cout << "aborting " << std::endl;
			return 1;
		}
	}

	server.setup_server(blocksize);

	writer = pipe_depth;
	server.get_packet(input[writer]);

	count++;

	// get packet
	unsigned char* buffer = input[writer];

	// decode
	done = buffer[1] & DONE_BIT_L;
	length = buffer[0] | (buffer[1] << 8);
	length &= ~DONE_BIT_H;
	// printing takes time so be weary of transfer rate
	printf("length: %d offset %d\n",length,offset);

	// we are just memcpy'ing here, but you should call your
	// top function here.
	memcpy(&file[offset], &buffer[HEADER], length);

	offset += length;
	writer++;

	//last message
	while (!done) {
		// reset ring buffer
		if (writer == NUM_PACKETS) {
			writer = 0;
		}

		ethernet_timer.start();
		server.get_packet(input[writer]);
		ethernet_timer.stop();

		count++;

		// get packet
		unsigned char* buffer = input[writer];

		// decode
		done = buffer[1] & DONE_BIT_L;
		length = buffer[0] | (buffer[1] << 8);
		length &= ~DONE_BIT_H;
		printf("length: %d offset %d\n",length,offset);
		memcpy(&file[offset], &buffer[HEADER], length);

		offset += length;
		writer++;
	}


#ifndef test

    EventTimer timer1, timer2;
    timer1.add("Main program");

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
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE, &err);
    cl::Kernel encoding(program, "encoding", &err);
   
    int *boundary=(int *)malloc(sizeof(int)*(offset/CHUNK_SIZE+100));
    
    
    uint16_t chunk_num=cdc_new(file,offset,boundary);

	printf("chunk_num is %d\n",chunk_num);

    int *chunk_match=(int *)malloc(sizeof(int)*chunk_num);
	unsigned char *chunk_buff[chunk_num];
	unsigned char *chunk_hash[chunk_num];
	for (int num = 0; num < chunk_num; num++)
  	{
    	    chunk_buff[num] =( unsigned char *)malloc(sizeof(unsigned char)*(8192));
	    chunk_hash[num] = (unsigned char *)malloc(sizeof(unsigned char)*(48));
	    memcpy(chunk_buff[num],file+boundary[num],boundary[num+1]-boundary[num]);
             // if (chunk_buff[num] == NULL || chunk_hash[num] == NULL )
                //       printf("malloc failed at main for 2Darray");
        }
    uint32_t header=0;
    unsigned char  *lzw_code=(unsigned char *)malloc(sizeof(unsigned char)*MAX_CHUNK_SIZE);
    unsigned char  *chunk=(unsigned char *)malloc(sizeof(unsigned char)*MAX_CHUNK_SIZE);
    unsigned char *compressed=(unsigned char *)malloc(offset);
    unsigned int compressed_size=0;
    // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
    cl::Buffer in_buf;
    cl::Buffer in2_buf;
    cl::Buffer out_buf;
    cl::Buffer out2_buf;

    in_buf = cl::Buffer(context, CL_MEM_READ_ONLY, sizeof(unsigned char) * MAX_CHUNK_SIZE, NULL, &err);
    in2_buf = cl::Buffer(context, CL_MEM_READ_ONLY, sizeof(int)*2, NULL, &err);
    out_buf = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(unsigned char) * MAX_CHUNK_SIZE, NULL, &err);
    out2_buf = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(int)*2, NULL, &err);
    
    int *input_length=(int *)malloc(sizeof(int)*2);
    int *output_length=(int *)malloc(sizeof(int)*2);
    
    input_length=(int *)q.enqueueMapBuffer(in2_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(int)*2);
    chunk = (unsigned char *)q.enqueueMapBuffer(in_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(unsigned char)*MAX_CHUNK_SIZE);
    lzw_code = (unsigned char *)q.enqueueMapBuffer(out_buf, CL_TRUE, CL_MAP_READ, 0, sizeof(unsigned char)*MAX_CHUNK_SIZE);
    output_length=(int *)q.enqueueMapBuffer(out2_buf, CL_TRUE, CL_MAP_READ, 0, sizeof(int)*2);
    
    //std::vector<cl::Event>write_events;
    
	for(int i=0;i<chunk_num;i++)
	{
	        //chunk_buff[i] = (unsigned char *)q.enqueueMapBuffer(in_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(unsigned char)*MAX_CHUNK_SIZE);
       		//memcpy((chunk),file+boundary[i],boundary[i+1]-boundary[i]);
       		input_length[0]=boundary[i+1]-boundary[i];
			for(int j=0;j<input_length[0];j++)
				chunk[boundary[i]++]=chunk_buff[i][j];	
       		
       		printf("input_len:%d\n",input_length[0]);
                //memcpy((input_length), &length,2);
				
		SHA(chunk_buff[i],chunk_hash[i]);//SHA(chunk_buff[i],chunk_hash[i]);		
		match(chunk_hash,chunk_num,chunk_match,i);
		output_timer.start();

		//cout<< "match:" <<chunk_match[i]<<"\n"<<endl;
		if(chunk_match[i]==0){
			//encoding(chunk_buff[i],inout_len,lzw_code);
			// ------------------------------------------------------------------------------------
    			// Step 3: Run the kernel
    			// ------------------------------------------------------------------------------------
    			cout<< "test1" <<endl;
    			timer2.add("Running kernel");
   
    			std::vector<cl::Event> exec_events, read_events,write_events;;
    			cl::Event write_ev, exec_ev, read_ev;

    			encoding.setArg(0, in_buf);
    			encoding.setArg(1, in2_buf);
				encoding.setArg(2, out_buf);
				encoding.setArg(3, out2_buf);
    			if(i == 0)
        		{
            			q.enqueueMigrateMemObjects({in_buf,in2_buf}, 0 /* 0 means from host*/, NULL, &write_ev);
            			//clWaitForEvents(1, (const cl_event *)&write_ev);
						printf("debug0\n");
        		}
        		
        		else
        		{
           			 q.enqueueMigrateMemObjects({in_buf,in2_buf}, 0 /* 0 means from host*/, &write_events, &write_ev);
             		 //clWaitForEvents(1, (const cl_event *)&write_ev);
						printf("debug0\n");
						write_events.pop_back();
					 
        		}
			
		    write_events.push_back(write_ev);
			q.enqueueTask(encoding, &write_events, &exec_ev);
			//q.enqueueTask(encoding, NULL, &write_ev);
    		//clWaitForEvents(1, (const cl_event *)&exec_ev);
            printf("debug1\n");
			exec_events.push_back(exec_ev);

			
			q.enqueueMigrateMemObjects({out_buf,out2_buf}, CL_MIGRATE_MEM_OBJECT_HOST, &exec_events, &read_ev);
			read_events.push_back(read_ev);
		    printf("debug2\n");
			output_timer.stop();


			header=(output_length[0]<<1);
			memcpy((void *)&compressed[compressed_size],(unsigned char*)&header,sizeof(header));
			compressed_size+=sizeof(header);
			printf("compressed:%d\n",header);
			printf("compressed:%d\n",compressed[1]);
			//memcpy(&compressed[compressed_size],&lzw_code,inout_len[1]);	
			for(int j=0;j<output_length[0];j++)
				compressed[compressed_size++]=lzw_code[j];	

		}
		else{  //duplicated
			 header=(chunk_match[i]<<1 | 1);
			memcpy(&compressed[compressed_size],&header,sizeof(header));
			compressed_size+=sizeof(header);
				 
		}
		
	}
	q.finish();
	timer2.finish();
    std::cout << "--------------- Key execution times ---------------"
    << std::endl;
    timer2.print();

    timer1.finish();
    std::cout << "--------------- Total time ---------------"
    << std::endl;
    timer1.print();

	// write file to root and you can use diff tool on board
	FILE *outfd = fopen("output_compressed.bin", "wb");
	int bytes_written = fwrite(&compressed[0], 1, compressed_size, outfd);
	printf("write file with %d\n", bytes_written);
	fclose(outfd);
          //memcpy(&file[0],(unsigned char*)&header,sizeof(header));
	
	
	/*for (int i =0;i<chunk_num;i++)
	{
        free(chunk_buff[i]);
		free(chunk_hash[i]);
		
	}
	free(chunk_match);
	free(boundary);*/
	
#endif
	FILE *outfd2 = fopen("output_cpu.bin", "wb");
	int bytes_written_2 = fwrite(&file[0], 1, offset, outfd2);
	printf("write file with %d\n", bytes_written_2);
	fclose(outfd2);
	//free(file);
	std::cout << "--------------- Key Throughputs ---------------" << std::endl;
	float ethernet_latency = ethernet_timer.latency() / 1000.0;
	float input_throughput = (bytes_written_2 * 8 / 1000000.0) / ethernet_latency; // Mb/s
	std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
			<< " (Latency: " << ethernet_latency << "s)." << std::endl;
	std::cout << "--------------- output Throughputs ---------------" << std::endl;
	float output_latency = output_timer.latency() / 1000.0;
	float output_throughput = (bytes_written * 8 / 1000000.0) / output_latency; // Mb/s
	std::cout << "Output Throughput to Encoder: " << output_throughput << " Mb/s."
			<< " (Latency: " << output_latency << "s)." << std::endl;
#endif
          //string str="fjfkfkugl  rhetjr4   erheheh   gewhe6j4j4j";
	//vector<int> LZW_output=encoding(str/*chunk_match[i],i*/);
	return 0;
}

