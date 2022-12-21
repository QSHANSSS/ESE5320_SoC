
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
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE, &err);
    
    std::vector<cl::Kernel> encoder(2);
    encoder[0]=cl::Kernel(program, "encoder:{encoder_1}", &err);
    encoder[1]=cl::Kernel(program, "encoder:{encoder_2}", &err);



    
    int *boundary=(int *)malloc(sizeof(int)*(offset/CHUNK_SIZE+100));

    uint16_t chunk_num=cdc_new(file,offset,boundary);

	printf("chunk_num is %d\n",chunk_num);
    //printf("boundary is:%d %d %d\n",boundary[0],boundary[1],boundary[2]);
    int *chunk_match=(int *)malloc(sizeof(int)*chunk_num);
	unsigned char *chunk_buff[chunk_num];
	unsigned char *chunk_hash[chunk_num];
	for (int num = 0; num < chunk_num; num++)
  	{
    	chunk_buff[num] =( unsigned char *)malloc(sizeof(unsigned char)*(8192));
	    chunk_hash[num] = (unsigned char *)malloc(sizeof(unsigned char)*(48));
	    //compressed[num] = (unsigned char *)malloc(sizeof(unsigned char)*(8192));
	    if(num==0)
	      memcpy(chunk_buff[num],file+boundary[num],boundary[num+1]-boundary[num]);
	    else
	      memcpy(chunk_buff[num],file+boundary[num],boundary[num+1]-boundary[num]);
             // if (chunk_buff[num] == NULL || chunk_hash[num] == NULL )
                //       printf("malloc failed at main for 2Darray");
          }
     // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
    cl::Buffer in_buf;
    cl::Buffer  in2_buf;
    cl::Buffer out_buf;

    in_buf = cl::Buffer(context, CL_MEM_READ_ONLY, sizeof(unsigned char) * MAX_CHUNK_SIZE, NULL, &err);
    in2_buf = cl::Buffer(context, CL_MEM_READ_ONLY, sizeof(int) * MAX_CHUNK_SIZE, NULL, &err);
    out_buf = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(unsigned char) * MAX_CHUNK_SIZE, NULL, &err);
    
    //std::vector<unsigned char> vec_output;
    //std::string str="";
    unsigned char *LZW_input;
    LZW_input = (unsigned char *)q.enqueueMapBuffer(in_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(unsigned char)*MAX_CHUNK_SIZE);
    
    //unsigned char * ptr;
    //ptr = &LZW_code[0];
    unsigned char *LZW_code;
    LZW_code = (unsigned char *)q.enqueueMapBuffer(out_buf, CL_TRUE, CL_MAP_READ, 0, sizeof(unsigned char)*MAX_CHUNK_SIZE);

  
    int *chunk_size;
    chunk_size = (int *)q.enqueueMapBuffer(in2_buf, CL_TRUE, CL_MAP_READ, 0,sizeof(int));
   
   
    std::vector<cl::Event> write_events;

	
	for(int i=0;i<chunk_num;i++)
	{
		//cout<<".....debug.....\n"<<endl;
		SHA(chunk_buff[i],chunk_hash[i]);
		match(chunk_hash,chunk_num,chunk_match,i);
		
		//string str="";
		//std::vector<unsigned char> vec(str,str+sizeof(str));
		
		//for(int j=0;j<boundary[i+1]-boundary[i];j++)
		//	LZW_code.push_back(chunk_buff[i][j]);
			
		
			
		//std::string str_lzw(vec.begin(),vec.end());
		
		
			//str=str+string(1,chunk_buff[i][j]);
		//for(int i=0;i<str.length();i++)
		//	cout<<str[i]<<endl;
		if(chunk_match[i]==0){
			//encoding(chunk_buff[i],boundary[i+1]-boundary[i],LZW_code);
			// ------------------------------------------------------------------------------------
    			// Step 3: Run the kernel
    			// ------------------------------------------------------------------------------------
    	                //encoding(chunk_buff[i],boundary[i+1]-boundary[i], LZW_code); // lzw
    			timer2.add("Running kernel");
   
    			std::vector<cl::Event> exec_events, read_events;
    			cl::Event write_ev, exec_ev, read_ev;

    			encoder[0].setArg(0, in_buf);
    			encoder[0].setArg(1, out_buf);
                        encoder[1].setArg(0, in_buf);
    			encoder[1].setArg(1, out_buf);
    			timer2.add("Memory object migration enqueue host->device");
    			cl::Event event_sp;
    			if(i == 0)
        		{
            			q.enqueueMigrateMemObjects({in_buf}, 0 /* 0 means from host*/, NULL, &write_ev);
        		}
        		else
        		{
           			 q.enqueueMigrateMemObjects({out_buf}, 0 /* 0 means from host*/, &write_events,
            			&write_ev);
            			write_events.pop_back();
        		}

        		write_events.push_back(write_ev);
        		q.enqueueTask(encoder[0], &write_events, &exec_ev);
        		q.enqueueTask(encoder[1], &write_events, &exec_ev);
        		exec_events.push_back(exec_ev);
        		q.enqueueMigrateMemObjects({out_buf}, CL_MIGRATE_MEM_OBJECT_HOST, &exec_events, &read_ev);
        		read_events.push_back(read_ev);
		
           		timer2.add("Allocate contiguous OpenCL buffers");
		}
		else{
			uint32_t header=(chunk_match[i]<<1 | 1);
				 
				 //size_t len = sizeof(LZW_code);
				 //unsigned char* new_LZW_code = new unsigned char[len+5];
				 //strcpy(new_LZW_code, LZW_code);
				 //memcpy(new_LZW_code, LZW_code, siz
				 //new_LZW_code[len] = header;
				 //new_LZW_code[len+1] = header >> 8;
				 //new_LZW_code[len+2] = header >> 16;
				 //new_LZW_code[len+3] = header >> 24;
				 //new_LZW_code[len+4] = '\0';
				
				std::vector<unsigned char> LZW_code_vec(LZW_code,LZW_code + sizeof(unsigned char)*MAX_CHUNK_SIZE);
        			
        			LZW_code_vec.push_back(header);
        			LZW_code_vec.push_back(header>>8);
        			LZW_code_vec.push_back(header>>16);
        			LZW_code_vec.push_back(header>>24);
        			
        			LZW_code = &LZW_code_vec[0];
        			
		}
		//decoding(LZW_code);
		
	}
         q.finish();
	// write file to root and you can use diff tool on board
	FILE *outfd = fopen("output_compressed.bin", "wb");
	int bytes_written = fwrite(&LZW_code[0], 1, sizeof(LZW_code), outfd);
	printf("write file with %d\n", bytes_written);
	fclose(outfd);
          //memcpy(&file[0],(unsigned char*)&header,sizeof(header));
	
	
	for (int i =0;i<chunk_num;i++)
	{
          	free(chunk_buff[i]);
		free(chunk_hash[i]);
		
	}
	free(chunk_match);
	free(boundary);
	
#endif
	FILE *outfd2 = fopen("output_cpu.bin", "wb");
	int bytes_written_2 = fwrite(&file[0], 1, offset, outfd2);
	printf("write file with %d\n", bytes_written_2);
	fclose(outfd2);
	free(file);
	std::cout << "--------------- Key Throughputs ---------------" << std::endl;
	float ethernet_latency = ethernet_timer.latency() / 1000.0;
	float input_throughput = (bytes_written_2 * 8 / 1000000.0) / ethernet_latency; // Mb/s
	std::cout << "Input Throughput to Encoder: " << input_throughput << " Mb/s."
			<< " (Latency: " << ethernet_latency << "s)." << std::endl;
#endif
          //string str="fjfkfkugl  rhetjr4   erheheh   gewhe6j4j4j";
	//vector<int> LZW_output=encoding(str/*chunk_match[i],i*/);
	return 0;
}

