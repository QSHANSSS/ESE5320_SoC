// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
 `timescale 1ns/1ps


`define AUTOTB_DUT      encoding
`define AUTOTB_DUT_INST AESL_inst_encoding
`define AUTOTB_TOP      apatb_encoding_top
`define AUTOTB_LAT_RESULT_FILE "encoding.result.lat.rb"
`define AUTOTB_PER_RESULT_TRANS_FILE "encoding.performance.result.transaction.xml"
`define AUTOTB_TOP_INST AESL_inst_apatb_encoding_top
`define AUTOTB_MAX_ALLOW_LATENCY  15000000
`define AUTOTB_CLOCK_PERIOD_DIV2 3.33

`define AESL_DEPTH_p0 1
`define AESL_DEPTH_p1 1
`define AESL_DEPTH_p2 1
`define AESL_DEPTH_p3 1
`define AESL_DEPTH_buff 1
`define AESL_DEPTH_input_length 1
`define AESL_DEPTH_output_compress 1
`define AESL_DEPTH_output_length 1
`define AUTOTB_TVIN_p0  "./c.encoding.autotvin_p0.dat"
`define AUTOTB_TVIN_p1  "./c.encoding.autotvin_p1.dat"
`define AUTOTB_TVIN_buff  "./c.encoding.autotvin_buff.dat"
`define AUTOTB_TVIN_input_length  "./c.encoding.autotvin_input_length.dat"
`define AUTOTB_TVIN_output_compress  "./c.encoding.autotvin_output_compress.dat"
`define AUTOTB_TVIN_output_length  "./c.encoding.autotvin_output_length.dat"
`define AUTOTB_TVIN_p0_out_wrapc  "./rtl.encoding.autotvin_p0.dat"
`define AUTOTB_TVIN_p1_out_wrapc  "./rtl.encoding.autotvin_p1.dat"
`define AUTOTB_TVIN_buff_out_wrapc  "./rtl.encoding.autotvin_buff.dat"
`define AUTOTB_TVIN_input_length_out_wrapc  "./rtl.encoding.autotvin_input_length.dat"
`define AUTOTB_TVIN_output_compress_out_wrapc  "./rtl.encoding.autotvin_output_compress.dat"
`define AUTOTB_TVIN_output_length_out_wrapc  "./rtl.encoding.autotvin_output_length.dat"
`define AUTOTB_TVOUT_p2  "./c.encoding.autotvout_p2.dat"
`define AUTOTB_TVOUT_p3  "./c.encoding.autotvout_p3.dat"
`define AUTOTB_TVOUT_p2_out_wrapc  "./impl_rtl.encoding.autotvout_p2.dat"
`define AUTOTB_TVOUT_p3_out_wrapc  "./impl_rtl.encoding.autotvout_p3.dat"
module `AUTOTB_TOP;

parameter AUTOTB_TRANSACTION_NUM = 1;
parameter PROGRESS_TIMEOUT = 10000000;
parameter LATENCY_ESTIMATION = -1;
parameter LENGTH_p0 = 8192;
parameter LENGTH_p1 = 2;
parameter LENGTH_p2 = 8192;
parameter LENGTH_p3 = 2;
parameter LENGTH_buff = 1;
parameter LENGTH_input_length = 1;
parameter LENGTH_output_compress = 1;
parameter LENGTH_output_length = 1;

task read_token;
    input integer fp;
    output reg [191 : 0] token;
    integer ret;
    begin
        token = "";
        ret = 0;
        ret = $fscanf(fp,"%s",token);
    end
endtask

task post_check;
    input integer fp1;
    input integer fp2;
    reg [191 : 0] token1;
    reg [191 : 0] token2;
    reg [191 : 0] golden;
    reg [191 : 0] result;
    integer ret;
    begin
        read_token(fp1, token1);
        read_token(fp2, token2);
        if (token1 != "[[[runtime]]]" || token2 != "[[[runtime]]]") begin
            $display("ERROR: Simulation using HLS TB failed.");
            $finish;
        end
        read_token(fp1, token1);
        read_token(fp2, token2);
        while (token1 != "[[[/runtime]]]" && token2 != "[[[/runtime]]]") begin
            if (token1 != "[[transaction]]" || token2 != "[[transaction]]") begin
                $display("ERROR: Simulation using HLS TB failed.");
                  $finish;
            end
            read_token(fp1, token1);  // skip transaction number
            read_token(fp2, token2);  // skip transaction number
              read_token(fp1, token1);
              read_token(fp2, token2);
            while(token1 != "[[/transaction]]" && token2 != "[[/transaction]]") begin
                ret = $sscanf(token1, "0x%x", golden);
                  if (ret != 1) begin
                      $display("Failed to parse token!");
                    $display("ERROR: Simulation using HLS TB failed.");
                      $finish;
                  end
                ret = $sscanf(token2, "0x%x", result);
                  if (ret != 1) begin
                      $display("Failed to parse token!");
                    $display("ERROR: Simulation using HLS TB failed.");
                      $finish;
                  end
                if(golden != result) begin
                      $display("%x (expected) vs. %x (actual) - mismatch", golden, result);
                    $display("ERROR: Simulation using HLS TB failed.");
                      $finish;
                end
                  read_token(fp1, token1);
                  read_token(fp2, token2);
            end
              read_token(fp1, token1);
              read_token(fp2, token2);
        end
    end
endtask

