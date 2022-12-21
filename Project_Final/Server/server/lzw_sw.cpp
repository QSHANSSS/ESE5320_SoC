
#include <vector>
#include <math.h>
#include <iostream>
#include <bits/stdc++.h>
#include "stopwatch.h"
//#include "encoder.h"
//#define PLATFORM_BIG_ENDIAN
#define TABLE_SIZE 9500
#define NULLKEY -1
#define MAX_COLLISION_SIZE 13
#define NO_FIND 16384
//#define hls
int coeff[]={1,2,4,8,16,32,64,128,256,512};
using namespace std;

typedef struct
{
	int16_t location[MAX_COLLISION_SIZE];
    //int16_t start[MAX_COLLISION_SIZE];
    unsigned long long murmur[MAX_COLLISION_SIZE];
	bool empty_flag[MAX_COLLISION_SIZE];
}hash_table;
unsigned int murmur_hash_2(const void * key, int len, unsigned int seed) {

   
	const unsigned int m = 0x5bd1e995;

	// Initialize the hash to a 'random' value

	unsigned int h = seed ^ len;

	// Mix 4 bytes at a time into the hash

	const unsigned char * data = (const unsigned char *) key;

	switch (len) {
	case 4:
		h^=data[3] << 24;
	case 3:
		h ^= data[2] << 16;
	case 2:
		h ^= data[1] << 8;
	case 1:
		h ^= data[0];
		h *= m;
	};

	// Do a few final mixes of the hash to ensure the last few
	// bytes are well-incorporated.

	h ^= h >> 13;
	h *= m;
	h ^= h >> 15;

	return h;
}
int hash_func(unsigned char key[20],int len){
	int16_t hash=0;
	unsigned char temp_key[20]={0};
LOOP_HASH_FUNC1:
 for(int8_t i=0;i<len;i=i+1){
 		temp_key[i]=key[i];
 	}
	for(int8_t i=0;i<len;i=i+2){
	    	    hash+=(int)temp_key[i]*coeff[i%6];
	    	    hash+=(int)temp_key[i+1]*coeff[(i+1)%6];
	        }
	return hash;
}
void init(hash_table hashTable[TABLE_SIZE])
{
	int i;
	for (i = 0; i < TABLE_SIZE; i++)
        for( int j=0; j<MAX_COLLISION_SIZE;j++)
	{
		hashTable[i].location[j]=0;
		hashTable[i].empty_flag[j]=0;
	}
}

unsigned long long murmur_hash_64(const void * key, int len, unsigned long long seed)
{
     if(len<=4){
    	unsigned int hash=murmur_hash_2(key,len,3);
    	return hash;
    }
    const unsigned long long m = 0xc6a4a7935bd1e995;
    const int r = 47;

    unsigned long long h = seed ^ (len * m);

    const unsigned long long * data = (const unsigned long long *)key;
    const unsigned long long * end = data + (len / 8);

    while (data != end)
    {
#ifdef PLATFORM_BIG_ENDIAN
        unsigned long long k = *data++;
        char *p = (char *)&k;
        char c;
        c = p[0]; p[0] = p[7]; p[7] = c;
        c = p[1]; p[1] = p[6]; p[6] = c;
        c = p[2]; p[2] = p[5]; p[5] = c;
        c = p[3]; p[3] = p[4]; p[4] = c;
#else
        unsigned long long k = *data++;
#endif

        k *= m;
        k ^= k >> r;
        k *= m;

        h ^= k;
        h *= m;
    }

    const unsigned char * data2 = (const unsigned char*)data;
    switch (len & 7)
    {
    case 7: h ^= (unsigned long long)(data2[6]) << 48;
    case 6: h ^= (unsigned long long)(data2[5]) << 40;
    case 5: h ^= (unsigned long long)(data2[4]) << 32;
    case 4: h ^= (unsigned long long)(data2[3]) << 24;
    case 3: h ^= (unsigned long long)(data2[2]) << 16;
    case 2: h ^= (unsigned long long)(data2[1]) << 8;
    case 1: h ^= (unsigned long long)(data2[0]);
        h *= m;
    };

    h ^= h >> r;
    h *= m;
    h ^= h >> r;
    //printf("murhash:%ld\n",h);
    return h;
}

