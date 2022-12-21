#include <stdio.h>
#include <string.h>
#include "encoder.h"
#include <wolfssl/wolfcrypt/sha.h>

void SHA(unsigned char *message,unsigned char *shaSum)
{
    //char message[] = "I am sooo glad this works...";
    //char shaSum[SHA_DIGEST_SIZE];
    
    Sha sha;
    wc_InitSha(&sha);
    wc_ShaUpdate(&sha, (const unsigned char*)message, strlen(message));
    wc_ShaFinal(&sha, (unsigned char*)shaSum);

    /*for(int x = 0; x < SHA_DIGEST_SIZE; x++)
    {
        printf("%x",shaSum[x]);
    }
    printf("\n");*/

}

