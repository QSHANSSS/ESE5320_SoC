
#ifndef MMULT_ACC_H_
#define MMULT_ACC_H_
//#include <ap_int.h>
#include <hls_stream.h>
#define N 32
#define CHUNKS 130

#define NUM_MAT 4
#define NUM_TESTS 256

#define PIPELINE_DEPTH_MIN 1
#define PIPELINE_DEPTH_MAX 4
#define PIPELINE_DEPTH_DEFAULT	4

/**
 * Design principles to achieve best performance
 *
 * 1. Declare secquential access to stream data into accelerator via a hardware
 * FIFO interface.  Otherwise, the default RAM interface requires all data to
 * arrive before starting HLS accelerator
 */
extern "C" {
void mmult_fpga(float A[CHUNKS * N * N], float B[CHUNKS * N * N],
                float C[CHUNKS * N * N]);
}
void mmult_fpga_optimize(float A[CHUNKS * N * N], float B[CHUNKS * N * N],
      float C[CHUNKS * N * N]);
void read(float        *input,
	  hls::stream<float > &inStream1,
	  hls::stream<float > &inStream2,
	  int intnumInputs,  int c);
void exec(hls::stream<float > &inStream1,
		hls::stream<float > &inStream2,
	  hls::stream<float > &outStream,
	  int intnumInputs,   int c);
void write(hls::stream<float > &outStream,
	   float              *output,
	   int intnumInputs,  int c);
void pass_dataflow(float *input1,
		   float *input2,
		   float       *output,
		   int intnumInputs);

#endif /* MMULT_ACC_H_ */