void createHash( hash_table hashArr[TABLE_SIZE],uint16_t start,int16_t hash,unsigned long long murmur,int code) {
    uint16_t index=0;
     LOOP_CREATE_HASH:
	 while( hashArr[hash].empty_flag[index] != 	0)
            index++;
        hashArr[hash].location[index]= code;
        //cout<<"murmur:"<<hashArr[hash].murmur[index]<<"\n"<<endl;
        //cout<<"index:"<<index<<"\t"<<"create_location:"<<hashArr[hash].location[index]<<"\n"<<endl;
        hashArr[hash].murmur[index]=murmur;
        hashArr[hash].empty_flag[index]=1;

}
int hash_search(hash_table hashArr[TABLE_SIZE] ,unsigned char key[20], int16_t hash,int len) {
	//int temp[MAX_COLLISION_SIZE];
	//int flag[MAX_COLLISION_SIZE];
	if(len==1){
        //cout<<"location1:"<<hashArr[hash].location[0]<<"\n"<<endl;
        return  hashArr[hash].location[0];
    }
    unsigned long long murmur=murmur_hash_64(key,len,3);
    //cout<<"search hash:"<<hash<<"\t"<<hashArr[hash].location[0]<<"\n"<<endl;
	LOOP_HASH_SEARCH1:
	for(int8_t j=0; j<MAX_COLLISION_SIZE; j++){
        if(hashArr[hash].murmur[j]==murmur && hashArr[hash].empty_flag[j]){
        	//cout<<"location2:"<<hashArr[hash].location[j]<<"\t"<<"murmur"<<hashArr[hash].murmur[j]<<endl;
        	 return  hashArr[hash].location[j];
        }
         if(hashArr[hash].location[j]==NO_FIND)
            return NO_FIND;
    }

        //cout<<"location3:"<<-1<<"\n"<<endl;
        return NO_FIND;

}

void encoding_new(unsigned char buff[8192],int input_length[2],uint16_t lzw_out[8192],int output_length[2])
{
    int16_t c_flag=0;
    int16_t p_low=0;
    int16_t p_high=0;//string p = "", c = "";p += s1[0];;
    //int16_t lzw_out[TABLE_SIZE]; //(int16_t*)malloc(sizeof(unsigned int)*8192);
    hash_table  table[TABLE_SIZE];
    init(table);
    int16_t out_length=0;
    for (int16_t i = 0; i <= 255; i=i+1) {
        table[i].location[0]=i;   
        //table[i].murmur[0]=i;
    	table[i].empty_flag[0]=1; 
    }
    int16_t code = 256;
    int16_t pc_hash=0;
    int16_t p_hash=0;
        for ( int16_t i = 0; i <input_length[0]; i++) {
            int16_t location=0;
            unsigned long long murmur=0;
            if (i != (input_length[0] - 1) ) {
                c_flag++; //c += s1[i + 1];
            }
            pc_hash=hash_func(buff+p_low,c_flag-p_low+1);
            location=hash_search(table,buff+p_low,pc_hash,c_flag-p_low+1);
                if(location!=NO_FIND){
                 if(i != (input_length[0] - 1))
                   p_high=c_flag;
                }
                else if(location==NO_FIND)
                {
                    p_hash=hash_func(buff+p_low,p_high-p_low+1);
                    location=hash_search(table,buff+p_low,p_hash,p_high-p_low+1);
                    lzw_out[out_length]=location;
                    murmur=murmur_hash_64(buff+p_low,c_flag-p_low+1,3);
                    createHash(table,p_low,pc_hash,murmur,code);//table[code]=pc_hash;  //table[p + c] = code;
                   //cout <<  "lzw_code:\t" << lzw_out[out_length] << "\t"<<"p_hash:"<<p_hash<<"\t"
                   //<<"code:"<<code<<"\tpc_hash:"<<"\t"<<pc_hash<<"\n\n"<<endl;
                    code++;//code++;
                    p_high=c_flag;//p = c;
                    p_low=c_flag;
                    out_length++;
                }

        }
        uint16_t last_hash=hash_func(buff+p_low,p_high-p_low+1);;
       int16_t location_last=hash_search(table,buff+p_low,last_hash,p_high-p_low+1);
        lzw_out[out_length]=location_last;  //lzw_out[count]=table[p];
       //cout <<  "lzw_code:\t" << lzw_out[out_length] <<endl;

       output_length[0]=out_length+1;

}