reg AESL_clock;
reg rst;
reg dut_rst;
reg start;
reg ce;
reg tb_continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
wire [5 : 0] control_AWADDR;
wire  control_AWVALID;
wire  control_AWREADY;
wire  control_WVALID;
wire  control_WREADY;
wire [31 : 0] control_WDATA;
wire [3 : 0] control_WSTRB;
wire [5 : 0] control_ARADDR;
wire  control_ARVALID;
wire  control_ARREADY;
wire  control_RVALID;
wire  control_RREADY;
wire [31 : 0] control_RDATA;
wire [1 : 0] control_RRESP;
wire  control_BVALID;
wire  control_BREADY;
wire [1 : 0] control_BRESP;
wire  control_INTERRUPT;
wire  p0_AWVALID;
wire  p0_AWREADY;
wire [63 : 0] p0_AWADDR;
wire [0 : 0] p0_AWID;
wire [7 : 0] p0_AWLEN;
wire [2 : 0] p0_AWSIZE;
wire [1 : 0] p0_AWBURST;
wire [1 : 0] p0_AWLOCK;
wire [3 : 0] p0_AWCACHE;
wire [2 : 0] p0_AWPROT;
wire [3 : 0] p0_AWQOS;
wire [3 : 0] p0_AWREGION;
wire [0 : 0] p0_AWUSER;
wire  p0_WVALID;
wire  p0_WREADY;
wire [31 : 0] p0_WDATA;
wire [3 : 0] p0_WSTRB;
wire  p0_WLAST;
wire [0 : 0] p0_WID;
wire [0 : 0] p0_WUSER;
wire  p0_ARVALID;
wire  p0_ARREADY;
wire [63 : 0] p0_ARADDR;
wire [0 : 0] p0_ARID;
wire [7 : 0] p0_ARLEN;
wire [2 : 0] p0_ARSIZE;
wire [1 : 0] p0_ARBURST;
wire [1 : 0] p0_ARLOCK;
wire [3 : 0] p0_ARCACHE;
wire [2 : 0] p0_ARPROT;
wire [3 : 0] p0_ARQOS;
wire [3 : 0] p0_ARREGION;
wire [0 : 0] p0_ARUSER;
wire  p0_RVALID;
wire  p0_RREADY;
wire [31 : 0] p0_RDATA;
wire  p0_RLAST;
wire [0 : 0] p0_RID;
wire [0 : 0] p0_RUSER;
wire [1 : 0] p0_RRESP;
wire  p0_BVALID;
wire  p0_BREADY;
wire [1 : 0] p0_BRESP;
wire [0 : 0] p0_BID;
wire [0 : 0] p0_BUSER;
wire  p1_AWVALID;
wire  p1_AWREADY;
wire [63 : 0] p1_AWADDR;
wire [0 : 0] p1_AWID;
wire [7 : 0] p1_AWLEN;
wire [2 : 0] p1_AWSIZE;
wire [1 : 0] p1_AWBURST;
wire [1 : 0] p1_AWLOCK;
wire [3 : 0] p1_AWCACHE;
wire [2 : 0] p1_AWPROT;
wire [3 : 0] p1_AWQOS;
wire [3 : 0] p1_AWREGION;
wire [0 : 0] p1_AWUSER;
wire  p1_WVALID;
wire  p1_WREADY;
wire [31 : 0] p1_WDATA;
wire [3 : 0] p1_WSTRB;
wire  p1_WLAST;
wire [0 : 0] p1_WID;
wire [0 : 0] p1_WUSER;
wire  p1_ARVALID;
wire  p1_ARREADY;
wire [63 : 0] p1_ARADDR;
wire [0 : 0] p1_ARID;
wire [7 : 0] p1_ARLEN;
wire [2 : 0] p1_ARSIZE;
wire [1 : 0] p1_ARBURST;
wire [1 : 0] p1_ARLOCK;
wire [3 : 0] p1_ARCACHE;
wire [2 : 0] p1_ARPROT;
wire [3 : 0] p1_ARQOS;
wire [3 : 0] p1_ARREGION;
wire [0 : 0] p1_ARUSER;
wire  p1_RVALID;
wire  p1_RREADY;
wire [31 : 0] p1_RDATA;
wire  p1_RLAST;
wire [0 : 0] p1_RID;
wire [0 : 0] p1_RUSER;
wire [1 : 0] p1_RRESP;
wire  p1_BVALID;
wire  p1_BREADY;
wire [1 : 0] p1_BRESP;
wire [0 : 0] p1_BID;
wire [0 : 0] p1_BUSER;
wire  p2_AWVALID;
wire  p2_AWREADY;
wire [63 : 0] p2_AWADDR;
wire [0 : 0] p2_AWID;
wire [7 : 0] p2_AWLEN;
wire [2 : 0] p2_AWSIZE;
wire [1 : 0] p2_AWBURST;
wire [1 : 0] p2_AWLOCK;
wire [3 : 0] p2_AWCACHE;
wire [2 : 0] p2_AWPROT;
wire [3 : 0] p2_AWQOS;
wire [3 : 0] p2_AWREGION;
wire [0 : 0] p2_AWUSER;
wire  p2_WVALID;
wire  p2_WREADY;
wire [31 : 0] p2_WDATA;
wire [3 : 0] p2_WSTRB;
wire  p2_WLAST;
wire [0 : 0] p2_WID;
wire [0 : 0] p2_WUSER;
wire  p2_ARVALID;
wire  p2_ARREADY;
wire [63 : 0] p2_ARADDR;
wire [0 : 0] p2_ARID;
wire [7 : 0] p2_ARLEN;
wire [2 : 0] p2_ARSIZE;
wire [1 : 0] p2_ARBURST;
wire [1 : 0] p2_ARLOCK;
wire [3 : 0] p2_ARCACHE;
wire [2 : 0] p2_ARPROT;
wire [3 : 0] p2_ARQOS;
wire [3 : 0] p2_ARREGION;
wire [0 : 0] p2_ARUSER;
wire  p2_RVALID;
wire  p2_RREADY;
wire [31 : 0] p2_RDATA;
wire  p2_RLAST;
wire [0 : 0] p2_RID;
wire [0 : 0] p2_RUSER;
wire [1 : 0] p2_RRESP;
wire  p2_BVALID;
wire  p2_BREADY;
wire [1 : 0] p2_BRESP;
wire [0 : 0] p2_BID;
wire [0 : 0] p2_BUSER;
wire  p3_AWVALID;
wire  p3_AWREADY;
wire [63 : 0] p3_AWADDR;
wire [0 : 0] p3_AWID;
wire [7 : 0] p3_AWLEN;
wire [2 : 0] p3_AWSIZE;
wire [1 : 0] p3_AWBURST;
wire [1 : 0] p3_AWLOCK;
wire [3 : 0] p3_AWCACHE;
wire [2 : 0] p3_AWPROT;
wire [3 : 0] p3_AWQOS;
wire [3 : 0] p3_AWREGION;
wire [0 : 0] p3_AWUSER;
wire  p3_WVALID;
wire  p3_WREADY;
wire [31 : 0] p3_WDATA;
wire [3 : 0] p3_WSTRB;
wire  p3_WLAST;
wire [0 : 0] p3_WID;
wire [0 : 0] p3_WUSER;
wire  p3_ARVALID;
wire  p3_ARREADY;
wire [63 : 0] p3_ARADDR;
wire [0 : 0] p3_ARID;
wire [7 : 0] p3_ARLEN;
wire [2 : 0] p3_ARSIZE;
wire [1 : 0] p3_ARBURST;
wire [1 : 0] p3_ARLOCK;
wire [3 : 0] p3_ARCACHE;
wire [2 : 0] p3_ARPROT;
wire [3 : 0] p3_ARQOS;
wire [3 : 0] p3_ARREGION;
wire [0 : 0] p3_ARUSER;
wire  p3_RVALID;
wire  p3_RREADY;
wire [31 : 0] p3_RDATA;
wire  p3_RLAST;
wire [0 : 0] p3_RID;
wire [0 : 0] p3_RUSER;
wire [1 : 0] p3_RRESP;
wire  p3_BVALID;
wire  p3_BREADY;
wire [1 : 0] p3_BRESP;
wire [0 : 0] p3_BID;
wire [0 : 0] p3_BUSER;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;
wire control_write_data_finish;
wire AESL_slave_start;
reg AESL_slave_start_lock = 0;
wire AESL_slave_write_start_in;
wire AESL_slave_write_start_finish;
reg AESL_slave_ready;
wire AESL_slave_output_done;
wire AESL_slave_done;
reg ready_rise = 0;
reg start_rise = 0;
reg slave_start_status = 0;
reg slave_done_status = 0;
reg ap_done_lock = 0;

