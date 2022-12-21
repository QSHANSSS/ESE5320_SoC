#ifndef _ENCODER_H_
#define _ENCODER_H_
#include<vector>
#include <stdint.h>
#include <stdlib.h>
using namespace std;
// max number of elements we can get from ethernet
#define NUM_ELEMENTS 16384
#define HEADER 2
//uint64_t *chunk_hash=(uint64_t *)malloc(sizeof(uint64_t)*100);
//int *chunk_bound=(int *)malloc(sizeof(int)*256);
//int *chunk_match=(int *)malloc(sizeof(int)*chunk);
//extern unsigned char *chunk_buff[];
//vector<int> output_code;
uint8_t cdc(const unsigned char *buff, int buff_size,int *chunk_bound);
uint8_t cdc_new(const unsigned char *buff,int buff_size,int *chunk_bound);
void SHA( unsigned char *message,unsigned char *shaSUm);
void match(unsigned char ** chunk_hash,int chunk,int *chunk_match,int i);
void encoding(string s1,vector<unsigned char>&lzw_code);
int decoder(int Parameter_count, char * Parameters[]);
void decoding(vector<int> op);
#endif
