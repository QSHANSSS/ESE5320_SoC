#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <thread>
#include "App.h"
#define WIN_SIZE 16
#define PRIME 3
#define MODULUS 4096
#define TARGET 0
#define NUM_THREADS 4
using namespace std;
stopwatch time_cdc;
stopwatch time_cdc_4core;
uint64_t hash_func(unsigned char *input, unsigned int pos)
{
	// put your hash function implementation here
	uint64_t hash=0;
	for(int i=0;i<WIN_SIZE;i++)
	{
		unsigned char temp=input[pos+WIN_SIZE-1-i];
		hash+=int(temp)*(pow(PRIME, i+1));
	}
	return hash;
}
void cdc(unsigned char *buff, unsigned int buff_size)
{
	// put your cdc implementation here
   for(int i=WIN_SIZE;i<buff_size-WIN_SIZE;i++)
   {
	static int chunk;
	printf("chunk%d:%d\n",chunk,buff[i]-'0');
     if((hash_func(buff,i)%MODULUS)==TARGET) {
	
	printf("chunk %d\n",chunk++);
	//printf("%d\n",i);
	printf("\n******************************************************\n");
     }
	  
   }
}
void cdc_new(unsigned char *buff, unsigned int buff_size)
{  
	// put your cdc implementation here
   uint64_t a=hash_func(buff,WIN_SIZE);
   for(int i=WIN_SIZE;i<buff_size-WIN_SIZE;i++)
   {
	 if(i>WIN_SIZE)
	   a=a*PRIME-int(buff[i-1])*pow(PRIME, WIN_SIZE+1)+int(buff[i-1+WIN_SIZE])*PRIME;
           if((a%MODULUS)==TARGET) ;
	   //printf("%d\n",i);
   }
}
void cdc_4core(unsigned char *buff, unsigned int buff_size,int start_idx,int end_idx)
{
	int last_boundary=0;
	uint64_t a=hash_func(buff,WIN_SIZE);
	for(int i=start_idx;i<end_idx;i++)
   {
	 if(i>WIN_SIZE)
	   a=a*PRIME-int(buff[i-1])*pow(PRIME, WIN_SIZE+1)+int(buff[i-1+WIN_SIZE])*PRIME;
           if((a%MODULUS)==TARGET || i-last_boundary>=8191) 
	 last_boundary=i;
	   printf("%d\n",i);
   }
}


void test_cdc( const char* file )
{
	FILE* fp = fopen(file,"r" );
	if(fp == NULL ){
		perror("fopen error");
		return;
	}

	fseek(fp, 0, SEEK_END); // seek to end of file
	int file_size = ftell(fp); // get current file pointer
	fseek(fp, 0, SEEK_SET); // seek back to beginning of file

	unsigned char* buff = (unsigned char *)malloc((sizeof(unsigned char) * file_size ));	
	if(buff == NULL)
	{
		perror("not enough space");
		fclose(fp);
		return;
	}

	int bytes_read = fread(&buff[0],sizeof(unsigned char),file_size,fp);

	// parallelize cdc over 4 threads here
	pin_main_thread_to_cpu0();
	std::vector<std::thread> thc;
          time_cdc_4core.start();
          int start=0;
	thc.push_back(std::thread(&cdc_4core, std::ref(buff), std::ref(start) , std::ref(file_size) / 2 ));
          thc.push_back(std::thread(&cdc_4core, std::ref(buff),  file_size / 2, file_size));
	//thc.push_back(std::thread(&cdc_4core, buff,  file_size-2*WIN_SIZE / 2, 3*(file_size-2*WIN_SIZE)/4));
          //thc.push_back(std::thread(&cdc_4core, buff,  3*(file_size-2*WIN_SIZE)/4, file_size-2*WIN_SIZE));
          pin_thread_to_cpu(thc[0], 0);
          pin_thread_to_cpu(thc[1], 2);
	//pin_thread_to_cpu(thc[2], 2);
          //pin_thread_to_cpu(thc[3], 3);
         for (auto &th : thc)
        {
          th.join();
        }
        time_cdc_4core.stop();
        time_cdc.start();
        cdc(buff, file_size);
        time_cdc.stop();
    free(buff);
    return;
}

int main()
{
	test_cdc("../data/prince.txt");
	std::cout << "Total time taken by the cdc is: " << time_cdc.latency() << " ns." << std::endl;
	std::cout << "Total time taken by the 4core_cdc is: " << time_cdc_4core.latency() << " ns." << std::endl;
	return 0;

}