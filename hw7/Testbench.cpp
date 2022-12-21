#include "Pipeline.h"
#include <cstdint>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <unistd.h>
#include <stdlib.h>
#include <vector>
#define NUM_TESTS 5
static void init_arrays(unsigned char *Input)
{
      for (int Y = 0; Y < SCALED_FRAME_HEIGHT; Y++) {
        for (int X = 0; X < SCALED_FRAME_WIDTH; X++) {
          Input[Y * SCALED_FRAME_WIDTH + X] = rand();
        }
      }
}
 bool result_check(unsigned char *output1, unsigned char *output2)
{
	 bool result=0;
		for(int i=0;i<OUTPUT_FRAME_SIZE;i++){
			if (*(output1+i)!=*(output2+i))
				{
				result =1;
			    break;
				}
			else
				result=0;

		}
   return result;
}
int main(int argc, char *argv[])
{
	unsigned char *Input = (unsigned char *)malloc(SCALED_FRAME_SIZE);
		 unsigned char *Output_SW = (unsigned char *)malloc(OUTPUT_FRAME_SIZE);
		 unsigned char *Output_HW = (unsigned char *)malloc(OUTPUT_FRAME_SIZE);

      init_arrays(Input);
      Filter_SW(Input, Output_SW);
      Filter_HW(Input, Output_HW);
      bool failed=result_check(Output_SW,Output_HW);
    std::cout << "TEST " << ((!failed) ? "PASSED" : "FAILED") << std::endl;
  //  for(int i=0;i<SCALED_FRAME_SIZE;i++){
    //std::cout << "input " << *(Input++)-'0' << std::endl;
    //}
   // for(int i=0;i<OUTPUT_FRAME_SIZE;i++){
      // std::cout << "OUT_HW " << *(Output_HW++)-'0' << std::endl;
      // std::cout << "OUT_SW " << *(Output_SW++)-'0' << std::endl;
    //}
    free(Input);
    free(Output_SW);
    free(Output_HW);
}
