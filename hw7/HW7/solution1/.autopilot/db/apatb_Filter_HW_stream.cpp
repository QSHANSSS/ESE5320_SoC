#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_p0 "../tv/cdatafile/c.Filter_HW_stream.autotvin_p0.dat"
#define AUTOTB_TVOUT_p0 "../tv/cdatafile/c.Filter_HW_stream.autotvout_p0.dat"
// wrapc file define:
#define AUTOTB_TVIN_p1 "../tv/cdatafile/c.Filter_HW_stream.autotvin_p1.dat"
#define AUTOTB_TVOUT_p1 "../tv/cdatafile/c.Filter_HW_stream.autotvout_p1.dat"
// wrapc file define:
#define AUTOTB_TVIN_Input "../tv/cdatafile/c.Filter_HW_stream.autotvin_Input_r.dat"
#define AUTOTB_TVOUT_Input "../tv/cdatafile/c.Filter_HW_stream.autotvout_Input_r.dat"
// wrapc file define:
#define AUTOTB_TVIN_Output "../tv/cdatafile/c.Filter_HW_stream.autotvin_Output_r.dat"
#define AUTOTB_TVOUT_Output "../tv/cdatafile/c.Filter_HW_stream.autotvout_Output_r.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_p0 "../tv/rtldatafile/rtl.Filter_HW_stream.autotvout_p0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_p1 "../tv/rtldatafile/rtl.Filter_HW_stream.autotvout_p1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_Input "../tv/rtldatafile/rtl.Filter_HW_stream.autotvout_Input_r.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_Output "../tv/rtldatafile/rtl.Filter_HW_stream.autotvout_Output_r.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  p0_depth = 0;
  p1_depth = 0;
  Input_depth = 0;
  Output_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{p0 " << p0_depth << "}\n";
  total_list << "{p1 " << p1_depth << "}\n";
  total_list << "{Input_r " << Input_depth << "}\n";
  total_list << "{Output_r " << Output_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int p0_depth;
    int p1_depth;
    int Input_depth;
    int Output_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
struct __cosim_s40__ { char data[64]; };
struct __cosim_s10__ { char data[16]; };
extern "C" void Filter_HW_stream_hw_stub_wrapper(volatile void *, volatile void *);

extern "C" void apatb_Filter_HW_stream_hw(volatile void * __xlx_apatb_param_Input, volatile void * __xlx_apatb_param_Output) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;{
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_p1);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<128> > p1_pc_buffer(8100);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "p1");
  
            // push token into output port buffer
            if (AESL_token != "") {
              p1_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 8100; j < e; j += 1, ++i) {((long long*)__xlx_apatb_param_Output)[j*2+0] = p1_pc_buffer[i].range(63,0).to_int64();
((long long*)__xlx_apatb_param_Output)[j*2+1] = p1_pc_buffer[i].range(127,64).to_int64();
}}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return ;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//p0
aesl_fh.touch(AUTOTB_TVIN_p0);
aesl_fh.touch(AUTOTB_TVOUT_p0);
//p1
aesl_fh.touch(AUTOTB_TVIN_p1);
aesl_fh.touch(AUTOTB_TVOUT_p1);
//Input
aesl_fh.touch(AUTOTB_TVIN_Input);
aesl_fh.touch(AUTOTB_TVOUT_Input);
//Output
aesl_fh.touch(AUTOTB_TVIN_Output);
aesl_fh.touch(AUTOTB_TVOUT_Output);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_Input = 0;
// print p0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_p0, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_Input = 0*64;
  if (__xlx_apatb_param_Input) {
    for (int j = 0  - 0, e = 2025 - 0; j != e; ++j) {
sc_bv<512> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_Input)[j*8+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_Input)[j*8+1];
__xlx_tmp_lv.range(191,128) = ((long long*)__xlx_apatb_param_Input)[j*8+2];
__xlx_tmp_lv.range(255,192) = ((long long*)__xlx_apatb_param_Input)[j*8+3];
__xlx_tmp_lv.range(319,256) = ((long long*)__xlx_apatb_param_Input)[j*8+4];
__xlx_tmp_lv.range(383,320) = ((long long*)__xlx_apatb_param_Input)[j*8+5];
__xlx_tmp_lv.range(447,384) = ((long long*)__xlx_apatb_param_Input)[j*8+6];
__xlx_tmp_lv.range(511,448) = ((long long*)__xlx_apatb_param_Input)[j*8+7];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_p0, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(2025, &tcl_file.p0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_p0, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_Output = 0;
// print p1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_p1, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_Output = 0*16;
  if (__xlx_apatb_param_Output) {
    for (int j = 0  - 0, e = 8100 - 0; j != e; ++j) {
sc_bv<128> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_Output)[j*2+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_Output)[j*2+1];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_p1, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8100, &tcl_file.p1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_p1, __xlx_sprintf_buffer.data());
}
// print Input Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_Input, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_Input;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_Input, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.Input_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_Input, __xlx_sprintf_buffer.data());
}
// print Output Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_Output, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_Output;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_Output, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.Output_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_Output, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
Filter_HW_stream_hw_stub_wrapper(__xlx_apatb_param_Input, __xlx_apatb_param_Output);
CodeState = DUMP_OUTPUTS;
// print p1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_p1, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_Output = 0*16;
  if (__xlx_apatb_param_Output) {
    for (int j = 0  - 0, e = 8100 - 0; j != e; ++j) {
sc_bv<128> __xlx_tmp_lv;
__xlx_tmp_lv.range(63,0) = ((long long*)__xlx_apatb_param_Output)[j*2+0];
__xlx_tmp_lv.range(127,64) = ((long long*)__xlx_apatb_param_Output)[j*2+1];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_p1, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8100, &tcl_file.p1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_p1, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