wire ap_clk;
wire ap_rst_n;
wire ap_rst_n_n;

`AUTOTB_DUT `AUTOTB_DUT_INST(
    .s_axi_control_AWADDR(control_AWADDR),
    .s_axi_control_AWVALID(control_AWVALID),
    .s_axi_control_AWREADY(control_AWREADY),
    .s_axi_control_WVALID(control_WVALID),
    .s_axi_control_WREADY(control_WREADY),
    .s_axi_control_WDATA(control_WDATA),
    .s_axi_control_WSTRB(control_WSTRB),
    .s_axi_control_ARADDR(control_ARADDR),
    .s_axi_control_ARVALID(control_ARVALID),
    .s_axi_control_ARREADY(control_ARREADY),
    .s_axi_control_RVALID(control_RVALID),
    .s_axi_control_RREADY(control_RREADY),
    .s_axi_control_RDATA(control_RDATA),
    .s_axi_control_RRESP(control_RRESP),
    .s_axi_control_BVALID(control_BVALID),
    .s_axi_control_BREADY(control_BREADY),
    .s_axi_control_BRESP(control_BRESP),
    .interrupt(control_INTERRUPT),
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .m_axi_p0_AWVALID(p0_AWVALID),
    .m_axi_p0_AWREADY(p0_AWREADY),
    .m_axi_p0_AWADDR(p0_AWADDR),
    .m_axi_p0_AWID(p0_AWID),
    .m_axi_p0_AWLEN(p0_AWLEN),
    .m_axi_p0_AWSIZE(p0_AWSIZE),
    .m_axi_p0_AWBURST(p0_AWBURST),
    .m_axi_p0_AWLOCK(p0_AWLOCK),
    .m_axi_p0_AWCACHE(p0_AWCACHE),
    .m_axi_p0_AWPROT(p0_AWPROT),
    .m_axi_p0_AWQOS(p0_AWQOS),
    .m_axi_p0_AWREGION(p0_AWREGION),
    .m_axi_p0_AWUSER(p0_AWUSER),
    .m_axi_p0_WVALID(p0_WVALID),
    .m_axi_p0_WREADY(p0_WREADY),
    .m_axi_p0_WDATA(p0_WDATA),
    .m_axi_p0_WSTRB(p0_WSTRB),
    .m_axi_p0_WLAST(p0_WLAST),
    .m_axi_p0_WID(p0_WID),
    .m_axi_p0_WUSER(p0_WUSER),
    .m_axi_p0_ARVALID(p0_ARVALID),
    .m_axi_p0_ARREADY(p0_ARREADY),
    .m_axi_p0_ARADDR(p0_ARADDR),
    .m_axi_p0_ARID(p0_ARID),
    .m_axi_p0_ARLEN(p0_ARLEN),
    .m_axi_p0_ARSIZE(p0_ARSIZE),
    .m_axi_p0_ARBURST(p0_ARBURST),
    .m_axi_p0_ARLOCK(p0_ARLOCK),
    .m_axi_p0_ARCACHE(p0_ARCACHE),
    .m_axi_p0_ARPROT(p0_ARPROT),
    .m_axi_p0_ARQOS(p0_ARQOS),
    .m_axi_p0_ARREGION(p0_ARREGION),
    .m_axi_p0_ARUSER(p0_ARUSER),
    .m_axi_p0_RVALID(p0_RVALID),
    .m_axi_p0_RREADY(p0_RREADY),
    .m_axi_p0_RDATA(p0_RDATA),
    .m_axi_p0_RLAST(p0_RLAST),
    .m_axi_p0_RID(p0_RID),
    .m_axi_p0_RUSER(p0_RUSER),
    .m_axi_p0_RRESP(p0_RRESP),
    .m_axi_p0_BVALID(p0_BVALID),
    .m_axi_p0_BREADY(p0_BREADY),
    .m_axi_p0_BRESP(p0_BRESP),
    .m_axi_p0_BID(p0_BID),
    .m_axi_p0_BUSER(p0_BUSER),
    .m_axi_p1_AWVALID(p1_AWVALID),
    .m_axi_p1_AWREADY(p1_AWREADY),
    .m_axi_p1_AWADDR(p1_AWADDR),
    .m_axi_p1_AWID(p1_AWID),
    .m_axi_p1_AWLEN(p1_AWLEN),
    .m_axi_p1_AWSIZE(p1_AWSIZE),
    .m_axi_p1_AWBURST(p1_AWBURST),
    .m_axi_p1_AWLOCK(p1_AWLOCK),
    .m_axi_p1_AWCACHE(p1_AWCACHE),
    .m_axi_p1_AWPROT(p1_AWPROT),
    .m_axi_p1_AWQOS(p1_AWQOS),
    .m_axi_p1_AWREGION(p1_AWREGION),
    .m_axi_p1_AWUSER(p1_AWUSER),
    .m_axi_p1_WVALID(p1_WVALID),
    .m_axi_p1_WREADY(p1_WREADY),
    .m_axi_p1_WDATA(p1_WDATA),
    .m_axi_p1_WSTRB(p1_WSTRB),
    .m_axi_p1_WLAST(p1_WLAST),
    .m_axi_p1_WID(p1_WID),
    .m_axi_p1_WUSER(p1_WUSER),
    .m_axi_p1_ARVALID(p1_ARVALID),
    .m_axi_p1_ARREADY(p1_ARREADY),
    .m_axi_p1_ARADDR(p1_ARADDR),
    .m_axi_p1_ARID(p1_ARID),
    .m_axi_p1_ARLEN(p1_ARLEN),
    .m_axi_p1_ARSIZE(p1_ARSIZE),
    .m_axi_p1_ARBURST(p1_ARBURST),
    .m_axi_p1_ARLOCK(p1_ARLOCK),
    .m_axi_p1_ARCACHE(p1_ARCACHE),
    .m_axi_p1_ARPROT(p1_ARPROT),
    .m_axi_p1_ARQOS(p1_ARQOS),
    .m_axi_p1_ARREGION(p1_ARREGION),
    .m_axi_p1_ARUSER(p1_ARUSER),
    .m_axi_p1_RVALID(p1_RVALID),
    .m_axi_p1_RREADY(p1_RREADY),
    .m_axi_p1_RDATA(p1_RDATA),
    .m_axi_p1_RLAST(p1_RLAST),
    .m_axi_p1_RID(p1_RID),
    .m_axi_p1_RUSER(p1_RUSER),
    .m_axi_p1_RRESP(p1_RRESP),
    .m_axi_p1_BVALID(p1_BVALID),
    .m_axi_p1_BREADY(p1_BREADY),
    .m_axi_p1_BRESP(p1_BRESP),
    .m_axi_p1_BID(p1_BID),
    .m_axi_p1_BUSER(p1_BUSER),
    .m_axi_p2_AWVALID(p2_AWVALID),
    .m_axi_p2_AWREADY(p2_AWREADY),
    .m_axi_p2_AWADDR(p2_AWADDR),
    .m_axi_p2_AWID(p2_AWID),
    .m_axi_p2_AWLEN(p2_AWLEN),
    .m_axi_p2_AWSIZE(p2_AWSIZE),
    .m_axi_p2_AWBURST(p2_AWBURST),
    .m_axi_p2_AWLOCK(p2_AWLOCK),
    .m_axi_p2_AWCACHE(p2_AWCACHE),
    .m_axi_p2_AWPROT(p2_AWPROT),
    .m_axi_p2_AWQOS(p2_AWQOS),
    .m_axi_p2_AWREGION(p2_AWREGION),
    .m_axi_p2_AWUSER(p2_AWUSER),
    .m_axi_p2_WVALID(p2_WVALID),
    .m_axi_p2_WREADY(p2_WREADY),
    .m_axi_p2_WDATA(p2_WDATA),
    .m_axi_p2_WSTRB(p2_WSTRB),
    .m_axi_p2_WLAST(p2_WLAST),
    .m_axi_p2_WID(p2_WID),
    .m_axi_p2_WUSER(p2_WUSER),
    .m_axi_p2_ARVALID(p2_ARVALID),
    .m_axi_p2_ARREADY(p2_ARREADY),
    .m_axi_p2_ARADDR(p2_ARADDR),
    .m_axi_p2_ARID(p2_ARID),
    .m_axi_p2_ARLEN(p2_ARLEN),
    .m_axi_p2_ARSIZE(p2_ARSIZE),
    .m_axi_p2_ARBURST(p2_ARBURST),
    .m_axi_p2_ARLOCK(p2_ARLOCK),
    .m_axi_p2_ARCACHE(p2_ARCACHE),
    .m_axi_p2_ARPROT(p2_ARPROT),
    .m_axi_p2_ARQOS(p2_ARQOS),
    .m_axi_p2_ARREGION(p2_ARREGION),
    .m_axi_p2_ARUSER(p2_ARUSER),
    .m_axi_p2_RVALID(p2_RVALID),
    .m_axi_p2_RREADY(p2_RREADY),
    .m_axi_p2_RDATA(p2_RDATA),
    .m_axi_p2_RLAST(p2_RLAST),
    .m_axi_p2_RID(p2_RID),
    .m_axi_p2_RUSER(p2_RUSER),
    .m_axi_p2_RRESP(p2_RRESP),
    .m_axi_p2_BVALID(p2_BVALID),
    .m_axi_p2_BREADY(p2_BREADY),
    .m_axi_p2_BRESP(p2_BRESP),
    .m_axi_p2_BID(p2_BID),
    .m_axi_p2_BUSER(p2_BUSER),
    .m_axi_p3_AWVALID(p3_AWVALID),
    .m_axi_p3_AWREADY(p3_AWREADY),
    .m_axi_p3_AWADDR(p3_AWADDR),
    .m_axi_p3_AWID(p3_AWID),
    .m_axi_p3_AWLEN(p3_AWLEN),
    .m_axi_p3_AWSIZE(p3_AWSIZE),
    .m_axi_p3_AWBURST(p3_AWBURST),
    .m_axi_p3_AWLOCK(p3_AWLOCK),
    .m_axi_p3_AWCACHE(p3_AWCACHE),
    .m_axi_p3_AWPROT(p3_AWPROT),
    .m_axi_p3_AWQOS(p3_AWQOS),
    .m_axi_p3_AWREGION(p3_AWREGION),
    .m_axi_p3_AWUSER(p3_AWUSER),
    .m_axi_p3_WVALID(p3_WVALID),
    .m_axi_p3_WREADY(p3_WREADY),
    .m_axi_p3_WDATA(p3_WDATA),
    .m_axi_p3_WSTRB(p3_WSTRB),
    .m_axi_p3_WLAST(p3_WLAST),
    .m_axi_p3_WID(p3_WID),
    .m_axi_p3_WUSER(p3_WUSER),
    .m_axi_p3_ARVALID(p3_ARVALID),
    .m_axi_p3_ARREADY(p3_ARREADY),
    .m_axi_p3_ARADDR(p3_ARADDR),
    .m_axi_p3_ARID(p3_ARID),
    .m_axi_p3_ARLEN(p3_ARLEN),
    .m_axi_p3_ARSIZE(p3_ARSIZE),
    .m_axi_p3_ARBURST(p3_ARBURST),
    .m_axi_p3_ARLOCK(p3_ARLOCK),
    .m_axi_p3_ARCACHE(p3_ARCACHE),
    .m_axi_p3_ARPROT(p3_ARPROT),
    .m_axi_p3_ARQOS(p3_ARQOS),
    .m_axi_p3_ARREGION(p3_ARREGION),
    .m_axi_p3_ARUSER(p3_ARUSER),
    .m_axi_p3_RVALID(p3_RVALID),
    .m_axi_p3_RREADY(p3_RREADY),
    .m_axi_p3_RDATA(p3_RDATA),
    .m_axi_p3_RLAST(p3_RLAST),
    .m_axi_p3_RID(p3_RID),
    .m_axi_p3_RUSER(p3_RUSER),
    .m_axi_p3_RRESP(p3_RRESP),
    .m_axi_p3_BVALID(p3_BVALID),
    .m_axi_p3_BREADY(p3_BREADY),
    .m_axi_p3_BRESP(p3_BRESP),
    .m_axi_p3_BID(p3_BID),
    .m_axi_p3_BUSER(p3_BUSER));

