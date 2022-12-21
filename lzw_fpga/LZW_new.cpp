#include "hls_stream.h"
#include <stdlib.h>
#include <stdio.h>
//#include <math.h>
//#include "encoder.h"
//#include <stdint.h>
#include <iostream>
#define TABLE_SIZE 9500
#define OUTPUT_SIZE 3500
#define NULLKEY 16384
#define MAX_COLLISION_SIZE 14
#define TEMP_CHUNK_SIZE 25
#define NO_FIND 16384
//#define PLATFORM_BIG_ENDIAN

unsigned long long coeff[16]={3,9,27,81,243,729,2187,6561,19683,59049,177147,531441,1594323,4782969,14348907,43046721};
//typedef unsigned short unsigned short;
//using namespace std;
typedef struct
{
	unsigned short location[MAX_COLLISION_SIZE];
	//int16_t start[MAX_COLLISION_SIZE];
    unsigned short murmur[MAX_COLLISION_SIZE];
	bool empty_flag[MAX_COLLISION_SIZE];
}hash_table;

unsigned int murmur_hash_2(unsigned char key[20], int len, unsigned int seed) {

	const unsigned int m = 0x5bd1e995;

	// Initialize the hash to a 'random' value

	unsigned int h = seed ^ len;

	// Mix 4 bytes at a time into the hash

	//const unsigned char * data = (const unsigned char *) key;

	switch (len) {
	case 4:
		h^=key[3] << 24;
	case 3:
		h ^= key[2] << 16;
	case 2:
		h ^= key[1] << 8;
	case 1:
		h ^= key[0];
		h *= m;
	};

	// Do a few final mixes of the hash to ensure the last few
	// bytes are well-incorporated.

	h ^= h >> 13;
	h *= m;
	h ^= h >> 15;

	return h;
}

unsigned long long murmur_hash_64(unsigned char key[16], int len, unsigned long long seed)
{
	if(len<=4){
	    	unsigned int hash=murmur_hash_2(key,len,3);
	    	return hash;
	    }
    const unsigned long long m = 0xc6a4a7935bd1e995;
    const int r = 47;

    unsigned long long h;
	h= seed ^ (len * m);

    //const unsigned long long * data = (const unsigned long long *)key;
//	unsigned long long data[16];
//#pragma HLS array_partition variable=data complete dim=1
//	LOOP_MURMUR64_1:
//	for(int i=0;i<16;i++){
//	#pragma HLS unroll
//		data[i]=key[i];
//	}

    //const unsigned long long * end = data + (len / 8);

   // while (data != end)
	LOOP_MURMUR64:
	for(int j=0;j<len/8;j++)
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
        //unsigned long long k = *data++;
        //unsigned long long k = (unsigned long long)data[j];
        unsigned long long k = (unsigned long long)key[j];
#endif

        //k *= m;
        //k= (k*m) ^ (k*m) >>r;

        k =((k*m) ^ ((k*m) >>r)) *m;

       // h ^= k;
       // h *= m;
        h = (h^k) *m;
    }

    //const unsigned char * data2 = (const unsigned char*)data;
//#pragma HLS array_partition variable=data2 complete dim=1
    switch (len & 7)
    {
    case 7: h ^= (unsigned long long)(key[6]) << 48;
    case 6: h ^= (unsigned long long)(key[5]) << 40;
    case 5: h ^= (unsigned long long)(key[4]) << 32;
    case 4: h ^= (unsigned long long)(key[3]) << 24;
    case 3: h ^= (unsigned long long)(key[2]) << 16;
    case 2: h ^= (unsigned long long)(key[1]) << 8;
    case 1: h ^= (unsigned long long)(key[0]);
        h *= m;
    };

    h ^= h >> r;
    h *= m;
    h ^= h >> r;

    return h;
}
/*unsigned short new_hash(unsigned char key[20],int len){
	short k=0;
	short j=0;
	for(int i=0; i<13; i++){
		k^=key[i];
	}
	for(int i=0; i<13; i++){
			j^=key[i];
		}
	unsigned short output=rol(k,(k&j)%16)<<8;
}*/

