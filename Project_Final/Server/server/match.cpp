#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <stdint.h>
#include <math.h>
#include <string.h>
//#include <unordered_map>
#include <bits/stdc++.h>
#include "stopwatch.h"
//#include "encoder.h"
#include <wolfssl/options.h>
#include <wolfssl/wolfcrypt/sha3.h>
#include <wolfssl/wolfcrypt/sha.h>
#define SHA_SIZE 8
using namespace std;
int match( char ** hash,char *sha,int index)
{
     static int count=0;
     if(index==0){
         memcpy(hash[count],sha,SHA_SIZE);
         count++;
         return -1;
     }
     for (int i = 0; i < count; i++) {
         
        if (strcmp((const char*)sha,(const char*)hash[i] ) == 0) {
		  for(int x = 0; x < SHA_DIGEST_SIZE; x++)
    {
        printf("%x",sha[x]);
    }	
    //printf("\n");
    for(int x = 0; x < SHA_SIZE; x++)
    {
        printf("%x",hash[i][x]);
    }	
            return i;
        }
    }
    //hash[count]=(char *)malloc(SHA_DIGEST_SIZE*sizeof(char));
    memcpy(hash[count],sha,SHA_DIGEST_SIZE);
    count++;

    return -1;
}
int match_map(/*unordered_map<string,int> table,*/char *sha)
{
    unsigned int index=0;
     string str=sha;
     static unordered_map<string,int> table;
     //unordered_map<string,int> table;
     static int count=0;
     if(index==0){
        table[str]=count++;
        return -1;
     }
     index++;
     //for (int i = 0; i < count; i++) {
        if( table.find(str) != table.end() )
            return table[str];
        else{
            table[str]=count++;
            return -1;
        }
     //}
    
}