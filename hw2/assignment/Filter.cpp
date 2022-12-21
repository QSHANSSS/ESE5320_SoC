#include <stdlib.h>
#include <stdio.h>
#include "App.h"
#include "stopwatch.h"
#include <iostream>
#define INPUT_HEIGHT (4000)
#define INPUT_WIDTH (6000)

#define FILTER_LENGTH (7)

#define OUTPUT_HEIGHT (INPUT_HEIGHT - (FILTER_LENGTH - 1))
#define OUTPUT_WIDTH (INPUT_WIDTH - (FILTER_LENGTH - 1))
unsigned Coefficients[] = {2, 15, 62, 98, 62, 15, 2};
stopwatch time_l30;
stopwatch time_l32;
stopwatch time_l38;
void Filter_horizontal(const unsigned char * Input, unsigned char * Output)
{
  time_l30.stop();
  time_l32.start();
  LOOP1: for (int Y = 0; Y < INPUT_HEIGHT; Y++){
    time_l32.stop();
    LOOP2: for (int X = 0; X < OUTPUT_WIDTH; X++)
    {
      unsigned int Sum = 0;
      LOOP3: for (int i = 0; i < FILTER_LENGTH; i++){
        Sum += Coefficients[i] * Input[Y * INPUT_WIDTH + X + i];

      }
      Output[Y * OUTPUT_WIDTH + X] = Sum >> 8;
    }
  }
}

void Filter_vertical(const unsigned char * Input, unsigned char * Output)
{
  LOOP1: for (int Y = 0; Y < OUTPUT_HEIGHT; Y++)
    LOOP2: for (int X = 0; X < OUTPUT_WIDTH; X++)
    {
      unsigned int Sum = 0;
      LOOP3: for (int i = 0; i < FILTER_LENGTH; i++)
        Sum += Coefficients[i] * Input[(Y + i) * OUTPUT_WIDTH + X];
      Output[Y * OUTPUT_WIDTH + X] = Sum >> 8;
      
    }
}

void Filter(const unsigned char * Input, unsigned char * Output)
{
  stopwatch time_horizontal;
  stopwatch time_vertical;
  unsigned char * Temp = (unsigned char*)malloc(INPUT_HEIGHT * OUTPUT_WIDTH);
  time_horizontal.start();
  time_l30.start();
  Filter_horizontal(Input, Temp);
  time_horizontal.stop();
  time_vertical.start();
  Filter_vertical(Temp, Output);
  time_vertical.stop();
  free(Temp);
  std::cout << "Total latency of line30/31 is: " << time_l30.latency() << " ns." << std::endl;
      std::cout << "Total latency of line32/33 is: " << time_l32.latency() << " ns." << std::endl;
     std::cout << "Average latency of horizontal per loop iteration is: " << time_horizontal.avg_latency() << " ns." << std::endl;
     std::cout << "Average latency of vertical per loop iteration is: " << time_vertical.avg_latency() << " ns." << std::endl;
}

