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
int SHA1( unsigned char *message, char **chunk_hash,int index);
int sha(unsigned char *buff, uint32_t length /*char **chunk_hash,unordered_map<string,int> table*/);
//int match( char ** hash,  char *sha,int index);
void encoding_new(unsigned char buff[8192],int input_length[2],uint16_t lzw_out[8192],int output_length[2]);
//void encoding_sw(string s1,vector<unsigned char> &output);
void encoding_sw(unsigned char *input,int len,vector<unsigned char> &output);
void cdc_new1(const unsigned char *buff,int start,int end,int *chunk_bound/*, uint8_t *chunk*/);
void cdc_new2(const unsigned char *buff,int start,int end,int *chunk_bound/*, uint8_t *chunk*/);
void cdc_new3(const unsigned char *buff,int buff_size,int *chunk_bound);
void cdc_vector(const unsigned char *buff,int buff_size,vector<int>&chunk_bound);
void sizing(uint16_t *lzw_out,unsigned char *output,int out_length);
void decoding(vector<int> op);
#endif
