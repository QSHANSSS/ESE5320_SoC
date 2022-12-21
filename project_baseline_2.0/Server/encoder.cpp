
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
	handle_input(argc, argv, &blocksize);

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
          vector<unsigned char> LZW_code;

          int *boundary=(int *)malloc(sizeof(int)*(offset/CHUNK_SIZE+30));

          uint16_t chunk_num=cdc_new(file,offset,boundary);

	printf("chunk_num is %d\n",chunk_num);
          //printf("boundary is:%d %d %d\n",boundary[0],boundary[1],boundary[2]);
          int *chunk_match=(int *)malloc(sizeof(int)*chunk_num);
	unsigned char *chunk_buff[chunk_num];
	unsigned char *chunk_hash[chunk_num];
	//unsigned char *compressed[chunk_num];
	//uint32_t *header=(uint32_t *)malloc(sizeof(uint32_t)*chunk_num);
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
	    //for(int j=0;j<boundary[num+1]-boundary[num];j++)
	      	//chunk_buff[num][j]=file[k++];
          }

	for(int i=0;i<chunk_num;i++)
	{
		//cout<<".....debug.....\n"<<endl;
		SHA(chunk_buff[i],chunk_hash[i]);
		match(chunk_hash,chunk_num,chunk_match,i);
		string str="";
		for(int j=0;j<boundary[i+1]-boundary[i];j++)
			str=str+string(1,chunk_buff[i][j]);
		//string str(chunk_buff[i]);
		//for(int i=0;i<str.length();i++)
		//	cout<<str[i]<<endl;
		if(chunk_match[i]==0){
			encoding(str,LZW_code);
			cout<<LZW_code.size()<<"\n"<<endl;
		}
		else{
			uint32_t header=(chunk_match[i]<<1 | 1);
        			LZW_code.push_back(header);
        			LZW_code.push_back(header>>8);
        			LZW_code.push_back(header>>16);
        			LZW_code.push_back(header>>24);
		}
		//decoding(LZW_code);
		
	}
           
	// write file to root and you can use diff tool on board
	FILE *outfd = fopen("output_compressed.bin", "wb");
	int bytes_written = fwrite(&LZW_code[0], 1, LZW_code.size(), outfd);
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

