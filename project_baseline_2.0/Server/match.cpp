#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include "stopwatch.h"
//#include "encoder.h"
#include <wolfssl/options.h>
#include <wolfssl/wolfcrypt/sha3.h>
using namespace std;
void match(unsigned char ** hash, int chunk, int *match, int i)
{
     static int index=0;
     int lzw_index[SHA3_384_DIGEST_SIZE];
     match[i]=0;
    // cout <<"..........debug_match..........\n"<<endl;
     
     for (int j=0;j<i;j++)
     {    uint8_t judge = 0;
          for (int k=0; k< SHA3_384_DIGEST_SIZE;k++)
          {
               //printf("chunk_hash[j][k]:%x\n",hash[j][k]);
               //printf("chunk_hash[i][k]:%x\n",hash[i][k]);

               if (hash[j][k]==hash[i][k])
               {
                    judge ++;
                    //match[i]=0;
               }
          }
          if(judge == SHA3_384_DIGEST_SIZE && i!=0) 
          {
               //printf("..............debug6........\n");
               match[i]=lzw_index[j];//chunk index of previously encoded block
               judge=0;
               break;
          }
          else
          {   // printf("..............debug7........\n");
               lzw_index[i]=index++; //only lzw chunks are indexed
               match[i]=0;
          }
     }
}
