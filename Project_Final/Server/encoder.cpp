
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
#include <thread>
#include <vector>
#include <errno.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <unordered_map>
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
#define fpga
#define sw_write

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
	stopwatch output_timer1;
	stopwatch output_timer2;
	stopwatch cdc_timer;
	stopwatch cdc_para_timer;
	stopwatch sha_dedup_timer;
	stopwatch lzw_sw_timer;
	stopwatch lzw_hw_timer;
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

EventTimer timer1, timer2;
#ifndef test
#ifdef fpga
    
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
    cl::CommandQueue q(context, device, CL_QUEUE_PROFILING_ENABLE | CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE , &err);
    /*std::vector<cl::Kernel> encoding(2);
	encoding[0]=cl::Kernel(program, "encoding:{encoding_1}", &err);
	encoding[1]=cl::Kernel(program, "encoding:{encoding_2}", &err);*/
	cl::Kernel encoding(program, "encoding", &err);
#endif   
    
    int *boundary=(int *)malloc(sizeof(int)*(offset/CHUNK_SIZE));
    int *boundary2=(int *)malloc(sizeof(int)*(offset/CHUNK_SIZE));
    uint8_t chunk_num;chunk_num=2;
    unordered_map<string,int> hash_table;
    uint32_t header=0;
	
    unsigned char  *sizing_output=(unsigned char *)malloc(sizeof(unsigned char)*MAX_CHUNK_SIZE);
    unsigned char  *chunk=(unsigned char *)malloc(sizeof(unsigned char)*MAX_CHUNK_SIZE);
    unsigned char *compressed=(unsigned char *)malloc(offset);
    unsigned int compressed_size=0;
    int *input_length=(int*)malloc(sizeof(int)*2);
    int *output_length=(int*)malloc(sizeof(int)*2);
    // ------------------------------------------------------------------------------------
    // Step 2: Create buffers and initialize test values
    // ------------------------------------------------------------------------------------
#ifdef fpga  
	cl::Buffer in_buf;
    //cl::Buffer in2_buf;
    cl::Buffer out_buf;
    //cl::Buffer out2_buf;
	//uint16_t  *lzw_code=(uint16_t *)malloc(sizeof(uint16_t)*MAX_CHUNK_SIZE);
	uint16_t  *lzw_sw=(uint16_t *)malloc(sizeof(uint16_t)*MAX_CHUNK_SIZE);
    in_buf = cl::Buffer(context,CL_MEM_READ_ONLY, sizeof(unsigned char) * MAX_CHUNK_SIZE);
    out_buf = cl::Buffer(context, CL_MEM_WRITE_ONLY, sizeof(uint16_t) * MAX_CHUNK_SIZE);
    //out2_buf = cl::Buffer(context, /*CL_MEM_ALLOC_HOST_PTR |*/CL_MEM_WRITE_ONLY, sizeof(int)*2);
    //timer2.add("Set kernel arguments");
    std::vector<cl::Event> exec_events, read_events,write_events;;
    cl::Event write_ev, exec_ev, read_ev;
    encoding.setArg(0, in_buf);
    encoding.setArg(2, out_buf);
	//encoding.setArg(3, out2_buf);

	//lzw_code = (uint16_t *)q.enqueueMapBuffer(out_buf, CL_TRUE, CL_MAP_READ, 0, sizeof(uint16_t)*MAX_CHUNK_SIZE);
    //output_length=(int *)q.enqueueMapBuffer(out2_buf, CL_TRUE, CL_MAP_READ, 0, sizeof(int)*2);
	chunk = (unsigned char *)q.enqueueMapBuffer(in_buf, CL_TRUE, CL_MAP_WRITE, 0, sizeof(unsigned char)*MAX_CHUNK_SIZE);
#endif
    vector<unsigned char> LZW_out;


	for(int i=0;i<chunk_num;i++)
	{	
		uint16_t  *lzw_code=(uint16_t *)malloc(sizeof(uint16_t)*MAX_CHUNK_SIZE);
		output_timer2.start();
		output_timer1.start();
		if(i==0){
			cdc_timer.start();
			chunk_num=cdc_new(file,offset,boundary);
			cdc_timer.stop();
		}
		input_length[0]=boundary[i+1]-boundary[i];
		encoding.setArg(1, input_length[0]);
		sha_dedup_timer.start();
		int chunk_match=sha(/*chunk_buff[i]*/file+boundary[i],input_length[0]);
		sha_dedup_timer.stop();
		output_timer1.stop();
		memcpy((chunk),file+boundary[i],input_length[0]);		
		//cout<< "match:" <<chunk_match<<"\n"<<endl;
		if(chunk_match==-1){						
#ifdef fpga 
			lzw_hw_timer.start();  
			//timer2.add("Memory object migration enqueue host->device");  
            q.enqueueMigrateMemObjects({in_buf/*,in2_buf*/}, 0 /* 0 means from host*/, NULL, &write_ev);
            clWaitForEvents(1, (const cl_event *)&write_ev);				
		    //write_events.push_back(write_ev);
			//timer2.add("Running kernel");
			q.enqueueTask(encoding, &write_events, &exec_ev);
			//q.enqueueTask(encoding, NULL, &exec_ev);
    	   // clWaitForEvents(1, (const cl_event *)&exec_ev);
			exec_events.push_back(exec_ev);			
			//timer2.add("Read back computation results (implicit device->host migration)");
			lzw_code = (uint16_t *)q.enqueueMapBuffer(out_buf, CL_TRUE, CL_MAP_READ, 0, sizeof(uint16_t)*MAX_CHUNK_SIZE);
			//q.enqueueMigrateMemObjects({out_buf/*,out2_buf*/}, CL_MIGRATE_MEM_OBJECT_HOST, &exec_events, &read_ev);
			//read_events.push_back(read_ev);
			output_timer2.stop();
			lzw_hw_timer.stop();
			//timer2.add("finish fpga");
#endif	
			lzw_sw_timer.start();
			encoding_sw(file+boundary[i],input_length[0],LZW_out);
			lzw_sw_timer.stop();
			//printf("compressed:%d\n",lzw_code[0]);
			sizing(lzw_code+1,sizing_output,lzw_code[0]);;
			header=( ( (lzw_code[0])*13/8+1)<<1 | 0 );
			//header=LZW_out.size()<<1;
			memcpy((void *)&compressed[compressed_size],(unsigned char*)&header,sizeof(header));
			compressed_size+=sizeof(header);
			//printf("compressed:%d\n",lzw_code[0]*13/8+1);
			
			//memcpy(&compressed[compressed_size],&lzw_code,inout_len[1]);	
			for(int j=0;j<=lzw_code[0]*13/8;j++){
				compressed[compressed_size++]=sizing_output[j];	
				//printf("compressed[%d]:%d\n",j,sizing_output[j]);
		    }
		}
		else{  //duplicated
			 header=(chunk_match<<1 | 1);
			memcpy(&compressed[compressed_size],&header,sizeof(header));
			compressed_size+=sizeof(header);				 
		}		
	}
