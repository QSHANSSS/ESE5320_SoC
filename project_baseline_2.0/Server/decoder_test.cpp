#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <math.h>
#include <iostream>
using namespace std;
#define Datalength (1)

int main()
{
    std::vector<unsigned char> compressed_r; 
    u_int16_t output_code[1]={98};
    int count = 0;
    int count_1 = 1;
    int count_2 = 1;
    u_int16_t temp = output_code[0];
    u_int8_t compressed_code = 0;
    while( true)
    {
        int i=0;
        if (count_1==14)
        {
            count ++;
            if (count==Datalength)
            {
                if (compressed_code != 0)
                {
                    compressed_code = compressed_code << (8-count_2+1);
                    compressed_r.push_back(char(compressed_code));
                
                }break;
            }
            count_1=1;
            temp=output_code[count];
        }

        if (count_2==9)
        {
            count_2=1;
            compressed_r.push_back(char(compressed_code));
            compressed_code=0;
        }

        if (temp%2 == 1)
        {
         // cout<<"temp:"<<temp<<"\n";
          //if(compressed_code==0)
          //  compressed_code=1;
          printf("%u ",compressed_code);
           compressed_code = compressed_code + pow(2, (count_2-1)); 
        }
        printf("count1:%u ",count_1);
        printf("count2:%u ",count_2);
        printf("%u ",compressed_code);
        printf("%u\n",temp);
        temp = temp >> 1;
        

        count_1++;
        count_2++;
    }
    for (int i = 0; i < compressed_r.size(); i++) {
		printf("%u\n",compressed_r[i]);
	}
}