// Assignment for control signal
assign ap_clk = AESL_clock;
assign ap_rst_n = dut_rst;
assign ap_rst_n_n = ~dut_rst;
assign AESL_reset = rst;
assign AESL_start = start;
assign AESL_ce = ce;
assign AESL_continue = tb_continue;
  assign AESL_slave_write_start_in = slave_start_status  & control_write_data_finish;
  assign AESL_slave_start = AESL_slave_write_start_finish;
  assign AESL_done = slave_done_status ;

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        slave_start_status <= 1;
    end
    else begin
        if (AESL_start == 1 ) begin
            start_rise = 1;
        end
        if (start_rise == 1 && AESL_done == 1 ) begin
            slave_start_status <= 1;
        end
        if (AESL_slave_write_start_in == 1 && AESL_done == 0) begin 
            slave_start_status <= 0;
            start_rise = 0;
        end
    end
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        AESL_slave_ready <= 0;
        ready_rise = 0;
    end
    else begin
        if (AESL_ready == 1 ) begin
            ready_rise = 1;
        end
        if (ready_rise == 1 && AESL_done_delay == 1 ) begin
            AESL_slave_ready <= 1;
        end
        if (AESL_slave_ready == 1) begin 
            AESL_slave_ready <= 0;
            ready_rise = 0;
        end
    end
