#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" void encoding(char*, int*, short*, int*, int, int, int, int);
extern "C" void apatb_encoding_hw(volatile void * __xlx_apatb_param_buff, volatile void * __xlx_apatb_param_input_length, volatile void * __xlx_apatb_param_output_compress, volatile void * __xlx_apatb_param_output_length) {
  // Collect __xlx_buff__tmp_vec
  vector<sc_bv<8> >__xlx_buff__tmp_vec;
  for (int j = 0, e = 8192; j != e; ++j) {
    __xlx_buff__tmp_vec.push_back(((char*)__xlx_apatb_param_buff)[j]);
  }
  int __xlx_size_param_buff = 8192;
  int __xlx_offset_param_buff = 0;
  int __xlx_offset_byte_param_buff = 0*1;
  char* __xlx_buff__input_buffer= new char[__xlx_buff__tmp_vec.size()];
  for (int i = 0; i < __xlx_buff__tmp_vec.size(); ++i) {
    __xlx_buff__input_buffer[i] = __xlx_buff__tmp_vec[i].range(7, 0).to_uint64();
  }
  // Collect __xlx_input_length__tmp_vec
  vector<sc_bv<32> >__xlx_input_length__tmp_vec;
  for (int j = 0, e = 2; j != e; ++j) {
    __xlx_input_length__tmp_vec.push_back(((int*)__xlx_apatb_param_input_length)[j]);
  }
  int __xlx_size_param_input_length = 2;
  int __xlx_offset_param_input_length = 0;
  int __xlx_offset_byte_param_input_length = 0*4;
  int* __xlx_input_length__input_buffer= new int[__xlx_input_length__tmp_vec.size()];
  for (int i = 0; i < __xlx_input_length__tmp_vec.size(); ++i) {
    __xlx_input_length__input_buffer[i] = __xlx_input_length__tmp_vec[i].range(31, 0).to_uint64();
  }
  // Collect __xlx_output_compress__tmp_vec
  vector<sc_bv<16> >__xlx_output_compress__tmp_vec;
  for (int j = 0, e = 8192; j != e; ++j) {
    __xlx_output_compress__tmp_vec.push_back(((short*)__xlx_apatb_param_output_compress)[j]);
  }
  int __xlx_size_param_output_compress = 8192;
  int __xlx_offset_param_output_compress = 0;
  int __xlx_offset_byte_param_output_compress = 0*2;
  short* __xlx_output_compress__input_buffer= new short[__xlx_output_compress__tmp_vec.size()];
  for (int i = 0; i < __xlx_output_compress__tmp_vec.size(); ++i) {
    __xlx_output_compress__input_buffer[i] = __xlx_output_compress__tmp_vec[i].range(15, 0).to_uint64();
  }
  // Collect __xlx_output_length__tmp_vec
  vector<sc_bv<32> >__xlx_output_length__tmp_vec;
  for (int j = 0, e = 2; j != e; ++j) {
    __xlx_output_length__tmp_vec.push_back(((int*)__xlx_apatb_param_output_length)[j]);
  }
  int __xlx_size_param_output_length = 2;
  int __xlx_offset_param_output_length = 0;
  int __xlx_offset_byte_param_output_length = 0*4;
  int* __xlx_output_length__input_buffer= new int[__xlx_output_length__tmp_vec.size()];
  for (int i = 0; i < __xlx_output_length__tmp_vec.size(); ++i) {
    __xlx_output_length__input_buffer[i] = __xlx_output_length__tmp_vec[i].range(31, 0).to_uint64();
  }
  // DUT call
  encoding(__xlx_buff__input_buffer, __xlx_input_length__input_buffer, __xlx_output_compress__input_buffer, __xlx_output_length__input_buffer, __xlx_offset_byte_param_buff, __xlx_offset_byte_param_input_length, __xlx_offset_byte_param_output_compress, __xlx_offset_byte_param_output_length);
// print __xlx_apatb_param_buff
  sc_bv<8>*__xlx_buff_output_buffer = new sc_bv<8>[__xlx_size_param_buff];
  for (int i = 0; i < __xlx_size_param_buff; ++i) {
    __xlx_buff_output_buffer[i] = __xlx_buff__input_buffer[i+__xlx_offset_param_buff];
  }
  for (int i = 0; i < __xlx_size_param_buff; ++i) {
    ((char*)__xlx_apatb_param_buff)[i] = __xlx_buff_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_input_length
  sc_bv<32>*__xlx_input_length_output_buffer = new sc_bv<32>[__xlx_size_param_input_length];
  for (int i = 0; i < __xlx_size_param_input_length; ++i) {
    __xlx_input_length_output_buffer[i] = __xlx_input_length__input_buffer[i+__xlx_offset_param_input_length];
  }
  for (int i = 0; i < __xlx_size_param_input_length; ++i) {
    ((int*)__xlx_apatb_param_input_length)[i] = __xlx_input_length_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_output_compress
  sc_bv<16>*__xlx_output_compress_output_buffer = new sc_bv<16>[__xlx_size_param_output_compress];
  for (int i = 0; i < __xlx_size_param_output_compress; ++i) {
    __xlx_output_compress_output_buffer[i] = __xlx_output_compress__input_buffer[i+__xlx_offset_param_output_compress];
  }
  for (int i = 0; i < __xlx_size_param_output_compress; ++i) {
    ((short*)__xlx_apatb_param_output_compress)[i] = __xlx_output_compress_output_buffer[i].to_uint64();
  }
// print __xlx_apatb_param_output_length
  sc_bv<32>*__xlx_output_length_output_buffer = new sc_bv<32>[__xlx_size_param_output_length];
  for (int i = 0; i < __xlx_size_param_output_length; ++i) {
    __xlx_output_length_output_buffer[i] = __xlx_output_length__input_buffer[i+__xlx_offset_param_output_length];
  }
  for (int i = 0; i < __xlx_size_param_output_length; ++i) {
    ((int*)__xlx_apatb_param_output_length)[i] = __xlx_output_length_output_buffer[i].to_uint64();
  }
}
