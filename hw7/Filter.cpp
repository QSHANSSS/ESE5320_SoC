#include "Pipeline.h"
#include <stdlib.h>
#include <iostream>
#include "hls_stream.h"

static unsigned Coefficients[] = {2, 15, 62, 98, 62, 15, 2};

void Filter_horizontal_SW(const unsigned char * Input,
		                      unsigned char * Output)
{
  int X, Y, i;
  for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    {
      unsigned int Sum = 0;
      for (i = 0; i < FILTER_LENGTH; i++)
        Sum += Coefficients[i] * Input[Y * SCALED_FRAME_WIDTH + X + i];
      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
    }
}

void Filter_vertical_SW(const unsigned char * Input,
		                    unsigned char * Output)
{
  int X, Y, i;
  for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++)
    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    {
      unsigned int Sum = 0;
      for (i = 0; i < FILTER_LENGTH; i++)
        Sum += Coefficients[i] * Input[(Y + i) * OUTPUT_FRAME_WIDTH + X];
      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
    }
}

void Filter_SW(const unsigned char * Input,
	           unsigned char * Output)
{
  unsigned char * Temp = (unsigned char *) malloc(SCALED_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH);
  Filter_horizontal_SW(Input, Temp);
  Filter_vertical_SW(Temp, Output);
  free(Temp);
}

/*
static void Filter_vertical_HW(const unsigned char * Input,
                            unsigned char * Output)
{
    unsigned char temp[7];
    unsigned int Sum = 0;
  int X, Y, i;
  for (X = 0; X < OUTPUT_FRAME_WIDTH; X++){
      for (int j=0; j<(FILTER_LENGTH-1);j++){
          temp[j+1] = Input[X+j*OUTPUT_FRAME_WIDTH];
      }
      for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++){
          for (int j=0; j<(FILTER_LENGTH-1);j++){
              temp[j] = temp[j+1];
          }
          temp[FILTER_LENGTH-1] = Input[Y*SCALED_FRAME_WIDTH + X + OUTPUT_FRAME_WIDTH *(FILTER_LENGTH-1)];
          for (i = 0; i < FILTER_LENGTH; i++)
                  Sum += Coefficients[i] * temp[i];
      }
      Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
    }
}*/

/*
void Filter_HW(const unsigned char * Input,
	           unsigned char * Output)
{
  unsigned char * Temp = (unsigned char *) malloc(SCALED_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH);
  Filter_horizontal_SW(Input, Temp);
  Filter_vertical_HW(Temp, Output);
  free(Temp);
}
*/

void Filter_horizontal_HW(const unsigned char * Input,unsigned char * Output)
{
    unsigned char temp[7];
    int X, Y, i;
    for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
    {
    	for (int j = 0; j<(FILTER_LENGTH-1); j++)
    	{
			#pragma HLS Unroll
    		temp[j] = Input[Y*SCALED_FRAME_WIDTH + j];
    	}
    	for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    	{
			#pragma HLS PIPELINE II=1
    		temp[FILTER_LENGTH-1] = Input[Y*SCALED_FRAME_WIDTH + X + (FILTER_LENGTH-1)];
    		unsigned int Sum = 0;
    		for (i = 0; i < FILTER_LENGTH; i++)
    		{
				#pragma HLS PIPELINE II=1
    			Sum += Coefficients[i] * temp[i];
    		}
    		Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
    		for (int j =0; j<(FILTER_LENGTH-1); j++)
    		{
  	  	  		#pragma HLS Unroll
    			temp[j] = temp[j+1];
    		}
    	}
    }
}

