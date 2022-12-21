#ifndef _ENCODER_H_
#define _ENCODER_H_
//#include<vector>
using namespace std;
// max number of elements we can get from ethernet
#define NUM_ELEMENTS 16384
#define HEADER 2
uint64_t *chunk_hash=(uint64_t *)malloc(sizeof(uint64_t)*100);
//int *chunk_bound=(int *)malloc(sizeof(int)*256);
int chunk;
unsigned char *chunk_buff[];
int *chunk_match=(int *)malloc(sizeof(int)*chunk);
vector<int> output_code;
void cdc(unsigned char *buff, int buff_size);
void SHA(unsigned char *message,unsigned char *shaSum);
void match(unsigned char *chunk_hash);
vector<int> encoding(unsigned char * buff,int *chunk_match,vector<int> output_code);

#endif
