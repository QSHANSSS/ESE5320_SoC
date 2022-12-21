#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <iostream>
#include <string.h>
#include "stopwatch.h"
#include "encoder.h"
#define WIN_SIZE 16  //window length
#define PRIME 3   //
#define MODULUS 4096
#define WIN_SIZE 16  //window length
#define TARGET 0
#define FAILED_MATCH 0
stopwatch time_cdc;
stopwatch time_newcdc;
using namespace std;


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

void cdc(unsigned char *buff,int buff_size)
{
	int total_size;
	int last_boundary=0;
  static int i;
   for( i=0;i<buff_size-WIN_SIZE;i++)
   {
	   //printf("%c",buff[i]);
     if((hash_func(buff,i)%MODULUS)==TARGET || i-last_boundary>=8092) {  //choose MODULUS and TARGET
	        total_size+=i-last_boundary;
          memcpy(chunk_buff[chunk++],buff+last_boundary,i-last_boundary);
	//printf("\n************chunk%d: size=%d,average size=%d, hash_value=%lu***********\n",chunk++,i-last_boundary,total_size/chunk,hash_func(buff,i)-hash_func(buff,last_boundary+16));
          //chunk_bound[chunk]=i;
	        last_boundary=i;
     }   
   }
  // printf("\n************chunk%d: size=%d,final average size=%d hash_value=%lu***********\n",chunk,buff_size+WIN_SIZE-last_boundary,total_size/chunk,hash_func(buff,buff_size-WIN_SIZE)-hash_func(buff,last_boundary));
   //compare(buff,chunk_hash,chunk_bound,chunk);

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