void Filter_vertical_HW(const unsigned char * Input,unsigned char * Output)
{
    unsigned char temp[7];
    int X, Y, i;
    for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    {
    	for (int j = 0; j<(FILTER_LENGTH-1); j++)
    	{
			#pragma HLS Unroll
    		temp[j] = Input[X + j*OUTPUT_FRAME_WIDTH];
    	}
    	for (Y = 0; Y < OUTPUT_FRAME_HEIGHT; Y++)
    	{
			#pragma HLS PIPELINE II=1
            temp[FILTER_LENGTH-1] = Input[X + OUTPUT_FRAME_WIDTH *(FILTER_LENGTH-1+Y)];
    		unsigned int Sum = 0;
    		for (i = 0; i < FILTER_LENGTH; i++)
    		{
				#pragma HLS PIPELINE II=1
    			Sum += Coefficients[i] * temp[i];
    		}
    		Output[Y * OUTPUT_FRAME_WIDTH + X] = Sum >> 8;
    		for (int j =0; j<(FILTER_LENGTH-1); j++)
    		{
  	  	  		#pragma HLS Unroll
    			temp[j] = temp[j+1];
    		}
    	}
    }
}

void Filter_HW(const unsigned char * Input,
	           unsigned char * Output)
{
  unsigned char Temp [SCALED_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH];
  Filter_horizontal_HW(Input, Temp);
  Filter_vertical_HW(Temp, Output);
}

void Filter_horizontal_HW_stream(hls::stream <unsigned char> &input_stream,hls::stream <unsigned char> &temp_stream)
{
//#pragma HLS DATAFLOW
    unsigned char temp[7];
    int X, Y, i;

    for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
    {
    	for (int j = 0; j<(FILTER_LENGTH-1); j++)
    	{
#pragma HLS Unroll
    		temp[j] = input_stream.read();
    	}
    	for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    	{
#pragma HLS PIPELINE II=1
    		temp[FILTER_LENGTH-1] = input_stream.read();
    		unsigned int Sum = 0;
    		for (i = 0; i < FILTER_LENGTH; i++)
    		{
#pragma HLS Unroll
    			Sum += Coefficients[i] * temp[i];
    		}
    		temp_stream.write(Sum >> 8);
    		for (int j =0; j<(FILTER_LENGTH-1); j++)
    		{
#pragma HLS Unroll
    			temp[j] = temp[j+1];
    		}
    	}
    }
}

void Filter_horizontal_HW_Q3(const unsigned char * Input, hls::stream <unsigned char> &temp_stream)
{
#pragma HLS DATAFLOW
    unsigned char temp[7];
    int X, Y, i;

    for (Y = 0; Y < SCALED_FRAME_HEIGHT; Y++)
    {
    	for (int j = 0; j<(FILTER_LENGTH-1); j++)
    	{
#pragma HLS Unroll
    		temp[j] = Input[j + Y * SCALED_FRAME_WIDTH];
    	}

    	for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    	{
#pragma HLS PIPELINE II=1
    		temp[FILTER_LENGTH-1] = Input[Y * SCALED_FRAME_WIDTH + X + (FILTER_LENGTH-1)];
    		unsigned int Sum = 0;
    		for (i = 0; i < FILTER_LENGTH; i++)
    		{
#pragma HLS Unroll
    			Sum += Coefficients[i] * temp[i];
    		}
    		temp_stream.write(Sum >> 8);
    		for (int j =0; j<(FILTER_LENGTH-1); j++)
    		{
#pragma HLS Unroll
    			temp[j] = temp[j+1];
    		}
    	}
    }
}

