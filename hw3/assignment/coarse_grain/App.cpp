#include "App.h"
#include <thread>
#define STAGES (4)
using namespace std;
int main()
{
  stopwatch time_scale;
  stopwatch time_filter;
  stopwatch time_differentiate;
  stopwatch time_compress;
  stopwatch total_time;
  unsigned char *Input_data = (unsigned char *)malloc(FRAMES * FRAME_SIZE);
  unsigned char *Temp_data[STAGES-1];
  unsigned char *Output_data = (unsigned char *)malloc(MAX_OUTPUT_SIZE);

  if (Input_data == NULL)
    Exit_with_error("malloc failed at main for Input_data");

  if (Output_data == NULL)
    Exit_with_error("malloc failed at main for Output_data");

  for (int Stage = 0; Stage < STAGES - 1; Stage++)
  {
    Temp_data[Stage] = (unsigned char *)malloc(FRAME_SIZE);
    if (Temp_data[Stage] == NULL)
      Exit_with_error("malloc failed at main for Temp_data");
  }

  Load_data(Input_data);

  int Size = 0;
  total_time.start();
  for (int Frame = 0; Frame < FRAMES; Frame++)
  { 
    std::vector<std::thread> ths;
    time_scale.start();
    ths.push_back(std::thread(&Scale_coarse, Input_data + Frame * FRAME_SIZE, Temp_data[0], 0, INPUT_HEIGHT_SCALE / 2));
    ths.push_back(std::thread(&Scale_coarse, Input_data + Frame * FRAME_SIZE, Temp_data[0], INPUT_HEIGHT_SCALE / 2, INPUT_HEIGHT_SCALE));
    pin_thread_to_cpu(ths[0], 0);
    pin_thread_to_cpu(ths[1], 1);
    for (auto &th : ths)
    {
      th.join();
    }
    time_scale.stop();
    time_filter.start();
    unsigned char *Temp = (unsigned char *)malloc(INPUT_FILTER_HEIGHT * OUTPUT_FILTER_WIDTH);
    std::vector<std::thread> ths_h;
    ths_h.push_back(std::thread(&Filter_horizontal_coarse, Temp_data[0], Temp, 0, INPUT_FILTER_HEIGHT / 2));
    ths_h.push_back(std::thread(&Filter_horizontal_coarse, Temp_data[0], Temp, INPUT_FILTER_HEIGHT / 2,INPUT_FILTER_HEIGHT));
    pin_thread_to_cpu(ths_h[0], 0);
    pin_thread_to_cpu(ths_h[1], 1);
    for (auto &th : ths_h)
    {
      th.join();
    }
    std::vector<std::thread> ths_v;
    ths_v.push_back(std::thread(&Filter_vertical_coarse, Temp, Temp_data[1], 0, INPUT_DIFF_HEIGHT / 2));
    ths_v.push_back(std::thread(&Filter_vertical_coarse, Temp, Temp_data[1], INPUT_DIFF_HEIGHT / 2, INPUT_DIFF_HEIGHT));
    
    pin_thread_to_cpu(ths_v[0], 0);
    pin_thread_to_cpu(ths_v[1], 1);
    for (auto &th : ths_v)
    {
      th.join();
    }
    time_filter.stop();
    time_differentiate.start();
    std::vector<std::thread> ths_d;
    ths_d.push_back(std::thread(&Differentiate_coarse, Temp_data[1], Temp_data[2], 0, INPUT_DIFF_HEIGHT /2));
    ths_d.push_back(std::thread(&Differentiate_coarse, Temp_data[1], Temp_data[2], INPUT_DIFF_HEIGHT / 2, INPUT_DIFF_HEIGHT));
    
    pin_thread_to_cpu(ths_d[0], 0);
    pin_thread_to_cpu(ths_d[1], 1);
    for (auto &th : ths_d)
    {
      th.join();
    }
    time_differentiate.stop();
    
   /* time_compress.start();
    std::vector<std::thread> ths_c;
    ths_c.push_back(std::thread(&Compress_coarse, Temp_data[2], Output_data, 0, INPUT_COMPRESS_SIZE/2,Size));
    ths_c.push_back(std::thread(&Compress_coarse, Temp_data[2], Output_data, INPUT_COMPRESS_SIZE / 2, INPUT_COMPRESS_SIZE,Size));
   
    pin_thread_to_cpu(ths_c[0], 0);
    pin_thread_to_cpu(ths_c[1], 1);
    for (auto &th : ths_c)
    {
      th.join();
    } 
    time_compress.stop(); */
    time_compress.start();  
    Size = Compress(Temp_data[2], Output_data);
    time_compress.stop();
    
  }
  total_time.stop();

  std::cout << "Total latency of Scale is: " << time_scale.latency() << " ns." << std::endl;
  std::cout << "Total latency of Filter is: " << time_filter.latency() << " ns." << std::endl;
  std::cout << "Total latency of Differentiate is: " << time_differentiate.latency() << " ns." << std::endl;
  std::cout << "Total latency of Compress is: " << time_compress.latency() << " ns." << std::endl;
  std::cout << "Total time taken by the loop is: " << total_time.latency() << " ns." << std::endl;
  std::cout << "---------------------------------------------------------------" << std::endl;
  std::cout << "Average latency of Scale per loop iteration is: " << time_scale.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Filter per loop iteration is: " << time_filter.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Differentiate per loop iteration is: " << time_differentiate.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of Compress per loop iteration is: " << time_compress.avg_latency() << " ns." << std::endl;
  std::cout << "Average latency of each loop iteration is: " << total_time.avg_latency() << " ns." << std::endl;
  
  Store_data("Output.bin", Output_data, Size);
  Check_data(Output_data, Size);
   
  for (int i = 0; i < STAGES - 1; i++)
    free(Temp_data[i]);
  free(Input_data);
  free(Output_data);

  return EXIT_SUCCESS;
}