unsigned short hash_func(unsigned char key[16],int len){
	unsigned short hash=0;
//	unsigned char temp_key[15];
//	int prime[ ]={1,2,4,8,16,32};
//#pragma HLS array_partition variable=temp_key complete dim=1
//#pragma HLS array_partition variable=prime complete dim=1
//LOOP_HASH_FUNC1:
//for(int i=0;i<15;i=i+1){
//#pragma HLS unroll
//		temp_key[i]=key[i];
//	}
	LOOP_HASH_FUNC2:
	for(int i=0;i<len;i=i+1){
	//
	    	    hash+=(int)key[i]<<(i%6);//*prime[i%6];
	    	   // hash+=(int)key[i+1]*prime[(i+1)%6];
	        }
	return hash;
}

void createHash( hash_table hashArr[TABLE_SIZE],unsigned short hash,unsigned short murmur,int code) {
    unsigned short index=0;
    bool flag[MAX_COLLISION_SIZE];
	#pragma HLS array_partition variable=flag complete dim=1
    for(int j=0; j<MAX_COLLISION_SIZE; j++){
    #pragma HLS unroll
   		flag[j]=hashArr[hash].empty_flag[j];
    	}
     LOOP_CREATE_HASH:
	 while( /*hashArr[hash].empty_*/flag[index]!= 	0)
		 index++;
        hashArr[hash].location[index]= code;
        //cout<<"murmur:"<<hashArr[hash].murmur[index]<<"\n"<<endl;
       // cout<<"index:"<<index<<"\t"<<"create_location:"<<hashArr[hash].location[index]<<"\n"<<endl;
        hashArr[hash].murmur[index]=murmur;
        hashArr[hash].empty_flag[index]=1;

}
unsigned short hash_search(hash_table hashArr[TABLE_SIZE] ,unsigned char key[20], int16_t hash,int len) {
	unsigned short location[MAX_COLLISION_SIZE];
	unsigned short murmur[MAX_COLLISION_SIZE];
	bool flag[MAX_COLLISION_SIZE];
	#pragma HLS array_partition variable=location complete dim=1
	#pragma HLS array_partition variable=murmur complete dim=1
	#pragma HLS array_partition variable=flag complete dim=1
	unsigned short murmur64=murmur_hash_64(key,len,2);
	if(len==1){
        //cout<<"location1:"<<hashArr[hash].location[0]<<"\n"<<endl;
        return  hashArr[hash].location[0];
    }
	LOOP_SEARCH_LOAD:
	for(int j=0; j<MAX_COLLISION_SIZE; j++){
#pragma HLS unroll factor=14
		location[j]=hashArr[hash].location[j];
		flag[j]=hashArr[hash].empty_flag[j];
		murmur[j]=hashArr[hash].murmur[j];
	}
	LOOP_HASH_SEARCH1:
	for(int j=0; j<MAX_COLLISION_SIZE; j++){
#pragma HLS unroll factor=14
        //match=0;
        //if(hashArr[hash].murmur[j]==murmur && hashArr[hash].empty_flag[j]){
		if(murmur[j]==murmur64 && flag[j]){
        	//cout<<"location2:"<<hashArr[hash].location[j]<<"\t"<<"murmur"<<hashArr[hash].murmur[j]<<endl;
        	 return  location[j];
        }
	}
        return NO_FIND;
	}