end

always @ (posedge AESL_clock)
begin
    if (AESL_done == 1) begin
        slave_done_status <= 0;
    end
    else if (AESL_slave_output_done == 1 ) begin
        slave_done_status <= 1;
    end
end








wire    AESL_axi_master_p0_ready;
wire    AESL_axi_master_p0_done;
AESL_axi_master_p0 AESL_AXI_MASTER_p0(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_p0_AWVALID (p0_AWVALID),
    .TRAN_p0_AWREADY (p0_AWREADY),
    .TRAN_p0_AWADDR (p0_AWADDR),
    .TRAN_p0_AWID (p0_AWID),
    .TRAN_p0_AWLEN (p0_AWLEN),
    .TRAN_p0_AWSIZE (p0_AWSIZE),
    .TRAN_p0_AWBURST (p0_AWBURST),
    .TRAN_p0_AWLOCK (p0_AWLOCK),
    .TRAN_p0_AWCACHE (p0_AWCACHE),
    .TRAN_p0_AWPROT (p0_AWPROT),
    .TRAN_p0_AWQOS (p0_AWQOS),
    .TRAN_p0_AWREGION (p0_AWREGION),
    .TRAN_p0_AWUSER (p0_AWUSER),
    .TRAN_p0_WVALID (p0_WVALID),
    .TRAN_p0_WREADY (p0_WREADY),
    .TRAN_p0_WDATA (p0_WDATA),
    .TRAN_p0_WSTRB (p0_WSTRB),
    .TRAN_p0_WLAST (p0_WLAST),
    .TRAN_p0_WID (p0_WID),
    .TRAN_p0_WUSER (p0_WUSER),
    .TRAN_p0_ARVALID (p0_ARVALID),
    .TRAN_p0_ARREADY (p0_ARREADY),
    .TRAN_p0_ARADDR (p0_ARADDR),
    .TRAN_p0_ARID (p0_ARID),
    .TRAN_p0_ARLEN (p0_ARLEN),
    .TRAN_p0_ARSIZE (p0_ARSIZE),
    .TRAN_p0_ARBURST (p0_ARBURST),
    .TRAN_p0_ARLOCK (p0_ARLOCK),
    .TRAN_p0_ARCACHE (p0_ARCACHE),
    .TRAN_p0_ARPROT (p0_ARPROT),
    .TRAN_p0_ARQOS (p0_ARQOS),
    .TRAN_p0_ARREGION (p0_ARREGION),
    .TRAN_p0_ARUSER (p0_ARUSER),
    .TRAN_p0_RVALID (p0_RVALID),
    .TRAN_p0_RREADY (p0_RREADY),
    .TRAN_p0_RDATA (p0_RDATA),
    .TRAN_p0_RLAST (p0_RLAST),
    .TRAN_p0_RID (p0_RID),
    .TRAN_p0_RUSER (p0_RUSER),
    .TRAN_p0_RRESP (p0_RRESP),
    .TRAN_p0_BVALID (p0_BVALID),
    .TRAN_p0_BREADY (p0_BREADY),
    .TRAN_p0_BRESP (p0_BRESP),
    .TRAN_p0_BID (p0_BID),
    .TRAN_p0_BUSER (p0_BUSER),
    .ready (AESL_axi_master_p0_ready),
    .done  (AESL_axi_master_p0_done)
);
assign    AESL_axi_master_p0_ready    =   ready;
assign    AESL_axi_master_p0_done    =   AESL_done_delay;
wire    AESL_axi_master_p1_ready;
wire    AESL_axi_master_p1_done;
AESL_axi_master_p1 AESL_AXI_MASTER_p1(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_p1_AWVALID (p1_AWVALID),
    .TRAN_p1_AWREADY (p1_AWREADY),
    .TRAN_p1_AWADDR (p1_AWADDR),
    .TRAN_p1_AWID (p1_AWID),
    .TRAN_p1_AWLEN (p1_AWLEN),
    .TRAN_p1_AWSIZE (p1_AWSIZE),
    .TRAN_p1_AWBURST (p1_AWBURST),
    .TRAN_p1_AWLOCK (p1_AWLOCK),
    .TRAN_p1_AWCACHE (p1_AWCACHE),
    .TRAN_p1_AWPROT (p1_AWPROT),
    .TRAN_p1_AWQOS (p1_AWQOS),
    .TRAN_p1_AWREGION (p1_AWREGION),
    .TRAN_p1_AWUSER (p1_AWUSER),
    .TRAN_p1_WVALID (p1_WVALID),
    .TRAN_p1_WREADY (p1_WREADY),
    .TRAN_p1_WDATA (p1_WDATA),
    .TRAN_p1_WSTRB (p1_WSTRB),
    .TRAN_p1_WLAST (p1_WLAST),
    .TRAN_p1_WID (p1_WID),
    .TRAN_p1_WUSER (p1_WUSER),
    .TRAN_p1_ARVALID (p1_ARVALID),
    .TRAN_p1_ARREADY (p1_ARREADY),
    .TRAN_p1_ARADDR (p1_ARADDR),
    .TRAN_p1_ARID (p1_ARID),
    .TRAN_p1_ARLEN (p1_ARLEN),
    .TRAN_p1_ARSIZE (p1_ARSIZE),
    .TRAN_p1_ARBURST (p1_ARBURST),
    .TRAN_p1_ARLOCK (p1_ARLOCK),
    .TRAN_p1_ARCACHE (p1_ARCACHE),
    .TRAN_p1_ARPROT (p1_ARPROT),
    .TRAN_p1_ARQOS (p1_ARQOS),
    .TRAN_p1_ARREGION (p1_ARREGION),
    .TRAN_p1_ARUSER (p1_ARUSER),
    .TRAN_p1_RVALID (p1_RVALID),
    .TRAN_p1_RREADY (p1_RREADY),
    .TRAN_p1_RDATA (p1_RDATA),
    .TRAN_p1_RLAST (p1_RLAST),
    .TRAN_p1_RID (p1_RID),
    .TRAN_p1_RUSER (p1_RUSER),
    .TRAN_p1_RRESP (p1_RRESP),
    .TRAN_p1_BVALID (p1_BVALID),
    .TRAN_p1_BREADY (p1_BREADY),
    .TRAN_p1_BRESP (p1_BRESP),
    .TRAN_p1_BID (p1_BID),
    .TRAN_p1_BUSER (p1_BUSER),
    .ready (AESL_axi_master_p1_ready),
    .done  (AESL_axi_master_p1_done)
);
assign    AESL_axi_master_p1_ready    =   ready;
assign    AESL_axi_master_p1_done    =   AESL_done_delay;
wire    AESL_axi_master_p2_ready;
wire    AESL_axi_master_p2_done;
AESL_axi_master_p2 AESL_AXI_MASTER_p2(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_p2_AWVALID (p2_AWVALID),
    .TRAN_p2_AWREADY (p2_AWREADY),
    .TRAN_p2_AWADDR (p2_AWADDR),
    .TRAN_p2_AWID (p2_AWID),
    .TRAN_p2_AWLEN (p2_AWLEN),
    .TRAN_p2_AWSIZE (p2_AWSIZE),
    .TRAN_p2_AWBURST (p2_AWBURST),
    .TRAN_p2_AWLOCK (p2_AWLOCK),
    .TRAN_p2_AWCACHE (p2_AWCACHE),
    .TRAN_p2_AWPROT (p2_AWPROT),
    .TRAN_p2_AWQOS (p2_AWQOS),
    .TRAN_p2_AWREGION (p2_AWREGION),
    .TRAN_p2_AWUSER (p2_AWUSER),
    .TRAN_p2_WVALID (p2_WVALID),
    .TRAN_p2_WREADY (p2_WREADY),
    .TRAN_p2_WDATA (p2_WDATA),
    .TRAN_p2_WSTRB (p2_WSTRB),
    .TRAN_p2_WLAST (p2_WLAST),
    .TRAN_p2_WID (p2_WID),
    .TRAN_p2_WUSER (p2_WUSER),
    .TRAN_p2_ARVALID (p2_ARVALID),
    .TRAN_p2_ARREADY (p2_ARREADY),
    .TRAN_p2_ARADDR (p2_ARADDR),
    .TRAN_p2_ARID (p2_ARID),
    .TRAN_p2_ARLEN (p2_ARLEN),
    .TRAN_p2_ARSIZE (p2_ARSIZE),
    .TRAN_p2_ARBURST (p2_ARBURST),
    .TRAN_p2_ARLOCK (p2_ARLOCK),
    .TRAN_p2_ARCACHE (p2_ARCACHE),
    .TRAN_p2_ARPROT (p2_ARPROT),
    .TRAN_p2_ARQOS (p2_ARQOS),
    .TRAN_p2_ARREGION (p2_ARREGION),
    .TRAN_p2_ARUSER (p2_ARUSER),
    .TRAN_p2_RVALID (p2_RVALID),
    .TRAN_p2_RREADY (p2_RREADY),
    .TRAN_p2_RDATA (p2_RDATA),
    .TRAN_p2_RLAST (p2_RLAST),
    .TRAN_p2_RID (p2_RID),
    .TRAN_p2_RUSER (p2_RUSER),
    .TRAN_p2_RRESP (p2_RRESP),
    .TRAN_p2_BVALID (p2_BVALID),
    .TRAN_p2_BREADY (p2_BREADY),
    .TRAN_p2_BRESP (p2_BRESP),
    .TRAN_p2_BID (p2_BID),
    .TRAN_p2_BUSER (p2_BUSER),
    .ready (AESL_axi_master_p2_ready),
    .done  (AESL_axi_master_p2_done)
);
assign    AESL_axi_master_p2_ready    =   ready;
assign    AESL_axi_master_p2_done    =   AESL_done_delay;
wire    AESL_axi_master_p3_ready;
wire    AESL_axi_master_p3_done;
AESL_axi_master_p3 AESL_AXI_MASTER_p3(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_p3_AWVALID (p3_AWVALID),
    .TRAN_p3_AWREADY (p3_AWREADY),
    .TRAN_p3_AWADDR (p3_AWADDR),
    .TRAN_p3_AWID (p3_AWID),
    .TRAN_p3_AWLEN (p3_AWLEN),
    .TRAN_p3_AWSIZE (p3_AWSIZE),
    .TRAN_p3_AWBURST (p3_AWBURST),
    .TRAN_p3_AWLOCK (p3_AWLOCK),
    .TRAN_p3_AWCACHE (p3_AWCACHE),
    .TRAN_p3_AWPROT (p3_AWPROT),
    .TRAN_p3_AWQOS (p3_AWQOS),
    .TRAN_p3_AWREGION (p3_AWREGION),
    .TRAN_p3_AWUSER (p3_AWUSER),
    .TRAN_p3_WVALID (p3_WVALID),
    .TRAN_p3_WREADY (p3_WREADY),
    .TRAN_p3_WDATA (p3_WDATA),
    .TRAN_p3_WSTRB (p3_WSTRB),
    .TRAN_p3_WLAST (p3_WLAST),
    .TRAN_p3_WID (p3_WID),
    .TRAN_p3_WUSER (p3_WUSER),
    .TRAN_p3_ARVALID (p3_ARVALID),
    .TRAN_p3_ARREADY (p3_ARREADY),
    .TRAN_p3_ARADDR (p3_ARADDR),
    .TRAN_p3_ARID (p3_ARID),
    .TRAN_p3_ARLEN (p3_ARLEN),
    .TRAN_p3_ARSIZE (p3_ARSIZE),
    .TRAN_p3_ARBURST (p3_ARBURST),
    .TRAN_p3_ARLOCK (p3_ARLOCK),
    .TRAN_p3_ARCACHE (p3_ARCACHE),
    .TRAN_p3_ARPROT (p3_ARPROT),
    .TRAN_p3_ARQOS (p3_ARQOS),
    .TRAN_p3_ARREGION (p3_ARREGION),
    .TRAN_p3_ARUSER (p3_ARUSER),
    .TRAN_p3_RVALID (p3_RVALID),
    .TRAN_p3_RREADY (p3_RREADY),
    .TRAN_p3_RDATA (p3_RDATA),
    .TRAN_p3_RLAST (p3_RLAST),
    .TRAN_p3_RID (p3_RID),
    .TRAN_p3_RUSER (p3_RUSER),
    .TRAN_p3_RRESP (p3_RRESP),
    .TRAN_p3_BVALID (p3_BVALID),
    .TRAN_p3_BREADY (p3_BREADY),
    .TRAN_p3_BRESP (p3_BRESP),
    .TRAN_p3_BID (p3_BID),
    .TRAN_p3_BUSER (p3_BUSER),
    .ready (AESL_axi_master_p3_ready),
    .done  (AESL_axi_master_p3_done)
);
assign    AESL_axi_master_p3_ready    =   ready;
assign    AESL_axi_master_p3_done    =   AESL_done_delay;

