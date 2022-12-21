#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <iostream>
#include <string.h>
#include "stopwatch.h"
//#include "encoder.h"
#define WIN_SIZE 16  //window length
#define PRIME 3   //
#define MODULUS 4096
#define TARGET 0
using namespace std;


void compare(unsigned char *buff,uint64_t *chunk_hash,int *chunk_bound,int chunk)
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
	     printf("chunk[%d] and chunk[%d] have same length,but they are not same chunk\n\n",i,j);
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

uint64_t hash_func(const unsigned char *input, unsigned int pos)
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

uint8_t cdc(const unsigned char *buff,int buff_size,int *chunk_bound)
{
	uint8_t chunk=0;
	int total_size;
	int last_boundary=0;
          static int i;
	//int *chunk_bound=(int *)malloc(sizeof(int));
	chunk_bound[0]=0;
   for( i=0;i<buff_size-WIN_SIZE;i++)
   {
	   //printf("%c",buff[i]);
     if((hash_func(buff,i)%MODULUS)==TARGET || i-last_boundary>=8191) {  //choose MODULUS and TARGET
		total_size+=i-last_boundary;
          //memcpy(chunk_buff[chunk++],buff+last_boundary,i-last_boundary);
	printf("\n************chunk%d: size=%d***********\n",chunk,i-last_boundary);
          	chunk++;
		chunk_bound[chunk]=i;
	        	last_boundary=i;
		
     }   
   }
   printf("\n************chunk%d: size=%d***********\n",chunk,buff_size+WIN_SIZE-last_boundary);
   chunk_bound[++chunk]=buff_size;
   //compare(buff,chunk_hash,chunk_bound,chunk);
   return chunk;

}
uint8_t cdc_new(const unsigned char *buff,int buff_size,int *chunk_bound)
{  
   uint8_t chunk=0;
   int total_size;
   int last_boundary=0;
   static int i;	
   chunk_bound[0]=0;
   uint64_t a=hash_func(buff,WIN_SIZE);
   for(i=0;i<buff_size-WIN_SIZE;i++)
   {
	 if(i>WIN_SIZE){
	   	a=a*PRIME-int(buff[i-1])*pow(PRIME, WIN_SIZE+1)+int(buff[i-1+WIN_SIZE])*PRIME;
	 }
           if(((a%MODULUS)==TARGET && (i-last_boundary>=1) )|| i-last_boundary>=8191 ) {
		total_size+=i-last_boundary;
	          printf("\n************chunk%d: size=%d***********\n",chunk,i-last_boundary);
          	chunk++;
		chunk_bound[chunk]=i;
	        	last_boundary=i;
	 }
	   
   }
   printf("\n************chunk%d: size=%d***********\n",chunk,buff_size+WIN_SIZE-last_boundary);
   chunk_bound[++chunk]=buff_size;
   //compare(buff,chunk_hash,chunk_bound,chunk);
   return chunk;
}
