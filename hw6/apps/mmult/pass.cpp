#include <ap_int.h>
#include <hls_stream.h>
//#include <assert.h>
#include "pass.h"
#include "MMult.h"
void read( float         *input1,
		   float        *input2,
	  hls::stream<float > &inStream1,
	  hls::stream<float > &inStream2,
	  unsigned int         numInputs,int c) {
	for (int i = 0; i < N; i++) {
	      for (int j = 0; j < N; j++) {
               #pragma HLS PIPELINE
               inStream1.write(input1[c * N * N + i * N + j]);
               inStream2.write(input2[c * N * N + i * N + j]);
              }
	}
}
void write(hls::stream<float > &outStream,
	   float              *output,
	   unsigned int              numInputs,int c) {
  for (int i = 0; i < N; i++) {
  	      for (int j = 0; j < N; j++) {
                 #pragma HLS PIPELINE
                 output[c * N * N + i * N + j]=outStream.read();

                }
  	}
}


void pass_dataflow(float *input1,
		   float *input2,
		   float      *output,int c) {
  #pragma HLS DATAFLOW

  assert(numInputs >= 1);
  assert(processDelay >=1);

  hls::stream<float > inStream1;
  hls::stream<float > inStream2;
  hls::stream<float > outStream;

  read(input1, input2, inStream1, inStream2, numInputs);
  exec(inStream1,inStream2, outStream, numInputs);
  write(outStream, output,    numInputs);

}
void exec(hls::stream<float > &inStream1,
	  hls::stream<float > &inStream2,
	  hls::stream<float > &outStream,
	  unsigned int        numInputs,int c) {
    		#pragma HLS array_partition variable=A_tmp block factor=16 dim=2
    		#pragma HLS array_partition variable=B_tmp block factor=16 dim=1
	       for(int num = 0; num < numInputs; num++) {
    	    	    for (int i = 0; i < N; i++)
    	    	    {
    	    	      for (int j = 0; j < N; j++)
    	    	      {
    	    	        #pragma HLS PIPELINE
    	    	    	float *in1 = inStream1.read();
    	    	    	float *in2 = inStream2.read();
    	    	      }
    	    	    }

    	    	    for (int i = 0; i < N; i++)
    	    	    {
    	    	      for (int j = 0; j < N; j++)
    	    	      {
    	    	        #pragma HLS PIPELINE
    	    	        float result = 0;
    	    	        for (int k = 0; k < N; k++)
    	    	        {
    	    	          float term = in1[N*i+k] * in2[N*k+j];
    	    	          result += term;
    	    	        }
    	    	        //C[c * N * N + i * N + j] = result;
    	    	      }
    	    	    }
    	    outStream.write(result);
	     }
}

extern "C" {
void pass(const ap_int<512> *input1,
		const ap_int<512> *input2,
	  ap_int<512>       *output,
	  unsigned int      numInputs,
	  int c) {
  #pragma HLS INTERFACE m_axi     port=input     offset=slave bundle=p0
  #pragma HLS INTERFACE m_axi     port=output    offset=slave bundle=p1

  pass_dataflow(input, output, numInputs, c);
}
}