#ifdef fpga

	q.enqueueUnmapMemObject(in_buf,chunk);
    //q.enqueueUnmapMemObject(out_buf,lzw_code);
	q.finish();
	timer2.finish();
    // std::cout << "--------------- Key execution times ---------------"
    // << std::endl;
    // timer2.print();

	FILE *outfd = fopen(/*"output_compressed.bin"*/argv[2], "wb");
	int bytes_written = fwrite(&compressed[0], 1, compressed_size, outfd);
	printf("write file with %d\n", bytes_written);
	fclose(outfd);
#endif
	

    // timer1.finish();
    // std::cout << "--------------- Total time ---------------"
    // << std::endl;
    // timer1.print();

	// write file to root and you can use diff tool on board
#ifdef sw_write
	FILE *outfd1 = fopen("output_compressed2.bin", "wb");
	int bytes_written_3 = fwrite(&LZW_out[0], 1, LZW_out.size(), outfd1);
	//printf("write file with %d\n", bytes_written_3);
	fclose(outfd1);
#endif
	
	// for (int i =0;i<chunk_num;i++)
	// {
    //     free(chunk_buff[i]);
	// 	free(chunk_hash[i]);
		
	// }
	// free(chunk_match);
	// free(boundary);
	// free(chunk);
	// free(compressed);
	// free(lzw_code);
	
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
    
	std::cout << "--------------- cdc Throughputs ---------------" << std::endl;
	float output_latency_cdc = cdc_timer.latency() / 1000.0;
	float output_throughput_cdc = (bytes_written_2 * 8 / 1000000.0) / output_latency_cdc; // Mb/s
	std::cout << "Output Throughput of cdc: " << output_throughput_cdc << " Mb/s."
			<< " (Latency: " << output_latency_cdc << "s)." << std::endl;

	std::cout << "--------------- sha/dedup Throughputs ---------------" << std::endl;
	float output_latency_sha = sha_dedup_timer.latency() / 1000.0;
	float output_throughput_sha = (bytes_written_2 * 8 / 1000000.0) / output_latency_sha; // Mb/s
	std::cout << "Output Throughput of sha/dedup: " << output_throughput_sha << " Mb/s."
			<< " (Latency: " << output_latency_sha << "s)." << std::endl;
    
	std::cout << "--------------- output Throughputs for first 3 blocks---------------" << std::endl;
	float output_latency = output_timer1.latency() / 1000.0;
	float output_throughput = (bytes_written_2 * 8 / 1000000.0) / output_latency; // Mb/s
	std::cout << "Output Throughput of first 3 blocks to Encoder: " << output_throughput << " Mb/s."
			<< " (Latency: " << output_latency << "s)." << std::endl;

	std::cout << "--------------- sw_lzw output Throughputs ---------------" << std::endl;
	float output_latency3 = lzw_sw_timer.latency() / 1000.0;
	float output_throughput3 = (bytes_written * 8 / 1000000.0) / output_latency3; // Mb/s
	std::cout << "lzw_sw Output Throughput to Encoder: " << output_throughput3 << " Mb/s."
			<< " (Latency: " << output_latency3 << "s)." << std::endl;

	std::cout << "--------------- hw_lzw output Throughputs ---------------" << std::endl;
	float output_latency4 = lzw_hw_timer.latency() / 1000.0;
	float output_throughput4 = (bytes_written * 8 / 1000000.0) / output_latency4; // Mb/s
	std::cout << "lzw_hw Output Throughput to Encoder: " << output_throughput4 << " Mb/s."
			<< " (Latency: " << output_latency4 << "s)." << std::endl;

	std::cout << "--------------- overall output Throughputs ---------------" << std::endl;
	float output_latency2 = output_timer2.latency() / 1000.0;
	float output_throughput2 = (bytes_written * 8 / 1000000.0) / output_latency2; // Mb/s
	std::cout << "overall Output Throughput to Encoder: " << output_throughput2 << " Mb/s."
			<< " (Latency: " << output_latency2 << "s)." << std::endl;
#endif
          //string str="fjfkfkugl  rhetjr4   erheheh   gewhe6j4j4j";
	//vector<int> LZW_output=encoding(str/*chunk_match[i],i*/);
	return 0;
}