AESL_axi_slave_control AESL_AXI_SLAVE_control(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_s_axi_control_AWADDR (control_AWADDR),
    .TRAN_s_axi_control_AWVALID (control_AWVALID),
    .TRAN_s_axi_control_AWREADY (control_AWREADY),
    .TRAN_s_axi_control_WVALID (control_WVALID),
    .TRAN_s_axi_control_WREADY (control_WREADY),
    .TRAN_s_axi_control_WDATA (control_WDATA),
    .TRAN_s_axi_control_WSTRB (control_WSTRB),
    .TRAN_s_axi_control_ARADDR (control_ARADDR),
    .TRAN_s_axi_control_ARVALID (control_ARVALID),
    .TRAN_s_axi_control_ARREADY (control_ARREADY),
    .TRAN_s_axi_control_RVALID (control_RVALID),
    .TRAN_s_axi_control_RREADY (control_RREADY),
    .TRAN_s_axi_control_RDATA (control_RDATA),
    .TRAN_s_axi_control_RRESP (control_RRESP),
    .TRAN_s_axi_control_BVALID (control_BVALID),
    .TRAN_s_axi_control_BREADY (control_BREADY),
    .TRAN_s_axi_control_BRESP (control_BRESP),
    .TRAN_control_interrupt (control_INTERRUPT),
    .TRAN_control_write_data_finish(control_write_data_finish),
    .TRAN_control_ready_out (AESL_ready),
    .TRAN_control_ready_in (AESL_slave_ready),
    .TRAN_control_done_out (AESL_slave_output_done),
    .TRAN_control_idle_out (AESL_idle),
    .TRAN_control_write_start_in     (AESL_slave_write_start_in),
    .TRAN_control_write_start_finish (AESL_slave_write_start_finish),
    .TRAN_control_transaction_done_in (AESL_done_delay),
    .TRAN_control_start_in  (AESL_slave_start)
);

initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 1);
    while(AESL_ready_cnt != AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end

    event next_trigger_ready_cnt;
    
    initial begin : gen_ready_cnt
        ready_cnt = 0;
        wait (AESL_reset === 1);
        forever begin
            @ (posedge AESL_clock);
            if (ready == 1) begin
                if (ready_cnt < AUTOTB_TRANSACTION_NUM) begin
                    ready_cnt = ready_cnt + 1;
                end
            end
            -> next_trigger_ready_cnt;
        end
    end
    
    wire all_finish = (done_cnt == AUTOTB_TRANSACTION_NUM);
    
    // done_cnt
    always @ (posedge AESL_clock) begin
        if (~AESL_reset) begin
            done_cnt <= 0;
        end else begin
            if (AESL_done == 1) begin
                if (done_cnt < AUTOTB_TRANSACTION_NUM) begin
                    done_cnt <= done_cnt + 1;
                end
            end
        end
    end
    
    initial begin : finish_simulation
        integer fp1;
        integer fp2;
        wait (all_finish == 1);
        // last transaction is saved at negedge right after last done
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        @ (posedge AESL_clock);
        $display("Simulation Passed.");
        $finish;
    end
    
initial begin
    AESL_clock = 0;
    forever #`AUTOTB_CLOCK_PERIOD_DIV2 AESL_clock = ~AESL_clock;
end


reg end_p0;
reg [31:0] size_p0;
reg [31:0] size_p0_backup;
reg end_p1;
reg [31:0] size_p1;
reg [31:0] size_p1_backup;
reg end_buff;
reg [31:0] size_buff;
reg [31:0] size_buff_backup;
reg end_input_length;
reg [31:0] size_input_length;
reg [31:0] size_input_length_backup;
reg end_output_compress;
reg [31:0] size_output_compress;
reg [31:0] size_output_compress_backup;
reg end_output_length;
reg [31:0] size_output_length;
reg [31:0] size_output_length_backup;
reg end_p2;
reg [31:0] size_p2;
reg [31:0] size_p2_backup;
reg end_p3;
reg [31:0] size_p3;
reg [31:0] size_p3_backup;

initial begin : initial_process
    integer proc_rand;
    rst = 0;
    # 100;
    repeat(3+3) @ (posedge AESL_clock);
    rst = 1;
end
initial begin : initial_process_for_dut_rst
    integer proc_rand;
    dut_rst = 0;
    # 100;
    repeat(3) @ (posedge AESL_clock);
    dut_rst = 1;
end
initial begin : start_process
    integer proc_rand;
    reg [31:0] start_cnt;
    ce = 1;
    start = 0;
    start_cnt = 0;
    wait (AESL_reset === 1);
    @ (posedge AESL_clock);
    #0 start = 1;
    start_cnt = start_cnt + 1;
    forever begin
        if (start_cnt >= AUTOTB_TRANSACTION_NUM + 1) begin
            #0 start = 0;
        end
        @ (posedge AESL_clock);
        if (AESL_ready) begin
            start_cnt = start_cnt + 1;
        end
    end
end

always @(AESL_done)
begin
    tb_continue = AESL_done;
end

initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      AESL_ready_delay = 0;
  else
      AESL_ready_delay = AESL_ready;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready = (ready_initial | AESL_ready_delay);
assign ready_wire = ready_initial | AESL_ready_delay;
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt < AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end

always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end

reg dump_tvout_finish_p2;

initial begin : dump_tvout_runtime_sign_p2
    integer fp;
    dump_tvout_finish_p2 = 0;
    fp = $fopen(`AUTOTB_TVOUT_p2_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_p2_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_p2_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_p2_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_p2 = 1;
end


reg dump_tvout_finish_p3;

initial begin : dump_tvout_runtime_sign_p3
    integer fp;
    dump_tvout_finish_p3 = 0;
    fp = $fopen(`AUTOTB_TVOUT_p3_out_wrapc, "w");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_p3_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait (done_cnt == AUTOTB_TRANSACTION_NUM);
    // last transaction is saved at negedge right after last done
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    @ (posedge AESL_clock);
    fp = $fopen(`AUTOTB_TVOUT_p3_out_wrapc, "a");
    if (fp == 0) begin
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_p3_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
    dump_tvout_finish_p3 = 1;
end


////////////////////////////////////////////
// progress and performance
////////////////////////////////////////////

task wait_start();
    while (~AESL_start) begin
        @ (posedge AESL_clock);
    end
endtask

reg [31:0] clk_cnt = 0;
reg AESL_ready_p1;
reg AESL_start_p1;

always @ (posedge AESL_clock) begin
    if (AESL_reset == 0) begin
        clk_cnt <= 32'h0;
        AESL_ready_p1 <= 1'b0;
        AESL_start_p1 <= 1'b0;
    end
    else begin
        clk_cnt <= clk_cnt + 1;
        AESL_ready_p1 <= AESL_ready;
        AESL_start_p1 <= AESL_start;
    end
end

reg [31:0] start_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] start_cnt;
reg [31:0] ready_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] ap_ready_cnt;
reg [31:0] finish_timestamp [0:AUTOTB_TRANSACTION_NUM - 1];
reg [31:0] finish_cnt;
reg [31:0] lat_total;
event report_progress;

always @(posedge AESL_clock)
begin
    if (finish_cnt == AUTOTB_TRANSACTION_NUM - 1 && AESL_done == 1'b1)
        lat_total = clk_cnt - start_timestamp[0];
end

initial begin
    start_cnt = 0;
    finish_cnt = 0;
    ap_ready_cnt = 0;
    wait (AESL_reset == 1);
    wait_start();
    start_timestamp[start_cnt] = clk_cnt;
    start_cnt = start_cnt + 1;
    if (AESL_done) begin
        finish_timestamp[finish_cnt] = clk_cnt;
        finish_cnt = finish_cnt + 1;
    end
    -> report_progress;
    forever begin
        @ (posedge AESL_clock);
        if (start_cnt < AUTOTB_TRANSACTION_NUM) begin
            if ((AESL_start && AESL_ready_p1)||(AESL_start && ~AESL_start_p1)) begin
                start_timestamp[start_cnt] = clk_cnt;
                start_cnt = start_cnt + 1;
            end
        end
        if (ap_ready_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_start_p1 && AESL_ready_p1) begin
                ready_timestamp[ap_ready_cnt] = clk_cnt;
                ap_ready_cnt = ap_ready_cnt + 1;
            end
        end
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                finish_timestamp[finish_cnt] = clk_cnt;
                finish_cnt = finish_cnt + 1;
            end
        end
        -> report_progress;
    end
end

reg [31:0] progress_timeout;

initial begin : simulation_progress
    real intra_progress;
    wait (AESL_reset == 1);
    progress_timeout = PROGRESS_TIMEOUT;
    $display("////////////////////////////////////////////////////////////////////////////////////");
    $display("// Inter-Transaction Progress: Completed Transaction / Total Transaction");
    $display("// Intra-Transaction Progress: Measured Latency / Latency Estimation * 100%%");
    $display("//");
    $display("// RTL Simulation : \"Inter-Transaction Progress\" [\"Intra-Transaction Progress\"] @ \"Simulation Time\"");
    $display("////////////////////////////////////////////////////////////////////////////////////");
    print_progress();
    while (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
        @ (report_progress);
        if (finish_cnt < AUTOTB_TRANSACTION_NUM) begin
            if (AESL_done) begin
                print_progress();
                progress_timeout = PROGRESS_TIMEOUT;
            end else begin
                if (progress_timeout == 0) begin
                    print_progress();
                    progress_timeout = PROGRESS_TIMEOUT;
                end else begin
                    progress_timeout = progress_timeout - 1;
                end
            end
        end
    end
    print_progress();
    $display("////////////////////////////////////////////////////////////////////////////////////");
    calculate_performance();
end

task get_intra_progress(output real intra_progress);
    begin
        if (start_cnt > finish_cnt) begin
            intra_progress = clk_cnt - start_timestamp[finish_cnt];
        end else if(finish_cnt > 0) begin
            intra_progress = LATENCY_ESTIMATION;
        end else begin
            intra_progress = 0;
        end
        intra_progress = intra_progress / LATENCY_ESTIMATION;
    end
endtask

task print_progress();
    real intra_progress;
    begin
        if (LATENCY_ESTIMATION > 0) begin
            get_intra_progress(intra_progress);
            $display("// RTL Simulation : %0d / %0d [%2.2f%%] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, intra_progress * 100, $time);
        end else begin
            $display("// RTL Simulation : %0d / %0d [n/a] @ \"%0t\"", finish_cnt, AUTOTB_TRANSACTION_NUM, $time);
        end
    end
endtask

task calculate_performance();
    integer i;
    integer fp;
    reg [31:0] latency [0:AUTOTB_TRANSACTION_NUM - 1];
    reg [31:0] latency_min;
    reg [31:0] latency_max;
    reg [31:0] latency_total;
    reg [31:0] latency_average;
    reg [31:0] interval [0:AUTOTB_TRANSACTION_NUM - 2];
    reg [31:0] interval_min;
    reg [31:0] interval_max;
    reg [31:0] interval_total;
    reg [31:0] interval_average;
    reg [31:0] total_execute_time;
    begin
        latency_min = -1;
        latency_max = 0;
        latency_total = 0;
        interval_min = -1;
        interval_max = 0;
        interval_total = 0;
        total_execute_time = lat_total;

        for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
            // calculate latency
            latency[i] = finish_timestamp[i] - start_timestamp[i];
            if (latency[i] > latency_max) latency_max = latency[i];
            if (latency[i] < latency_min) latency_min = latency[i];
            latency_total = latency_total + latency[i];
            // calculate interval
            if (AUTOTB_TRANSACTION_NUM == 1) begin
                interval[i] = 0;
                interval_max = 0;
                interval_min = 0;
                interval_total = 0;
            end else if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                interval[i] = start_timestamp[i + 1] - start_timestamp[i];
                if (interval[i] > interval_max) interval_max = interval[i];
                if (interval[i] < interval_min) interval_min = interval[i];
                interval_total = interval_total + interval[i];
            end
        end

        latency_average = latency_total / AUTOTB_TRANSACTION_NUM;
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            interval_average = 0;
        end else begin
            interval_average = interval_total / (AUTOTB_TRANSACTION_NUM - 1);
        end

        fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");

        $fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latency_max);
        $fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latency_min);
        $fdisplay(fp, "$AVER_LATENCY = \"%0d\"", latency_average);
        $fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", interval_max);
        $fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", interval_min);
        $fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", interval_average);
        $fdisplay(fp, "$TOTAL_EXECUTE_TIME = \"%0d\"", total_execute_time);

        $fclose(fp);

        fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");

        $fdisplay(fp, "%20s%16s%16s", "", "latency", "interval");
        if (AUTOTB_TRANSACTION_NUM == 1) begin
            i = 0;
            $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
        end else begin
            for (i = 0; i < AUTOTB_TRANSACTION_NUM; i = i + 1) begin
                if (i < AUTOTB_TRANSACTION_NUM - 1) begin
                    $fdisplay(fp, "transaction%8d:%16d%16d", i, latency[i], interval[i]);
                end else begin
                    $fdisplay(fp, "transaction%8d:%16d               x", i, latency[i]);
                end
            end
        end

        $fclose(fp);
    end
endtask


////////////////////////////////////////////
// Dependence Check
////////////////////////////////////////////

`ifndef POST_SYN

`endif

AESL_deadlock_detector deadlock_detector(
    .reset(AESL_reset),
    .all_finish(all_finish),
    .clock(AESL_clock));

///////////////////////////////////////////////////////
// dataflow status monitor
///////////////////////////////////////////////////////
dataflow_monitor U_dataflow_monitor(
    .clock(AESL_clock),
    .reset(~rst),
    .finish(all_finish));

`include "fifo_para.vh"

endmodule