void Filter_vertical_HW_stream(hls::stream <unsigned char> &temp_stream, hls::stream <unsigned char> &output_stream)
{
//#pragma HLS DATAFLOW
	int X, Y, i, j;
	unsigned char temp[7][OUTPUT_FRAME_WIDTH];
#pragma HLS array_partition variable=temp complete dim=1

//	for (j = 0; j < (FILTER_LENGTH-1);j++)
//	{
//#pragma HLS Unroll
//		for (X = 0; X<OUTPUT_FRAME_WIDTH; X++)
//		{
//			temp[j][X] = temp_stream.read();
//		}
//	}

    for (Y = 0; Y < OUTPUT_FRAME_HEIGHT + 6; Y++)
    {
    	for (X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    	{
    		if (Y < 6) {
				temp[Y][X] = temp_stream.read();
			}
			else {
				unsigned int Sum = 0;
				temp[FILTER_LENGTH-1][X] = temp_stream.read();

				for (i = 0; i < FILTER_LENGTH; i++)
				{
#pragma HLS Unroll
					Sum += Coefficients[i] * temp[i][X];
				}
				output_stream.write(Sum >> 8);
				for (int j =0; j<(FILTER_LENGTH-1); j++)
				{
#pragma HLS Unroll
					temp[j][X] = temp[j+1][X];
				}
			}
    	}
    }
}

void Filter_vertical_HW_Q3(hls::stream <unsigned char> &temp_stream, unsigned char * Output)
{
	int X, Y, i, j;
	unsigned char temp[7][OUTPUT_FRAME_WIDTH];
#pragma HLS array_partition variable=temp complete dim=1

//	for (j = 0;j<(FILTER_LENGTH-1);j++)
//	{
//#pragma HLS Unroll
//		for (X = 0; X<OUTPUT_FRAME_WIDTH; X++)
//		{
//			temp[j][X] = temp_stream.read();
//		}
//	}

    for (Y = 0; Y < OUTPUT_FRAME_HEIGHT + 6; Y++)
    {
    	for ( X = 0; X < OUTPUT_FRAME_WIDTH; X++)
    	{
    		if (Y < 6) {
    			temp[Y][X] = temp_stream.read();
    		}
    		else {
        		unsigned int Sum = 0;
        		temp[FILTER_LENGTH-1][X] = temp_stream.read();
        		for (i = 0; i < FILTER_LENGTH; i++)
        		{
#pragma HLS Unroll
        			Sum += Coefficients[i] * temp[i][X];
        		}
        		Output[(Y-6) * OUTPUT_FRAME_WIDTH + X]=Sum >> 8;

        		for (int j =0; j<(FILTER_LENGTH-1); j++)
        		{
#pragma HLS Unroll
        			temp[j][X] = temp[j+1][X];
        		}
    		}
    	}
    }
}

void load(unsigned char * Input, hls::stream <unsigned char> &input_stream) {
  for (int Y=0; Y<SCALED_FRAME_HEIGHT * SCALED_FRAME_WIDTH; Y++)
	  input_stream.write(Input[Y]);
}

void compute(hls::stream <unsigned char> &input_stream, hls::stream <unsigned char> &output_stream) {
#pragma HLS DATAFLOW
  static hls::stream <unsigned char> temp_stream;
  Filter_horizontal_HW_stream(input_stream, temp_stream);
  Filter_vertical_HW_stream(temp_stream, output_stream);
}

void store(hls::stream <unsigned char> &output_stream, unsigned char * Output) {
  for (int Y=0; Y<OUTPUT_FRAME_HEIGHT * OUTPUT_FRAME_WIDTH; Y++)
	  Output[Y]=output_stream.read();
}

void Filter_HW_stream(unsigned char * Input, unsigned char * Output)
{
//#pragma HLS DATAFLOW
#pragma HLS INTERFACE m_axi port=Input offset=slave bundle=p0
#pragma HLS INTERFACE m_axi port=Output offset=slave bundle=p1 depth=129600

  static hls::stream <unsigned char> input_stream;
  static hls::stream <unsigned char> temp_stream;
  static hls::stream <unsigned char> output_stream;
  load(Input, input_stream);
  compute(input_stream, output_stream);
  store(output_stream, Output);
}

void Filter_HW_Q3(const unsigned char * Input, unsigned char * Output)
{
#pragma HLS DATAFLOW

  static hls::stream <unsigned char> temp_stream;
	  Filter_horizontal_HW_Q3(Input, temp_stream);
	  Filter_vertical_HW_Q3(temp_stream, Output);
}

