#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <iostream>
//#include "stopwatch.h"
#define WIN_SIZE 16
#define PRIME 3
#define MODULUS 256
#define TARGET 0
//stopwatch time_cdc;
//stopwatch time_newcdc;
using namespace std;
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
     if((hash_func(buff,i)%MODULUS)==TARGET) {  //choose MODULUS and TARGET
	
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
     if((a%MODULUS)==TARGET) 
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
    //time_newcdc.start();
	cdc_new(buff, file_size);
    //time_newcdc.stop();
	//time_cdc.start();
	cdc(buff, file_size);
    //time_cdc.stop();
    free(buff);
    return;
}

int main()
{
	test_cdc("prince.txt");
	//std::cout << "Total latency of cdc is: " << time_cdc.latency() << " ns." << std::endl;
   // std::cout << "Total latency of cdc_new is: " << time_newcdc.latency() << " ns." << std::endl;
   //printf("cdc latency: %f ns\n new lcdc latency: %f ns",time_cdc.latency(),time_newcdc.latency());
	return 0;
}