#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <iostream>
#include "stopwatch.h"
#include "LZW.h"
#define WIN_SIZE 16  //wondow length
#define PRIME 3   //
#define MODULUS 256
#define TARGET 0
#define FAILED_MATCH 0
stopwatch time_cdc;
stopwatch time_newcdc;
using namespace std;
uint64_t *chunk_hash=(uint64_t *)malloc(sizeof(uint64_t)*100);
int *chunk_bound=(int *)malloc(sizeof(int)*MODULUS);
int chunk=1;

bool compare(unsigned char *buff,uint64_t *chunk_hash,int *chunk_bound,int chunk)
{
  bool match=1;
  for(int i=1;i<=chunk;i++)
  {
    printf("for chunk%d,matched chunks are\n",i);
    for(int j=i+1;j<=chunk;j++)
    {
      int length=chunk_bound[i]-chunk_bound[i-1];
      if((chunk_hash[i]==chunk_hash[j])&&(length==chunk_bound[j]-chunk_bound[j-1])){//unroll		
	for(int k=0;k<length;k++ ){
	  if(buff[chunk_bound[i]-k]!=buff[chunk_bound[j]-k])
	  {
	     printf("chunk[%d] and chunk[%d] have different length,but they are not same chunk\n\n",i,j);
	     match=0;	  
	     break;	 
	  }    
	}
	if(match)
	  printf("chunk%d\n",j);
	else printf("no match for this chunk\n");
    }	
   // printf("\n");
  }
 }
}

uint64_t hash_func(unsigned char *input, unsigned int pos)
{
	// put your hash function implementation here
	uint64_t hash=0;
	for(int i=0;i<WIN_SIZE;i++)//reuse window
	{
		unsigned char temp=input[pos+WIN_SIZE-1-i];
		hash+=int(temp)*(pow(PRIME, i+1));//hash+=input[pos+15-i]*3^(i+1)
	}
	return hash;
}
uint64_t hash_chunk(unsigned char*input,int start,int end)
{
  uint64_t hash=0;
  for(int i=0;i<end-start;i++)
  {
      unsigned char temp=input[end-i];
      hash+=int(temp);//hash+=input[pos+15-i]*3^(i+1)
  }
  return hash;
}

int cdc(unsigned char *buff, unsigned int buff_size)
{
	// put your cdc implementation here
	static int total_size;
	static int last_boundary;
   for(int i=WIN_SIZE;i<buff_size-WIN_SIZE;i++)
   {
	printf("%c",buff[i]);
     if((hash_func(buff,i)%MODULUS)==TARGET) {  //choose MODULUS and TARGET
	total_size+=i-last_boundary;
	printf("\n************chunk%d: size=%d,average size=%d, hash_value=%lu***********\n",chunk++,i-last_boundary,total_size/chunk,hash_func(buff,i)-hash_func(buff,last_boundary+16));
	chunk_hash[chunk]=hash_chunk(buff,last_boundary+1,i);//hash_func(buff,i)-hash_func(buff,last_boundary);
	//chunk_hash[chunk]=hash_func(buff,i)-hash_func(buff,last_boundary+16);
	chunk_bound[chunk]=i;
	last_boundary=i;
     }   
   }
   printf("\n************chunk%d: size=%d,final average size=%d hash_value=%lu***********\n",chunk,buff_size+WIN_SIZE-last_boundary,total_size/chunk,hash_func(buff,buff_size-WIN_SIZE)-hash_func(buff,last_boundary));
   compare(buff,chunk_hash,chunk_bound,chunk);

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
void compress( const char* file )
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
    time_newcdc.start();
	cdc_new(buff, file_size);
    time_newcdc.stop();
	time_cdc.start();
	cdc(buff, file_size);
    time_cdc.stop();
    encoding(buff,chunk_bound,chunk);
    //free(buff);
    return;
}

int main()
{
   compress("prince.txt");
   //std::cout << "Total latency of cdc is: " << time_cdc.latency() << " ns." << std::endl;
   //std::cout << "Total latency of cdc_new is: " << time_newcdc.latency() << " ns." << std::endl;
   //printf("cdc latency: %d ns\n new lcdc latency: %d ns\n",time_cdc.latency(),time_newcdc.latency());
   free(chunk_hash);
   return 0;
}