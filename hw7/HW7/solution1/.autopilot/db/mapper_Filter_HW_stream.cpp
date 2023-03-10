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
struct __cosim_s40__ { char data[64]; };
struct __cosim_s10__ { char data[16]; };
extern "C" void Filter_HW_stream(__cosim_s40__*, __cosim_s10__*, int, int);
extern "C" void apatb_Filter_HW_stream_hw(volatile void * __xlx_apatb_param_Input, volatile void * __xlx_apatb_param_Output) {
  // Collect __xlx_Input__tmp_vec
  vector<sc_bv<512> >__xlx_Input__tmp_vec;
  for (int j = 0, e = 2025; j != e; ++j) {
    sc_bv<512> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_Input)[j*8+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_Input)[j*8+1];
    _xlx_tmp_sc.range(191, 128) = ((long long*)__xlx_apatb_param_Input)[j*8+2];
    _xlx_tmp_sc.range(255, 192) = ((long long*)__xlx_apatb_param_Input)[j*8+3];
    _xlx_tmp_sc.range(319, 256) = ((long long*)__xlx_apatb_param_Input)[j*8+4];
    _xlx_tmp_sc.range(383, 320) = ((long long*)__xlx_apatb_param_Input)[j*8+5];
    _xlx_tmp_sc.range(447, 384) = ((long long*)__xlx_apatb_param_Input)[j*8+6];
    _xlx_tmp_sc.range(511, 448) = ((long long*)__xlx_apatb_param_Input)[j*8+7];
    __xlx_Input__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_Input = 2025;
  int __xlx_offset_param_Input = 0;
  int __xlx_offset_byte_param_Input = 0*64;
  __cosim_s40__* __xlx_Input__input_buffer= new __cosim_s40__[__xlx_Input__tmp_vec.size()];
  for (int i = 0; i < __xlx_Input__tmp_vec.size(); ++i) {
    ((long long*)__xlx_Input__input_buffer)[i*8+0] = __xlx_Input__tmp_vec[i].range(63, 0).to_uint64();
    ((long long*)__xlx_Input__input_buffer)[i*8+1] = __xlx_Input__tmp_vec[i].range(127, 64).to_uint64();
    ((long long*)__xlx_Input__input_buffer)[i*8+2] = __xlx_Input__tmp_vec[i].range(191, 128).to_uint64();
    ((long long*)__xlx_Input__input_buffer)[i*8+3] = __xlx_Input__tmp_vec[i].range(255, 192).to_uint64();
    ((long long*)__xlx_Input__input_buffer)[i*8+4] = __xlx_Input__tmp_vec[i].range(319, 256).to_uint64();
    ((long long*)__xlx_Input__input_buffer)[i*8+5] = __xlx_Input__tmp_vec[i].range(383, 320).to_uint64();
    ((long long*)__xlx_Input__input_buffer)[i*8+6] = __xlx_Input__tmp_vec[i].range(447, 384).to_uint64();
    ((long long*)__xlx_Input__input_buffer)[i*8+7] = __xlx_Input__tmp_vec[i].range(511, 448).to_uint64();
  }
  // Collect __xlx_Output__tmp_vec
  vector<sc_bv<128> >__xlx_Output__tmp_vec;
  for (int j = 0, e = 8100; j != e; ++j) {
    sc_bv<128> _xlx_tmp_sc;
    _xlx_tmp_sc.range(63, 0) = ((long long*)__xlx_apatb_param_Output)[j*2+0];
    _xlx_tmp_sc.range(127, 64) = ((long long*)__xlx_apatb_param_Output)[j*2+1];
    __xlx_Output__tmp_vec.push_back(_xlx_tmp_sc);
  }
  int __xlx_size_param_Output = 8100;
  int __xlx_offset_param_Output = 0;
  int __xlx_offset_byte_param_Output = 0*16;
  __cosim_s10__* __xlx_Output__input_buffer= new __cosim_s10__[__xlx_Output__tmp_vec.size()];
  for (int i = 0; i < __xlx_Output__tmp_vec.size(); ++i) {
    ((long long*)__xlx_Output__input_buffer)[i*2+0] = __xlx_Output__tmp_vec[i].range(63, 0).to_uint64();
    ((long long*)__xlx_Output__input_buffer)[i*2+1] = __xlx_Output__tmp_vec[i].range(127, 64).to_uint64();
  }
  // DUT call
  Filter_HW_stream(__xlx_Input__input_buffer, __xlx_Output__input_buffer, __xlx_offset_byte_param_Input, __xlx_offset_byte_param_Output);
// print __xlx_apatb_param_Input
  sc_bv<512>*__xlx_Input_output_buffer = new sc_bv<512>[__xlx_size_param_Input];
  for (int i = 0; i < __xlx_size_param_Input; ++i) {
    char* start = (char*)(&(__xlx_Input__input_buffer[__xlx_offset_param_Input]));
    __xlx_Input_output_buffer[i].range(63, 0) = ((long long*)start)[i*8+0];
    __xlx_Input_output_buffer[i].range(127, 64) = ((long long*)start)[i*8+1];
    __xlx_Input_output_buffer[i].range(191, 128) = ((long long*)start)[i*8+2];
    __xlx_Input_output_buffer[i].range(255, 192) = ((long long*)start)[i*8+3];
    __xlx_Input_output_buffer[i].range(319, 256) = ((long long*)start)[i*8+4];
    __xlx_Input_output_buffer[i].range(383, 320) = ((long long*)start)[i*8+5];
    __xlx_Input_output_buffer[i].range(447, 384) = ((long long*)start)[i*8+6];
    __xlx_Input_output_buffer[i].range(511, 448) = ((long long*)start)[i*8+7];
  }
  for (int i = 0; i < __xlx_size_param_Input; ++i) {
    ((long long*)__xlx_apatb_param_Input)[i*8+0] = __xlx_Input_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_Input)[i*8+1] = __xlx_Input_output_buffer[i].range(127, 64).to_uint64();
    ((long long*)__xlx_apatb_param_Input)[i*8+2] = __xlx_Input_output_buffer[i].range(191, 128).to_uint64();
    ((long long*)__xlx_apatb_param_Input)[i*8+3] = __xlx_Input_output_buffer[i].range(255, 192).to_uint64();
    ((long long*)__xlx_apatb_param_Input)[i*8+4] = __xlx_Input_output_buffer[i].range(319, 256).to_uint64();
    ((long long*)__xlx_apatb_param_Input)[i*8+5] = __xlx_Input_output_buffer[i].range(383, 320).to_uint64();
    ((long long*)__xlx_apatb_param_Input)[i*8+6] = __xlx_Input_output_buffer[i].range(447, 384).to_uint64();
    ((long long*)__xlx_apatb_param_Input)[i*8+7] = __xlx_Input_output_buffer[i].range(511, 448).to_uint64();
  }
// print __xlx_apatb_param_Output
  sc_bv<128>*__xlx_Output_output_buffer = new sc_bv<128>[__xlx_size_param_Output];
  for (int i = 0; i < __xlx_size_param_Output; ++i) {
    char* start = (char*)(&(__xlx_Output__input_buffer[__xlx_offset_param_Output]));
    __xlx_Output_output_buffer[i].range(63, 0) = ((long long*)start)[i*2+0];
    __xlx_Output_output_buffer[i].range(127, 64) = ((long long*)start)[i*2+1];
  }
  for (int i = 0; i < __xlx_size_param_Output; ++i) {
    ((long long*)__xlx_apatb_param_Output)[i*2+0] = __xlx_Output_output_buffer[i].range(63, 0).to_uint64();
    ((long long*)__xlx_apatb_param_Output)[i*2+1] = __xlx_Output_output_buffer[i].range(127, 64).to_uint64();
  }
}
