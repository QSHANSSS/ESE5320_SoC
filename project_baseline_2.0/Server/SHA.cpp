#include <stdio.h>
#include <string.h>
#include <iostream>
#include <wolfssl/options.h>
#include <wolfssl/wolfcrypt/sha3.h>
#include "encoder.h"

void SHA( unsigned char *message,unsigned char *shaSum/*,int index*/)
{
    
    //for(int i=0;i<sizeof(message);i++)
      //  printf("%c",message[i]);
   
    wc_Sha3 sha3_384;
    wc_InitSha3_384(&sha3_384, NULL, INVALID_DEVID);
    //cout<<"...........debug_sha1..............\n"<<endl;
    wc_Sha3_384_Update(&sha3_384, (const unsigned char*)message, sizeof(message));
    wc_Sha3_384_Final(&sha3_384, (unsigned char*)shaSum);
    //printf("sizeof:%d",sizeof(message));
    //printf("...........debug_sha2...........\n");
    for(int x = 0; x < SHA3_384_DIGEST_SIZE; x++)
    {
        printf("%x",shaSum[x]);
    }
    printf("\n");
}
/*int main()
{
    unsigned char message[] = "I am sooo glad this works...";
    unsigned char *shaSum=(unsigned char*)malloc(sizeof(unsigned char)*SHA3_384_DIGEST_SIZE);
    SHA(message,shaSum);
    for(int x = 0; x < SHA3_384_DIGEST_SIZE; x++)
    {
        printf("%x",shaSum[x]);
    }
    printf("\n");
    return 0;
}*/

