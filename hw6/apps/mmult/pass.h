void read(float        *input,
	  hls::stream<float > &inStream1,
	  hls::stream<float > &inStream2,
	  unsigned int              numInputs);
void exec(hls::stream<float > &inStream1,
		hls::stream<float > &inStream2,
	  hls::stream<float > &outStream,
	  unsigned int              numInputs,
             int c);
void write(hls::stream<float > &outStream,
	   float              *output,
	   unsigned int              numInputs);
void pass_dataflow(float *input1,
		   float *input2,
		   float       *output,
		   unsigned int      numInputs,
		   int c);

