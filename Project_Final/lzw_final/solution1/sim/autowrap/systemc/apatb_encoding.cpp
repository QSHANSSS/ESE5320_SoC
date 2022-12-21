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
#define AUTOTB_TVIN_p0 "../tv/cdatafile/c.encoding.autotvin_p0.dat"
#define AUTOTB_TVOUT_p0 "../tv/cdatafile/c.encoding.autotvout_p0.dat"
// wrapc file define:
#define AUTOTB_TVIN_p1 "../tv/cdatafile/c.encoding.autotvin_p1.dat"
#define AUTOTB_TVOUT_p1 "../tv/cdatafile/c.encoding.autotvout_p1.dat"
// wrapc file define:
#define AUTOTB_TVIN_p2 "../tv/cdatafile/c.encoding.autotvin_p2.dat"
#define AUTOTB_TVOUT_p2 "../tv/cdatafile/c.encoding.autotvout_p2.dat"
// wrapc file define:
#define AUTOTB_TVIN_p3 "../tv/cdatafile/c.encoding.autotvin_p3.dat"
#define AUTOTB_TVOUT_p3 "../tv/cdatafile/c.encoding.autotvout_p3.dat"
// wrapc file define:
#define AUTOTB_TVIN_buff "../tv/cdatafile/c.encoding.autotvin_buff.dat"
#define AUTOTB_TVOUT_buff "../tv/cdatafile/c.encoding.autotvout_buff.dat"
// wrapc file define:
#define AUTOTB_TVIN_input_length "../tv/cdatafile/c.encoding.autotvin_input_length.dat"
#define AUTOTB_TVOUT_input_length "../tv/cdatafile/c.encoding.autotvout_input_length.dat"
// wrapc file define:
#define AUTOTB_TVIN_output_compress "../tv/cdatafile/c.encoding.autotvin_output_compress.dat"
#define AUTOTB_TVOUT_output_compress "../tv/cdatafile/c.encoding.autotvout_output_compress.dat"
// wrapc file define:
#define AUTOTB_TVIN_output_length "../tv/cdatafile/c.encoding.autotvin_output_length.dat"
#define AUTOTB_TVOUT_output_length "../tv/cdatafile/c.encoding.autotvout_output_length.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_p0 "../tv/rtldatafile/rtl.encoding.autotvout_p0.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_p1 "../tv/rtldatafile/rtl.encoding.autotvout_p1.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_p2 "../tv/rtldatafile/rtl.encoding.autotvout_p2.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_p3 "../tv/rtldatafile/rtl.encoding.autotvout_p3.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_buff "../tv/rtldatafile/rtl.encoding.autotvout_buff.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_input_length "../tv/rtldatafile/rtl.encoding.autotvout_input_length.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_output_compress "../tv/rtldatafile/rtl.encoding.autotvout_output_compress.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_output_length "../tv/rtldatafile/rtl.encoding.autotvout_output_length.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  p0_depth = 0;
  p1_depth = 0;
  p2_depth = 0;
  p3_depth = 0;
  buff_depth = 0;
  input_length_depth = 0;
  output_compress_depth = 0;
  output_length_depth = 0;
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
  total_list << "{p2 " << p2_depth << "}\n";
  total_list << "{p3 " << p3_depth << "}\n";
  total_list << "{buff " << buff_depth << "}\n";
  total_list << "{input_length " << input_length_depth << "}\n";
  total_list << "{output_compress " << output_compress_depth << "}\n";
  total_list << "{output_length " << output_length_depth << "}\n";
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
    int p2_depth;
    int p3_depth;
    int buff_depth;
    int input_length_depth;
    int output_compress_depth;
    int output_length_depth;
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
extern "C" void encoding_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" void apatb_encoding_hw(volatile void * __xlx_apatb_param_buff, volatile void * __xlx_apatb_param_input_length, volatile void * __xlx_apatb_param_output_compress, volatile void * __xlx_apatb_param_output_length) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_p2);
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
          std::vector<sc_bv<16> > p2_pc_buffer(8192);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "p2");
  
            // push token into output port buffer
            if (AESL_token != "") {
              p2_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 8192; j < e; j += 1, ++i) {
            ((short*)__xlx_apatb_param_output_compress)[j] = p2_pc_buffer[i].to_int64();
          }}}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_p3);
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
          std::vector<sc_bv<32> > p3_pc_buffer(2);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "p3");
  
            // push token into output port buffer
            if (AESL_token != "") {
              p3_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {{
            int i = 0;
            for (int j = 0, e = 2; j < e; j += 1, ++i) {
            ((int*)__xlx_apatb_param_output_length)[j] = p3_pc_buffer[i].to_int64();
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
//p2
aesl_fh.touch(AUTOTB_TVIN_p2);
aesl_fh.touch(AUTOTB_TVOUT_p2);
//p3
aesl_fh.touch(AUTOTB_TVIN_p3);
aesl_fh.touch(AUTOTB_TVOUT_p3);
//buff
aesl_fh.touch(AUTOTB_TVIN_buff);
aesl_fh.touch(AUTOTB_TVOUT_buff);
//input_length
aesl_fh.touch(AUTOTB_TVIN_input_length);
aesl_fh.touch(AUTOTB_TVOUT_input_length);
//output_compress
aesl_fh.touch(AUTOTB_TVIN_output_compress);
aesl_fh.touch(AUTOTB_TVOUT_output_compress);
//output_length
aesl_fh.touch(AUTOTB_TVIN_output_length);
aesl_fh.touch(AUTOTB_TVOUT_output_length);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_buff = 0;
// print p0 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_p0, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_buff = 0*1;
  if (__xlx_apatb_param_buff) {
    for (int j = 0  - 0, e = 8192 - 0; j != e; ++j) {
sc_bv<8> __xlx_tmp_lv = ((char*)__xlx_apatb_param_buff)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_p0, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8192, &tcl_file.p0_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_p0, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_input_length = 0;
// print p1 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_p1, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_input_length = 0*4;
  if (__xlx_apatb_param_input_length) {
    for (int j = 0  - 0, e = 2 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_input_length)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_p1, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(2, &tcl_file.p1_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_p1, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_output_compress = 0;
// print p2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_p2, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_output_compress = 0*2;
  if (__xlx_apatb_param_output_compress) {
    for (int j = 0  - 0, e = 8192 - 0; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv = ((short*)__xlx_apatb_param_output_compress)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_p2, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8192, &tcl_file.p2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_p2, __xlx_sprintf_buffer.data());
}
unsigned __xlx_offset_byte_param_output_length = 0;
// print p3 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_p3, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_output_length = 0*4;
  if (__xlx_apatb_param_output_length) {
    for (int j = 0  - 0, e = 2 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_output_length)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_p3, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(2, &tcl_file.p3_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_p3, __xlx_sprintf_buffer.data());
}
// print buff Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_buff, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_buff;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_buff, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.buff_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_buff, __xlx_sprintf_buffer.data());
}
// print input_length Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_input_length, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_input_length;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_input_length, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.input_length_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_input_length, __xlx_sprintf_buffer.data());
}
// print output_compress Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_output_compress, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_output_compress;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_output_compress, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.output_compress_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_output_compress, __xlx_sprintf_buffer.data());
}
// print output_length Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_output_length, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_output_length;

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVIN_output_length, __xlx_sprintf_buffer.data()); 
  }
  tcl_file.set_num(1, &tcl_file.output_length_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_output_length, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
encoding_hw_stub_wrapper(__xlx_apatb_param_buff, __xlx_apatb_param_input_length, __xlx_apatb_param_output_compress, __xlx_apatb_param_output_length);
CodeState = DUMP_OUTPUTS;
// print p2 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_p2, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_output_compress = 0*2;
  if (__xlx_apatb_param_output_compress) {
    for (int j = 0  - 0, e = 8192 - 0; j != e; ++j) {
sc_bv<16> __xlx_tmp_lv = ((short*)__xlx_apatb_param_output_compress)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_p2, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(8192, &tcl_file.p2_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_p2, __xlx_sprintf_buffer.data());
}
// print p3 Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_p3, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_output_length = 0*4;
  if (__xlx_apatb_param_output_length) {
    for (int j = 0  - 0, e = 2 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_output_length)[j];

    sprintf(__xlx_sprintf_buffer.data(), "%s\n", __xlx_tmp_lv.to_string(SC_HEX).c_str());
    aesl_fh.write(AUTOTB_TVOUT_p3, __xlx_sprintf_buffer.data()); 
      }
  }
}
  tcl_file.set_num(2, &tcl_file.p3_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_p3, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
}
