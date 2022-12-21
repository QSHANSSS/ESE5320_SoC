#include "MMult.h"
#include <ap_int.h>
#include <hls_stream.h>
void read( float        input1[CHUNKS * N * N],
		   float        input2[CHUNKS * N * N],
	  hls::stream<float> &inStream1,
	  hls::stream<float> &inStream2) {
	for(int c=0;c<CHUNKS*N*N;c++){
               #pragma HLS PIPELINE
               inStream1.write(input1[c]);
               inStream2.write(input2[c]);
              }
}
void write(hls::stream<float> &outStream,
	   float   output[CHUNKS * N * N])
{
	for(int c=0;c<CHUNKS*N*N;c++){
                 #pragma HLS PIPELINE
                 output[c]=outStream.read();

                }
}


void exec(hls::stream<float > &inStream1,
	  hls::stream<float > &inStream2,
	  hls::stream<float > &outStream) {
	        float in1[N][N];
	    	float in2[N][N];
    		#pragma HLS array_partition variable=in1 block factor=16 dim=2
    		#pragma HLS array_partition variable=in2 block factor=16 dim=1
	    	for(int c=0;c<CHUNKS;c++){
    	    	    for (int i = 0; i < N; i++)
    	    	    {
    	    	      for (int j = 0; j < N; j++)
    	    	      {
    	    	        #pragma HLS PIPELINE
    	    	    	in1[i][j] = inStream1.read();
    	    	    	in2[i][j] = inStream2.read();
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
    	    	          float term = in1[i][k] * in2[k][j];
    	    	          result += term;
    	    	        }
                         outStream.write(result);
    	    	      }
    	    	    }
	    	}

}
void pass_dataflow(float input1[CHUNKS * N * N],
		   float input2[CHUNKS * N * N],
		   float      output[CHUNKS * N * N]) {
  #pragma HLS DATAFLOW
	  hls::stream<float > inStream1;
	  hls::stream<float > inStream2;
	  hls::stream<float > outStream;
  read(input1, input2, inStream1, inStream2);
  exec(inStream1,inStream2, outStream);
  write(outStream, output);
}

/*void mmult(float A[CHUNKS * N * N], float B[CHUNKS * N * N],
      float C[CHUNKS * N * N])
{
    #pragma HLS DATAFLOW
	unsigned intnumInputs=N*N;
   pass_dataflow(A,B,C,intnumInputs);
}*/
extern "C" {
void mmult_fpga(float A[CHUNKS*N*N],
		 float B[CHUNKS * N * N],
	float      C[CHUNKS * N * N]) {
  #pragma HLS INTERFACE m_axi     port=A    offset=slave bundle=p0
#pragma HLS INTERFACE m_axi     port=B    offset=slave bundle=p1
  #pragma HLS INTERFACE m_axi     port=C   offset=slave bundle=p2

	pass_dataflow(A, B, C);
}
}