void init(hash_table hashTable[TABLE_SIZE])
{
	int i;
	for (i = 0; i < TABLE_SIZE; i++) {

        for( int j=0; j<MAX_COLLISION_SIZE;j++)
	{
        	#pragma HLS unroll factor=60
		hashTable[i].location[j]=NULLKEY;
		hashTable[i].murmur[j]=NULLKEY;
		hashTable[i].empty_flag[j]=0;
	}
	}
}
int lzw_compute(hls::stream<unsigned char>&instream,int length,hls::stream<unsigned short>&outstream)
//void lzw_compute(hls::stream<unsigned char>&instream,hls::stream<int>&inlen_stream,unsigned short output_compress[8192],int output_length[2])
{
    unsigned short c_flag=0;
    unsigned short p_low=0;
    unsigned short p_high=0;//string p = "", c = "";p += s1[0];;
    hash_table  table[TABLE_SIZE];
    init(table);
    unsigned char chunk[8192];
    //unsigned char chunk_temp[TEMP_CHUNK_SIZE]={0};
    //int length=0;
    //length=inlen_stream.read();

    int out_length=0;
   LOOP_INIT:
   for (unsigned short i = 0; i <= 255; i++) {
	#pragma HLS unroll
    	table[i].location[0]= i;
    	table[i].murmur[0]=i;
    	table[i].empty_flag[0]=1;
    }
    unsigned short index=0;
    int code=256;
    unsigned short pc_hash=0;
    unsigned short p_hash=0;
    unsigned short pc_len=0;
    chunk[index++]=instream.read();
    //chunk_temp[index-1]=chunk[index-1];
 LOOP_MAIN:
 for ( unsigned short i = 0; i <length; i++) {
		//#pragma HLS pipeline II=1
        unsigned short location=0;
        unsigned short murmur=0;
        //unsigned char temp[20]={0};
        if (i != (length - 1) ) {
                c_flag++; //c += s1[i + 1];
                chunk[index]=instream.read();
                //chunk_temp[index%TEMP_CHUNK_SIZE]=chunk[index];
                index++;
        }
        pc_len=c_flag-p_low+1;
        pc_hash=hash_func(chunk+p_low,pc_len);
        location=hash_search(table,chunk+p_low,pc_hash,pc_len);

       if(location!=NO_FIND){
            if(i != (length - 1))
            		p_high=c_flag;
        }
        else if(location==NO_FIND)
        {
             p_hash=hash_func(chunk+p_low,p_high-p_low+1);//need optimize
        	 location=hash_search(table,chunk+p_low,p_hash,p_high-p_low+1);
        	 outstream.write(location);
             murmur=murmur_hash_64(chunk+p_low,c_flag-p_low+1,2);
             createHash(table,pc_hash,murmur,code);//table[code]=pc_hash;  //table[p + c] = code;
              //cout << "i"<<i<< "lzw_code:\t" << location << "\t"<<"p_hash:"<<p_hash<<"\t"<<endl;
                   // <<"code:"<<code<<"\tpc_hash:"<<"\t"<<pc_hash<<"\n\n"<<endl;
             p_high=c_flag;//p = c;
             p_low=c_flag;
             out_length++;
             code++;
        }

   }
       unsigned short last_hash=hash_func(chunk+p_low,p_high-p_low+1);;
       unsigned short location_last=hash_search(table,chunk+p_low,last_hash,p_high-p_low+1);
       //output_compress[out_length]=location_last;
       outstream.write(location_last);
       //output_length[0]=out_length+1;
       return out_length+1;

}

void store(hls::stream<unsigned short> &outstream, unsigned short outArr[8192],int len)
{
	 outArr[0]=len;
	for (int Y = 1; Y <=len; Y++){
		outArr[Y]=outstream.read();
			//cout<<"outArr"<<outArr[Y]<<endl;
	    }


}
void load(unsigned char input[8192],hls::stream<unsigned char> &instream,int len)
{

    	  for (int X = 0; X < len; X++)
    	    {
    	      instream.write(input[X]);
    	    }
    	   //inlen_stream.write(len[0]);

}

void encoding(unsigned char buff[8192],int input_length,unsigned short output_compress[8192])
{
	int output_length=0;
#pragma HLS DATAFLOW
#pragma HLS INTERFACE m_axi     port=buff    offset=slave bundle=p0 depth=8192
//#pragma HLS INTERFACE m_axi     port=input_length    offset=slave bundle=p1 depth=8192
#pragma HLS INTERFACE m_axi    port=output_compress  offset=slave  bundle=p2 depth=8192
//#pragma HLS INTERFACE m_axi     port=output_length    offset=slave bundle=p3 depth=8192
	    hls::stream<unsigned char> instream("chunk");
	    //hls::stream<int> inlen_stream("input_length");
	    hls::stream<unsigned short> outstream("output_compress");
	    //hls::stream<int> outlen_stream;
#pragma HLS stream depth=8192 variable=instream // Modified by Vitis HLS
//#pragma HLS stream depth=8192 variable=inlen_stream // Modified by Vitis HLS
#pragma HLS stream depth=8192 variable=outstream // Modified by Vitis HLS
//#pragma HLS stream depth=8192 variable=outlen_stream // Modified by Vitis HLS
	    load(buff,instream,input_length);
	    //lzw_compute(instream,inlen_stream,output_compress,output_length);
	    output_length=lzw_compute(instream,input_length,outstream);
	    store(outstream,output_compress,output_length);


}



 


