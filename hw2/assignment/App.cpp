
#include <stdio.h>
#include <stdlib.h>
#include "stopwatch.h"
#include <iostream>
#include "Filter.h"
extern "C"
{
  #include "App.h"
}
#define DATA_SIZE (12000 * 8000)
#define STAGES (4)
stopwatch time_scale;

stopwatch time_differentiate;
stopwatch time_compress;
stopwatch total_time;

unsigned char * Data[STAGES + 1];

void Exit_with_error(void)
{
  perror(NULL);
  exit(EXIT_FAILURE);
}

void Load_data(void)
{
  FILE * File = fopen("Input.bin", "rb");
  if (File == NULL)
    Exit_with_error();

  if (fread(Data[0], 1, DATA_SIZE, File) != DATA_SIZE)
    Exit_with_error();

  if (fclose(File) != 0)
    Exit_with_error();
}

void Store_data(const char * Filename, int Stage, unsigned int Size)
{
  FILE * File = fopen(Filename, "wb");
  if (File == NULL)
    Exit_with_error();

  if (fwrite(Data[Stage], 1, Size, File) != Size)
    Exit_with_error();

  if (fclose(File) != 0)
    Exit_with_error();
}

int main()
{
  total_time.start();
  for (int i = 0; i <= STAGES; i++)
  {
    // We could strictly allocate less memory for some of these buffers, but
    // that is irrelevant here.
    Data[i] = (unsigned char*)malloc(DATA_SIZE);
    if (Data[i] == NULL)
      Exit_with_error();
  }
  Load_data();
  time_scale.start();
  Scale(Data[0], Data[1]);
  time_scale.stop();
  
  Filter(Data[1], Data[2]);
  
  time_differentiate.start();
  Differentiate(Data[2], Data[3]);
  time_differentiate.stop();
  
  time_compress.start();
  int Size = Compress(Data[3], Data[4]);
  time_compress.stop();
  
  Store_data("Output.bin", 4, Size);

  for (int i = 0; i <= STAGES; i++)
    free(Data[i]);

  total_time.stop();
 
  puts("Application completed successfully.");
  std::cout << "Total latency of Scale is: " << time_scale.latency() << " ns." << std::endl;
std::cout << "Total latency of differentiate is: " << time_differentiate.latency() << " ns." << std::endl;
std::cout << "Total latency of compress is: " << time_compress.latency() << " ns." << std::endl;
std::cout << "Total time taken by the loop is: " << total_time.latency() << " ns." << std::endl;
std::cout << "---------------------------------------------------------------" << std::endl;
std::cout << "Average latency of scale per loop iteration is: " << time_scale.avg_latency() << " ns." << std::endl;
std::cout << "Average latency of differentate per loop iteration is: " << time_differentiate.avg_latency() << " ns." << std::endl;
std::cout << "Average latency of compress per loop iteration is: " << time_compress.avg_latency() << " ns." << std::endl;
std::cout << "Average latency of each loop iteration is: " << total_time.avg_latency() << " ns." << std::endl; 
  return EXIT_SUCCESS;
}


