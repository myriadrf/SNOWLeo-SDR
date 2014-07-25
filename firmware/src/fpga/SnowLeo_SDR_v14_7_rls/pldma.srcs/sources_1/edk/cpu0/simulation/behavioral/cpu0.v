//-----------------------------------------------------------------------------
// cpu0.v
//-----------------------------------------------------------------------------

`timescale 1 ps / 100 fs

`uselib lib=unisims_ver

module cpu0
  (
    processing_system7_0_MIO,
    processing_system7_0_PS_SRSTB_pin,
    processing_system7_0_PS_CLK_pin,
    processing_system7_0_PS_PORB_pin,
    processing_system7_0_DDR_Clk,
    processing_system7_0_DDR_Clk_n,
    processing_system7_0_DDR_CKE,
    processing_system7_0_DDR_CS_n,
    processing_system7_0_DDR_RAS_n,
    processing_system7_0_DDR_CAS_n,
    processing_system7_0_DDR_WEB_pin,
    processing_system7_0_DDR_BankAddr,
    processing_system7_0_DDR_Addr,
    processing_system7_0_DDR_ODT,
    processing_system7_0_DDR_DRSTB,
    processing_system7_0_DDR_DQ,
    processing_system7_0_DDR_DM,
    processing_system7_0_DDR_DQS,
    processing_system7_0_DDR_DQS_n,
    processing_system7_0_DDR_VRN,
    processing_system7_0_DDR_VRP,
    pldma_0_u_debug_pin,
    pldma_0_wr_clk_pin,
    pldma_0_data_wr_pin,
    pldma_0_wr_en_pin,
    pldma_0_afull_pin,
    pldma_0_rst_pin,
    pldma_mrd_0_u_debug_pin,
    pldma_mrd_0_rd_clk_pin,
    pldma_mrd_0_data_rd_pin,
    pldma_mrd_0_rd_en_pin,
    pldma_mrd_0_rd_fifo_cnt_pin,
    pldma_mrd_0_aempty_pin,
    pldma_mrd_0_rst_pin,
    mstclk_0,
    pldma_mwr_0_u_ctrl0_pin,
    pldma_mwr_0_u_ctrl1_pin,
    SPI0_SS_O_pin,
    SPI0_MOSI_O_pin,
    SPI0_MISO_I_pin,
    SPI0_SCLK_O_pin,
    axi_hdmi_tx_16b_0_hdmi_data_pin,
    axi_hdmi_tx_16b_0_hdmi_clk_pin,
    axi_hdmi_tx_16b_0_hdmi_vsync_pin,
    axi_hdmi_tx_16b_0_hdmi_hsync_pin,
    axi_hdmi_tx_16b_0_hdmi_data_e_pin,
    processing_system7_0_I2C1_SDA,
    processing_system7_0_I2C1_SCL
  );
  inout [53:0] processing_system7_0_MIO;
  input processing_system7_0_PS_SRSTB_pin;
  input processing_system7_0_PS_CLK_pin;
  input processing_system7_0_PS_PORB_pin;
  inout processing_system7_0_DDR_Clk;
  inout processing_system7_0_DDR_Clk_n;
  inout processing_system7_0_DDR_CKE;
  inout processing_system7_0_DDR_CS_n;
  inout processing_system7_0_DDR_RAS_n;
  inout processing_system7_0_DDR_CAS_n;
  output processing_system7_0_DDR_WEB_pin;
  inout [2:0] processing_system7_0_DDR_BankAddr;
  inout [14:0] processing_system7_0_DDR_Addr;
  inout processing_system7_0_DDR_ODT;
  inout processing_system7_0_DDR_DRSTB;
  inout [31:0] processing_system7_0_DDR_DQ;
  inout [3:0] processing_system7_0_DDR_DM;
  inout [3:0] processing_system7_0_DDR_DQS;
  inout [3:0] processing_system7_0_DDR_DQS_n;
  inout processing_system7_0_DDR_VRN;
  inout processing_system7_0_DDR_VRP;
  output [139:0] pldma_0_u_debug_pin;
  input pldma_0_wr_clk_pin;
  input [31:0] pldma_0_data_wr_pin;
  input pldma_0_wr_en_pin;
  output pldma_0_afull_pin;
  output pldma_0_rst_pin;
  output [139:0] pldma_mrd_0_u_debug_pin;
  input pldma_mrd_0_rd_clk_pin;
  output [31:0] pldma_mrd_0_data_rd_pin;
  input pldma_mrd_0_rd_en_pin;
  output [14:0] pldma_mrd_0_rd_fifo_cnt_pin;
  output pldma_mrd_0_aempty_pin;
  output pldma_mrd_0_rst_pin;
  output mstclk_0;
  output [31:0] pldma_mwr_0_u_ctrl0_pin;
  output [31:0] pldma_mwr_0_u_ctrl1_pin;
  output SPI0_SS_O_pin;
  output SPI0_MOSI_O_pin;
  input SPI0_MISO_I_pin;
  output SPI0_SCLK_O_pin;
  output [15:0] axi_hdmi_tx_16b_0_hdmi_data_pin;
  output axi_hdmi_tx_16b_0_hdmi_clk_pin;
  output axi_hdmi_tx_16b_0_hdmi_vsync_pin;
  output axi_hdmi_tx_16b_0_hdmi_hsync_pin;
  output axi_hdmi_tx_16b_0_hdmi_data_e_pin;
  inout processing_system7_0_I2C1_SDA;
  inout processing_system7_0_I2C1_SCL;

  // Internal signals

  wire [127:0] axi_gp0_M_ARADDR;
  wire [3:0] axi_gp0_M_ARESETN;
  wire [3:0] axi_gp0_M_ARREADY;
  wire [3:0] axi_gp0_M_ARVALID;
  wire [127:0] axi_gp0_M_AWADDR;
  wire [3:0] axi_gp0_M_AWREADY;
  wire [3:0] axi_gp0_M_AWVALID;
  wire [3:0] axi_gp0_M_BREADY;
  wire [7:0] axi_gp0_M_BRESP;
  wire [3:0] axi_gp0_M_BVALID;
  wire [127:0] axi_gp0_M_RDATA;
  wire [3:0] axi_gp0_M_RREADY;
  wire [7:0] axi_gp0_M_RRESP;
  wire [3:0] axi_gp0_M_RVALID;
  wire [127:0] axi_gp0_M_WDATA;
  wire [3:0] axi_gp0_M_WREADY;
  wire [15:0] axi_gp0_M_WSTRB;
  wire [3:0] axi_gp0_M_WVALID;
  wire [31:0] axi_gp0_S_ARADDR;
  wire [1:0] axi_gp0_S_ARBURST;
  wire [3:0] axi_gp0_S_ARCACHE;
  wire [11:0] axi_gp0_S_ARID;
  wire [7:0] axi_gp0_S_ARLEN;
  wire [1:0] axi_gp0_S_ARLOCK;
  wire [2:0] axi_gp0_S_ARPROT;
  wire [3:0] axi_gp0_S_ARQOS;
  wire [0:0] axi_gp0_S_ARREADY;
  wire [2:0] axi_gp0_S_ARSIZE;
  wire [0:0] axi_gp0_S_ARVALID;
  wire [31:0] axi_gp0_S_AWADDR;
  wire [1:0] axi_gp0_S_AWBURST;
  wire [3:0] axi_gp0_S_AWCACHE;
  wire [11:0] axi_gp0_S_AWID;
  wire [7:0] axi_gp0_S_AWLEN;
  wire [1:0] axi_gp0_S_AWLOCK;
  wire [2:0] axi_gp0_S_AWPROT;
  wire [3:0] axi_gp0_S_AWQOS;
  wire [0:0] axi_gp0_S_AWREADY;
  wire [2:0] axi_gp0_S_AWSIZE;
  wire [0:0] axi_gp0_S_AWVALID;
  wire [11:0] axi_gp0_S_BID;
  wire [0:0] axi_gp0_S_BREADY;
  wire [1:0] axi_gp0_S_BRESP;
  wire [0:0] axi_gp0_S_BVALID;
  wire [31:0] axi_gp0_S_RDATA;
  wire [11:0] axi_gp0_S_RID;
  wire [0:0] axi_gp0_S_RLAST;
  wire [0:0] axi_gp0_S_RREADY;
  wire [1:0] axi_gp0_S_RRESP;
  wire [0:0] axi_gp0_S_RVALID;
  wire [31:0] axi_gp0_S_WDATA;
  wire [11:0] axi_gp0_S_WID;
  wire [0:0] axi_gp0_S_WLAST;
  wire [0:0] axi_gp0_S_WREADY;
  wire [3:0] axi_gp0_S_WSTRB;
  wire [0:0] axi_gp0_S_WVALID;
  wire axi_hdmi_out_vdma_fs;
  wire axi_hdmi_tx_16b_0_hdmi_clk;
  wire [15:0] axi_hdmi_tx_16b_0_hdmi_data;
  wire axi_hdmi_tx_16b_0_hdmi_data_e;
  wire axi_hdmi_tx_16b_0_hdmi_hsync;
  wire axi_hdmi_tx_16b_0_hdmi_vsync;
  wire [31:0] axi_hp0_M_ARADDR;
  wire [1:0] axi_hp0_M_ARBURST;
  wire [3:0] axi_hp0_M_ARCACHE;
  wire [0:0] axi_hp0_M_ARID;
  wire [7:0] axi_hp0_M_ARLEN;
  wire [1:0] axi_hp0_M_ARLOCK;
  wire [2:0] axi_hp0_M_ARPROT;
  wire [3:0] axi_hp0_M_ARQOS;
  wire [0:0] axi_hp0_M_ARREADY;
  wire [2:0] axi_hp0_M_ARSIZE;
  wire [0:0] axi_hp0_M_ARVALID;
  wire [31:0] axi_hp0_M_AWADDR;
  wire [1:0] axi_hp0_M_AWBURST;
  wire [3:0] axi_hp0_M_AWCACHE;
  wire [0:0] axi_hp0_M_AWID;
  wire [7:0] axi_hp0_M_AWLEN;
  wire [1:0] axi_hp0_M_AWLOCK;
  wire [2:0] axi_hp0_M_AWPROT;
  wire [3:0] axi_hp0_M_AWQOS;
  wire [0:0] axi_hp0_M_AWREADY;
  wire [2:0] axi_hp0_M_AWSIZE;
  wire [0:0] axi_hp0_M_AWVALID;
  wire [0:0] axi_hp0_M_BID;
  wire [0:0] axi_hp0_M_BREADY;
  wire [1:0] axi_hp0_M_BRESP;
  wire [0:0] axi_hp0_M_BVALID;
  wire [63:0] axi_hp0_M_RDATA;
  wire [0:0] axi_hp0_M_RID;
  wire [0:0] axi_hp0_M_RLAST;
  wire [0:0] axi_hp0_M_RREADY;
  wire [1:0] axi_hp0_M_RRESP;
  wire [0:0] axi_hp0_M_RVALID;
  wire [63:0] axi_hp0_M_WDATA;
  wire [0:0] axi_hp0_M_WID;
  wire [0:0] axi_hp0_M_WLAST;
  wire [0:0] axi_hp0_M_WREADY;
  wire [7:0] axi_hp0_M_WSTRB;
  wire [0:0] axi_hp0_M_WVALID;
  wire [63:0] axi_hp0_S_ARADDR;
  wire [3:0] axi_hp0_S_ARBURST;
  wire [7:0] axi_hp0_S_ARCACHE;
  wire [1:0] axi_hp0_S_ARESETN;
  wire [15:0] axi_hp0_S_ARLEN;
  wire [5:0] axi_hp0_S_ARPROT;
  wire [1:0] axi_hp0_S_ARREADY;
  wire [5:0] axi_hp0_S_ARSIZE;
  wire [1:0] axi_hp0_S_ARVALID;
  wire [63:0] axi_hp0_S_AWADDR;
  wire [3:0] axi_hp0_S_AWBURST;
  wire [7:0] axi_hp0_S_AWCACHE;
  wire [15:0] axi_hp0_S_AWLEN;
  wire [5:0] axi_hp0_S_AWPROT;
  wire [1:0] axi_hp0_S_AWREADY;
  wire [5:0] axi_hp0_S_AWSIZE;
  wire [1:0] axi_hp0_S_AWVALID;
  wire [1:0] axi_hp0_S_BREADY;
  wire [3:0] axi_hp0_S_BRESP;
  wire [1:0] axi_hp0_S_BVALID;
  wire [127:0] axi_hp0_S_RDATA;
  wire [1:0] axi_hp0_S_RLAST;
  wire [1:0] axi_hp0_S_RREADY;
  wire [3:0] axi_hp0_S_RRESP;
  wire [1:0] axi_hp0_S_RVALID;
  wire [127:0] axi_hp0_S_WDATA;
  wire [1:0] axi_hp0_S_WLAST;
  wire [1:0] axi_hp0_S_WREADY;
  wire [15:0] axi_hp0_S_WSTRB;
  wire [1:0] axi_hp0_S_WVALID;
  wire [31:0] axi_hp2_M_ARADDR;
  wire [1:0] axi_hp2_M_ARBURST;
  wire [3:0] axi_hp2_M_ARCACHE;
  wire [0:0] axi_hp2_M_ARID;
  wire [7:0] axi_hp2_M_ARLEN;
  wire [1:0] axi_hp2_M_ARLOCK;
  wire [2:0] axi_hp2_M_ARPROT;
  wire [3:0] axi_hp2_M_ARQOS;
  wire [0:0] axi_hp2_M_ARREADY;
  wire [2:0] axi_hp2_M_ARSIZE;
  wire [0:0] axi_hp2_M_ARVALID;
  wire [31:0] axi_hp2_M_AWADDR;
  wire [1:0] axi_hp2_M_AWBURST;
  wire [3:0] axi_hp2_M_AWCACHE;
  wire [0:0] axi_hp2_M_AWID;
  wire [7:0] axi_hp2_M_AWLEN;
  wire [1:0] axi_hp2_M_AWLOCK;
  wire [2:0] axi_hp2_M_AWPROT;
  wire [3:0] axi_hp2_M_AWQOS;
  wire [0:0] axi_hp2_M_AWREADY;
  wire [2:0] axi_hp2_M_AWSIZE;
  wire [0:0] axi_hp2_M_AWVALID;
  wire [0:0] axi_hp2_M_BID;
  wire [0:0] axi_hp2_M_BREADY;
  wire [1:0] axi_hp2_M_BRESP;
  wire [0:0] axi_hp2_M_BVALID;
  wire [63:0] axi_hp2_M_RDATA;
  wire [0:0] axi_hp2_M_RID;
  wire [0:0] axi_hp2_M_RLAST;
  wire [0:0] axi_hp2_M_RREADY;
  wire [1:0] axi_hp2_M_RRESP;
  wire [0:0] axi_hp2_M_RVALID;
  wire [63:0] axi_hp2_M_WDATA;
  wire [0:0] axi_hp2_M_WID;
  wire [0:0] axi_hp2_M_WLAST;
  wire [0:0] axi_hp2_M_WREADY;
  wire [7:0] axi_hp2_M_WSTRB;
  wire [0:0] axi_hp2_M_WVALID;
  wire [31:0] axi_hp2_S_ARADDR;
  wire [1:0] axi_hp2_S_ARBURST;
  wire [3:0] axi_hp2_S_ARCACHE;
  wire [7:0] axi_hp2_S_ARLEN;
  wire [2:0] axi_hp2_S_ARPROT;
  wire [0:0] axi_hp2_S_ARREADY;
  wire [2:0] axi_hp2_S_ARSIZE;
  wire [0:0] axi_hp2_S_ARVALID;
  wire [63:0] axi_hp2_S_RDATA;
  wire [0:0] axi_hp2_S_RLAST;
  wire [0:0] axi_hp2_S_RREADY;
  wire [1:0] axi_hp2_S_RRESP;
  wire [0:0] axi_hp2_S_RVALID;
  wire [63:0] axi_vdma_0_M_AXIS_MM2S_TDATA;
  wire [7:0] axi_vdma_0_M_AXIS_MM2S_TKEEP;
  wire axi_vdma_0_M_AXIS_MM2S_TLAST;
  wire axi_vdma_0_M_AXIS_MM2S_TREADY;
  wire axi_vdma_0_M_AXIS_MM2S_TVALID;
  wire axi_vdma_0_mm2s_buffer_almost_empty;
  wire axi_vdma_0_mm2s_buffer_empty;
  wire axi_vdma_0_mm2s_fsync_out;
  wire [0:0] axi_vdma_0_mm2s_introut;
  wire [0:0] clk150mhz;
  wire net_gnd0;
  wire [0:0] net_gnd1;
  wire [1:0] net_gnd2;
  wire [2:0] net_gnd3;
  wire [3:0] net_gnd4;
  wire [4:0] net_gnd5;
  wire [5:0] net_gnd6;
  wire [7:0] net_gnd8;
  wire [11:0] net_gnd12;
  wire [31:0] net_gnd32;
  wire [47:0] net_gnd48;
  wire [63:0] net_gnd64;
  wire net_vcc0;
  wire [3:0] net_vcc4;
  wire pgassign1;
  wire [3:0] pgassign2;
  wire [1:0] pgassign3;
  wire pldma_0_afull;
  wire [31:0] pldma_0_data_wr;
  wire pldma_0_rst;
  wire [139:0] pldma_0_u_debug;
  wire pldma_0_wr_clk;
  wire pldma_0_wr_en;
  wire pldma_mrd_0_aempty;
  wire [31:0] pldma_mrd_0_data_rd;
  wire pldma_mrd_0_rd_clk;
  wire pldma_mrd_0_rd_en;
  wire [14:0] pldma_mrd_0_rd_fifo_cnt;
  wire pldma_mrd_0_rst;
  wire [139:0] pldma_mrd_0_u_debug;
  wire [31:0] pldma_mwr_0_u_ctrl0;
  wire [31:0] pldma_mwr_0_u_ctrl1;
  wire processing_system7_0_DDR_WEB;
  wire [0:0] processing_system7_0_FCLK_CLK0;
  wire [0:0] processing_system7_0_FCLK_CLK2;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_I2C1_SCL_I;
  wire processing_system7_0_I2C1_SCL_O;
  wire processing_system7_0_I2C1_SCL_T;
  wire processing_system7_0_I2C1_SDA_I;
  wire processing_system7_0_I2C1_SDA_O;
  wire processing_system7_0_I2C1_SDA_T;
  wire processing_system7_0_PS_CLK;
  wire processing_system7_0_PS_PORB;
  wire processing_system7_0_PS_SRSTB;
  wire processing_system7_0_SPI0_MISO_I;
  wire processing_system7_0_SPI0_MOSI_O;
  wire processing_system7_0_SPI0_SCLK_O;
  wire processing_system7_0_SPI0_SS_O;
  wire [0:0] sys_reset_n_Interconnect_aresetn;

  // Internal assignments

  assign processing_system7_0_PS_SRSTB = processing_system7_0_PS_SRSTB_pin;
  assign processing_system7_0_PS_CLK = processing_system7_0_PS_CLK_pin;
  assign processing_system7_0_PS_PORB = processing_system7_0_PS_PORB_pin;
  assign processing_system7_0_DDR_WEB_pin = processing_system7_0_DDR_WEB;
  assign pldma_0_u_debug_pin = pldma_0_u_debug;
  assign pldma_0_wr_clk = pldma_0_wr_clk_pin;
  assign pldma_0_data_wr = pldma_0_data_wr_pin;
  assign pldma_0_wr_en = pldma_0_wr_en_pin;
  assign pldma_0_afull_pin = pldma_0_afull;
  assign pldma_0_rst_pin = pldma_0_rst;
  assign pldma_mrd_0_u_debug_pin = pldma_mrd_0_u_debug;
  assign pldma_mrd_0_rd_clk = pldma_mrd_0_rd_clk_pin;
  assign pldma_mrd_0_data_rd_pin = pldma_mrd_0_data_rd;
  assign pldma_mrd_0_rd_en = pldma_mrd_0_rd_en_pin;
  assign pldma_mrd_0_rd_fifo_cnt_pin = pldma_mrd_0_rd_fifo_cnt;
  assign pldma_mrd_0_aempty_pin = pldma_mrd_0_aempty;
  assign pldma_mrd_0_rst_pin = pldma_mrd_0_rst;
  assign mstclk_0 = processing_system7_0_FCLK_CLK0[0];
  assign pldma_mwr_0_u_ctrl0_pin = pldma_mwr_0_u_ctrl0;
  assign pldma_mwr_0_u_ctrl1_pin = pldma_mwr_0_u_ctrl1;
  assign SPI0_SS_O_pin = processing_system7_0_SPI0_SS_O;
  assign SPI0_MOSI_O_pin = processing_system7_0_SPI0_MOSI_O;
  assign processing_system7_0_SPI0_MISO_I = SPI0_MISO_I_pin;
  assign SPI0_SCLK_O_pin = processing_system7_0_SPI0_SCLK_O;
  assign axi_hdmi_tx_16b_0_hdmi_data_pin = axi_hdmi_tx_16b_0_hdmi_data;
  assign axi_hdmi_tx_16b_0_hdmi_clk_pin = axi_hdmi_tx_16b_0_hdmi_clk;
  assign axi_hdmi_tx_16b_0_hdmi_vsync_pin = axi_hdmi_tx_16b_0_hdmi_vsync;
  assign axi_hdmi_tx_16b_0_hdmi_hsync_pin = axi_hdmi_tx_16b_0_hdmi_hsync;
  assign axi_hdmi_tx_16b_0_hdmi_data_e_pin = axi_hdmi_tx_16b_0_hdmi_data_e;
  assign pgassign1 = 1'b1;
  assign pgassign2[3:3] = processing_system7_0_FCLK_CLK2[0:0];
  assign pgassign2[2:2] = processing_system7_0_FCLK_CLK2[0:0];
  assign pgassign2[1:1] = processing_system7_0_FCLK_CLK2[0:0];
  assign pgassign2[0:0] = processing_system7_0_FCLK_CLK2[0:0];
  assign pgassign3[1:1] = processing_system7_0_FCLK_CLK0[0:0];
  assign pgassign3[0:0] = processing_system7_0_FCLK_CLK0[0:0];
  assign net_gnd0 = 1'b0;
  assign net_gnd1[0:0] = 1'b0;
  assign net_gnd12[11:0] = 12'b000000000000;
  assign net_gnd2[1:0] = 2'b00;
  assign net_gnd3[2:0] = 3'b000;
  assign net_gnd32[31:0] = 32'b00000000000000000000000000000000;
  assign net_gnd4[3:0] = 4'b0000;
  assign net_gnd48[47:0] = 48'b000000000000000000000000000000000000000000000000;
  assign net_gnd5[4:0] = 5'b00000;
  assign net_gnd6[5:0] = 6'b000000;
  assign net_gnd64[63:0] = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  assign net_gnd8[7:0] = 8'b00000000;
  assign net_vcc0 = 1'b1;
  assign net_vcc4[3:0] = 4'b1111;

  cpu0_processing_system7_0_wrapper
    processing_system7_0 (
      .CAN0_PHY_TX (  ),
      .CAN0_PHY_RX ( net_gnd0 ),
      .CAN1_PHY_TX (  ),
      .CAN1_PHY_RX ( net_gnd0 ),
      .ENET0_GMII_TX_EN (  ),
      .ENET0_GMII_TX_ER (  ),
      .ENET0_MDIO_MDC (  ),
      .ENET0_MDIO_O (  ),
      .ENET0_MDIO_T (  ),
      .ENET0_PTP_DELAY_REQ_RX (  ),
      .ENET0_PTP_DELAY_REQ_TX (  ),
      .ENET0_PTP_PDELAY_REQ_RX (  ),
      .ENET0_PTP_PDELAY_REQ_TX (  ),
      .ENET0_PTP_PDELAY_RESP_RX (  ),
      .ENET0_PTP_PDELAY_RESP_TX (  ),
      .ENET0_PTP_SYNC_FRAME_RX (  ),
      .ENET0_PTP_SYNC_FRAME_TX (  ),
      .ENET0_SOF_RX (  ),
      .ENET0_SOF_TX (  ),
      .ENET0_GMII_TXD (  ),
      .ENET0_GMII_COL ( net_gnd0 ),
      .ENET0_GMII_CRS ( net_gnd0 ),
      .ENET0_EXT_INTIN ( net_gnd0 ),
      .ENET0_GMII_RX_CLK ( net_gnd0 ),
      .ENET0_GMII_RX_DV ( net_gnd0 ),
      .ENET0_GMII_RX_ER ( net_gnd0 ),
      .ENET0_GMII_TX_CLK ( net_gnd0 ),
      .ENET0_MDIO_I ( net_gnd0 ),
      .ENET0_GMII_RXD ( net_gnd8 ),
      .ENET1_GMII_TX_EN (  ),
      .ENET1_GMII_TX_ER (  ),
      .ENET1_MDIO_MDC (  ),
      .ENET1_MDIO_O (  ),
      .ENET1_MDIO_T (  ),
      .ENET1_PTP_DELAY_REQ_RX (  ),
      .ENET1_PTP_DELAY_REQ_TX (  ),
      .ENET1_PTP_PDELAY_REQ_RX (  ),
      .ENET1_PTP_PDELAY_REQ_TX (  ),
      .ENET1_PTP_PDELAY_RESP_RX (  ),
      .ENET1_PTP_PDELAY_RESP_TX (  ),
      .ENET1_PTP_SYNC_FRAME_RX (  ),
      .ENET1_PTP_SYNC_FRAME_TX (  ),
      .ENET1_SOF_RX (  ),
      .ENET1_SOF_TX (  ),
      .ENET1_GMII_TXD (  ),
      .ENET1_GMII_COL ( net_gnd0 ),
      .ENET1_GMII_CRS ( net_gnd0 ),
      .ENET1_EXT_INTIN ( net_gnd0 ),
      .ENET1_GMII_RX_CLK ( net_gnd0 ),
      .ENET1_GMII_RX_DV ( net_gnd0 ),
      .ENET1_GMII_RX_ER ( net_gnd0 ),
      .ENET1_GMII_TX_CLK ( net_gnd0 ),
      .ENET1_MDIO_I ( net_gnd0 ),
      .ENET1_GMII_RXD ( net_gnd8 ),
      .GPIO_I ( net_gnd1[0:0] ),
      .GPIO_O (  ),
      .GPIO_T (  ),
      .I2C0_SDA_I ( net_gnd0 ),
      .I2C0_SDA_O (  ),
      .I2C0_SDA_T (  ),
      .I2C0_SCL_I ( net_gnd0 ),
      .I2C0_SCL_O (  ),
      .I2C0_SCL_T (  ),
      .I2C1_SDA_I ( processing_system7_0_I2C1_SDA_I ),
      .I2C1_SDA_O ( processing_system7_0_I2C1_SDA_O ),
      .I2C1_SDA_T ( processing_system7_0_I2C1_SDA_T ),
      .I2C1_SCL_I ( processing_system7_0_I2C1_SCL_I ),
      .I2C1_SCL_O ( processing_system7_0_I2C1_SCL_O ),
      .I2C1_SCL_T ( processing_system7_0_I2C1_SCL_T ),
      .PJTAG_TCK ( net_gnd0 ),
      .PJTAG_TMS ( net_gnd0 ),
      .PJTAG_TD_I ( net_gnd0 ),
      .PJTAG_TD_T (  ),
      .PJTAG_TD_O (  ),
      .SDIO0_CLK (  ),
      .SDIO0_CLK_FB ( net_gnd0 ),
      .SDIO0_CMD_O (  ),
      .SDIO0_CMD_I ( net_gnd0 ),
      .SDIO0_CMD_T (  ),
      .SDIO0_DATA_I ( net_gnd4 ),
      .SDIO0_DATA_O (  ),
      .SDIO0_DATA_T (  ),
      .SDIO0_LED (  ),
      .SDIO0_CDN ( net_gnd0 ),
      .SDIO0_WP ( net_gnd0 ),
      .SDIO0_BUSPOW (  ),
      .SDIO0_BUSVOLT (  ),
      .SDIO1_CLK (  ),
      .SDIO1_CLK_FB ( net_gnd0 ),
      .SDIO1_CMD_O (  ),
      .SDIO1_CMD_I ( net_gnd0 ),
      .SDIO1_CMD_T (  ),
      .SDIO1_DATA_I ( net_gnd4 ),
      .SDIO1_DATA_O (  ),
      .SDIO1_DATA_T (  ),
      .SDIO1_LED (  ),
      .SDIO1_CDN ( net_gnd0 ),
      .SDIO1_WP ( net_gnd0 ),
      .SDIO1_BUSPOW (  ),
      .SDIO1_BUSVOLT (  ),
      .SPI0_SCLK_I ( net_gnd0 ),
      .SPI0_SCLK_O ( processing_system7_0_SPI0_SCLK_O ),
      .SPI0_SCLK_T (  ),
      .SPI0_MOSI_I ( net_gnd0 ),
      .SPI0_MOSI_O ( processing_system7_0_SPI0_MOSI_O ),
      .SPI0_MOSI_T (  ),
      .SPI0_MISO_I ( processing_system7_0_SPI0_MISO_I ),
      .SPI0_MISO_O (  ),
      .SPI0_MISO_T (  ),
      .SPI0_SS_I ( net_vcc0 ),
      .SPI0_SS_O ( processing_system7_0_SPI0_SS_O ),
      .SPI0_SS1_O (  ),
      .SPI0_SS2_O (  ),
      .SPI0_SS_T (  ),
      .SPI1_SCLK_I ( net_gnd0 ),
      .SPI1_SCLK_O (  ),
      .SPI1_SCLK_T (  ),
      .SPI1_MOSI_I ( net_gnd0 ),
      .SPI1_MOSI_O (  ),
      .SPI1_MOSI_T (  ),
      .SPI1_MISO_I ( net_gnd0 ),
      .SPI1_MISO_O (  ),
      .SPI1_MISO_T (  ),
      .SPI1_SS_I ( net_gnd0 ),
      .SPI1_SS_O (  ),
      .SPI1_SS1_O (  ),
      .SPI1_SS2_O (  ),
      .SPI1_SS_T (  ),
      .UART0_DTRN (  ),
      .UART0_RTSN (  ),
      .UART0_TX (  ),
      .UART0_CTSN ( net_gnd0 ),
      .UART0_DCDN ( net_gnd0 ),
      .UART0_DSRN ( net_gnd0 ),
      .UART0_RIN ( net_gnd0 ),
      .UART0_RX ( net_gnd0 ),
      .UART1_DTRN (  ),
      .UART1_RTSN (  ),
      .UART1_TX (  ),
      .UART1_CTSN ( net_gnd0 ),
      .UART1_DCDN ( net_gnd0 ),
      .UART1_DSRN ( net_gnd0 ),
      .UART1_RIN ( net_gnd0 ),
      .UART1_RX ( net_gnd0 ),
      .TTC0_WAVE0_OUT (  ),
      .TTC0_WAVE1_OUT (  ),
      .TTC0_WAVE2_OUT (  ),
      .TTC0_CLK0_IN ( net_gnd0 ),
      .TTC0_CLK1_IN ( net_gnd0 ),
      .TTC0_CLK2_IN ( net_gnd0 ),
      .TTC1_WAVE0_OUT (  ),
      .TTC1_WAVE1_OUT (  ),
      .TTC1_WAVE2_OUT (  ),
      .TTC1_CLK0_IN ( net_gnd0 ),
      .TTC1_CLK1_IN ( net_gnd0 ),
      .TTC1_CLK2_IN ( net_gnd0 ),
      .WDT_CLK_IN ( net_gnd0 ),
      .WDT_RST_OUT (  ),
      .TRACE_CLK ( net_gnd0 ),
      .TRACE_CTL (  ),
      .TRACE_DATA (  ),
      .USB0_PORT_INDCTL (  ),
      .USB1_PORT_INDCTL (  ),
      .USB0_VBUS_PWRSELECT (  ),
      .USB1_VBUS_PWRSELECT (  ),
      .USB0_VBUS_PWRFAULT ( net_gnd0 ),
      .USB1_VBUS_PWRFAULT ( net_gnd0 ),
      .SRAM_INTIN ( net_gnd0 ),
      .M_AXI_GP0_ARESETN (  ),
      .M_AXI_GP0_ARVALID ( axi_gp0_S_ARVALID[0] ),
      .M_AXI_GP0_AWVALID ( axi_gp0_S_AWVALID[0] ),
      .M_AXI_GP0_BREADY ( axi_gp0_S_BREADY[0] ),
      .M_AXI_GP0_RREADY ( axi_gp0_S_RREADY[0] ),
      .M_AXI_GP0_WLAST ( axi_gp0_S_WLAST[0] ),
      .M_AXI_GP0_WVALID ( axi_gp0_S_WVALID[0] ),
      .M_AXI_GP0_ARID ( axi_gp0_S_ARID ),
      .M_AXI_GP0_AWID ( axi_gp0_S_AWID ),
      .M_AXI_GP0_WID ( axi_gp0_S_WID ),
      .M_AXI_GP0_ARBURST ( axi_gp0_S_ARBURST ),
      .M_AXI_GP0_ARLOCK ( axi_gp0_S_ARLOCK ),
      .M_AXI_GP0_ARSIZE ( axi_gp0_S_ARSIZE ),
      .M_AXI_GP0_AWBURST ( axi_gp0_S_AWBURST ),
      .M_AXI_GP0_AWLOCK ( axi_gp0_S_AWLOCK ),
      .M_AXI_GP0_AWSIZE ( axi_gp0_S_AWSIZE ),
      .M_AXI_GP0_ARPROT ( axi_gp0_S_ARPROT ),
      .M_AXI_GP0_AWPROT ( axi_gp0_S_AWPROT ),
      .M_AXI_GP0_ARADDR ( axi_gp0_S_ARADDR ),
      .M_AXI_GP0_AWADDR ( axi_gp0_S_AWADDR ),
      .M_AXI_GP0_WDATA ( axi_gp0_S_WDATA ),
      .M_AXI_GP0_ARCACHE ( axi_gp0_S_ARCACHE ),
      .M_AXI_GP0_ARLEN ( axi_gp0_S_ARLEN[3:0] ),
      .M_AXI_GP0_ARQOS ( axi_gp0_S_ARQOS ),
      .M_AXI_GP0_AWCACHE ( axi_gp0_S_AWCACHE ),
      .M_AXI_GP0_AWLEN ( axi_gp0_S_AWLEN[3:0] ),
      .M_AXI_GP0_AWQOS ( axi_gp0_S_AWQOS ),
      .M_AXI_GP0_WSTRB ( axi_gp0_S_WSTRB ),
      .M_AXI_GP0_ACLK ( processing_system7_0_FCLK_CLK2[0] ),
      .M_AXI_GP0_ARREADY ( axi_gp0_S_ARREADY[0] ),
      .M_AXI_GP0_AWREADY ( axi_gp0_S_AWREADY[0] ),
      .M_AXI_GP0_BVALID ( axi_gp0_S_BVALID[0] ),
      .M_AXI_GP0_RLAST ( axi_gp0_S_RLAST[0] ),
      .M_AXI_GP0_RVALID ( axi_gp0_S_RVALID[0] ),
      .M_AXI_GP0_WREADY ( axi_gp0_S_WREADY[0] ),
      .M_AXI_GP0_BID ( axi_gp0_S_BID ),
      .M_AXI_GP0_RID ( axi_gp0_S_RID ),
      .M_AXI_GP0_BRESP ( axi_gp0_S_BRESP ),
      .M_AXI_GP0_RRESP ( axi_gp0_S_RRESP ),
      .M_AXI_GP0_RDATA ( axi_gp0_S_RDATA ),
      .M_AXI_GP1_ARESETN (  ),
      .M_AXI_GP1_ARVALID (  ),
      .M_AXI_GP1_AWVALID (  ),
      .M_AXI_GP1_BREADY (  ),
      .M_AXI_GP1_RREADY (  ),
      .M_AXI_GP1_WLAST (  ),
      .M_AXI_GP1_WVALID (  ),
      .M_AXI_GP1_ARID (  ),
      .M_AXI_GP1_AWID (  ),
      .M_AXI_GP1_WID (  ),
      .M_AXI_GP1_ARBURST (  ),
      .M_AXI_GP1_ARLOCK (  ),
      .M_AXI_GP1_ARSIZE (  ),
      .M_AXI_GP1_AWBURST (  ),
      .M_AXI_GP1_AWLOCK (  ),
      .M_AXI_GP1_AWSIZE (  ),
      .M_AXI_GP1_ARPROT (  ),
      .M_AXI_GP1_AWPROT (  ),
      .M_AXI_GP1_ARADDR (  ),
      .M_AXI_GP1_AWADDR (  ),
      .M_AXI_GP1_WDATA (  ),
      .M_AXI_GP1_ARCACHE (  ),
      .M_AXI_GP1_ARLEN (  ),
      .M_AXI_GP1_ARQOS (  ),
      .M_AXI_GP1_AWCACHE (  ),
      .M_AXI_GP1_AWLEN (  ),
      .M_AXI_GP1_AWQOS (  ),
      .M_AXI_GP1_WSTRB (  ),
      .M_AXI_GP1_ACLK ( net_gnd0 ),
      .M_AXI_GP1_ARREADY ( net_gnd0 ),
      .M_AXI_GP1_AWREADY ( net_gnd0 ),
      .M_AXI_GP1_BVALID ( net_gnd0 ),
      .M_AXI_GP1_RLAST ( net_gnd0 ),
      .M_AXI_GP1_RVALID ( net_gnd0 ),
      .M_AXI_GP1_WREADY ( net_gnd0 ),
      .M_AXI_GP1_BID ( net_gnd12 ),
      .M_AXI_GP1_RID ( net_gnd12 ),
      .M_AXI_GP1_BRESP ( net_gnd2 ),
      .M_AXI_GP1_RRESP ( net_gnd2 ),
      .M_AXI_GP1_RDATA ( net_gnd32 ),
      .S_AXI_GP0_ARESETN (  ),
      .S_AXI_GP0_ARREADY (  ),
      .S_AXI_GP0_AWREADY (  ),
      .S_AXI_GP0_BVALID (  ),
      .S_AXI_GP0_RLAST (  ),
      .S_AXI_GP0_RVALID (  ),
      .S_AXI_GP0_WREADY (  ),
      .S_AXI_GP0_BRESP (  ),
      .S_AXI_GP0_RRESP (  ),
      .S_AXI_GP0_RDATA (  ),
      .S_AXI_GP0_BID (  ),
      .S_AXI_GP0_RID (  ),
      .S_AXI_GP0_ACLK ( net_gnd0 ),
      .S_AXI_GP0_ARVALID ( net_gnd0 ),
      .S_AXI_GP0_AWVALID ( net_gnd0 ),
      .S_AXI_GP0_BREADY ( net_gnd0 ),
      .S_AXI_GP0_RREADY ( net_gnd0 ),
      .S_AXI_GP0_WLAST ( net_gnd0 ),
      .S_AXI_GP0_WVALID ( net_gnd0 ),
      .S_AXI_GP0_ARBURST ( net_gnd2 ),
      .S_AXI_GP0_ARLOCK ( net_gnd2 ),
      .S_AXI_GP0_ARSIZE ( net_gnd3 ),
      .S_AXI_GP0_AWBURST ( net_gnd2 ),
      .S_AXI_GP0_AWLOCK ( net_gnd2 ),
      .S_AXI_GP0_AWSIZE ( net_gnd3 ),
      .S_AXI_GP0_ARPROT ( net_gnd3 ),
      .S_AXI_GP0_AWPROT ( net_gnd3 ),
      .S_AXI_GP0_ARADDR ( net_gnd32 ),
      .S_AXI_GP0_AWADDR ( net_gnd32 ),
      .S_AXI_GP0_WDATA ( net_gnd32 ),
      .S_AXI_GP0_ARCACHE ( net_gnd4 ),
      .S_AXI_GP0_ARLEN ( net_gnd4 ),
      .S_AXI_GP0_ARQOS ( net_gnd4 ),
      .S_AXI_GP0_AWCACHE ( net_gnd4 ),
      .S_AXI_GP0_AWLEN ( net_gnd4 ),
      .S_AXI_GP0_AWQOS ( net_gnd4 ),
      .S_AXI_GP0_WSTRB ( net_gnd4 ),
      .S_AXI_GP0_ARID ( net_gnd6 ),
      .S_AXI_GP0_AWID ( net_gnd6 ),
      .S_AXI_GP0_WID ( net_gnd6 ),
      .S_AXI_GP1_ARESETN (  ),
      .S_AXI_GP1_ARREADY (  ),
      .S_AXI_GP1_AWREADY (  ),
      .S_AXI_GP1_BVALID (  ),
      .S_AXI_GP1_RLAST (  ),
      .S_AXI_GP1_RVALID (  ),
      .S_AXI_GP1_WREADY (  ),
      .S_AXI_GP1_BRESP (  ),
      .S_AXI_GP1_RRESP (  ),
      .S_AXI_GP1_RDATA (  ),
      .S_AXI_GP1_BID (  ),
      .S_AXI_GP1_RID (  ),
      .S_AXI_GP1_ACLK ( net_gnd0 ),
      .S_AXI_GP1_ARVALID ( net_gnd0 ),
      .S_AXI_GP1_AWVALID ( net_gnd0 ),
      .S_AXI_GP1_BREADY ( net_gnd0 ),
      .S_AXI_GP1_RREADY ( net_gnd0 ),
      .S_AXI_GP1_WLAST ( net_gnd0 ),
      .S_AXI_GP1_WVALID ( net_gnd0 ),
      .S_AXI_GP1_ARBURST ( net_gnd2 ),
      .S_AXI_GP1_ARLOCK ( net_gnd2 ),
      .S_AXI_GP1_ARSIZE ( net_gnd3 ),
      .S_AXI_GP1_AWBURST ( net_gnd2 ),
      .S_AXI_GP1_AWLOCK ( net_gnd2 ),
      .S_AXI_GP1_AWSIZE ( net_gnd3 ),
      .S_AXI_GP1_ARPROT ( net_gnd3 ),
      .S_AXI_GP1_AWPROT ( net_gnd3 ),
      .S_AXI_GP1_ARADDR ( net_gnd32 ),
      .S_AXI_GP1_AWADDR ( net_gnd32 ),
      .S_AXI_GP1_WDATA ( net_gnd32 ),
      .S_AXI_GP1_ARCACHE ( net_gnd4 ),
      .S_AXI_GP1_ARLEN ( net_gnd4 ),
      .S_AXI_GP1_ARQOS ( net_gnd4 ),
      .S_AXI_GP1_AWCACHE ( net_gnd4 ),
      .S_AXI_GP1_AWLEN ( net_gnd4 ),
      .S_AXI_GP1_AWQOS ( net_gnd4 ),
      .S_AXI_GP1_WSTRB ( net_gnd4 ),
      .S_AXI_GP1_ARID ( net_gnd6 ),
      .S_AXI_GP1_AWID ( net_gnd6 ),
      .S_AXI_GP1_WID ( net_gnd6 ),
      .S_AXI_ACP_ARESETN (  ),
      .S_AXI_ACP_AWREADY (  ),
      .S_AXI_ACP_ARREADY (  ),
      .S_AXI_ACP_BVALID (  ),
      .S_AXI_ACP_RLAST (  ),
      .S_AXI_ACP_RVALID (  ),
      .S_AXI_ACP_WREADY (  ),
      .S_AXI_ACP_BRESP (  ),
      .S_AXI_ACP_RRESP (  ),
      .S_AXI_ACP_BID (  ),
      .S_AXI_ACP_RID (  ),
      .S_AXI_ACP_RDATA (  ),
      .S_AXI_ACP_ACLK ( net_gnd0 ),
      .S_AXI_ACP_ARVALID ( net_gnd0 ),
      .S_AXI_ACP_AWVALID ( net_gnd0 ),
      .S_AXI_ACP_BREADY ( net_gnd0 ),
      .S_AXI_ACP_RREADY ( net_gnd0 ),
      .S_AXI_ACP_WLAST ( net_gnd0 ),
      .S_AXI_ACP_WVALID ( net_gnd0 ),
      .S_AXI_ACP_ARID ( net_gnd3 ),
      .S_AXI_ACP_ARPROT ( net_gnd3 ),
      .S_AXI_ACP_AWID ( net_gnd3 ),
      .S_AXI_ACP_AWPROT ( net_gnd3 ),
      .S_AXI_ACP_WID ( net_gnd3 ),
      .S_AXI_ACP_ARADDR ( net_gnd32 ),
      .S_AXI_ACP_AWADDR ( net_gnd32 ),
      .S_AXI_ACP_ARCACHE ( net_gnd4 ),
      .S_AXI_ACP_ARLEN ( net_gnd4 ),
      .S_AXI_ACP_ARQOS ( net_gnd4 ),
      .S_AXI_ACP_AWCACHE ( net_gnd4 ),
      .S_AXI_ACP_AWLEN ( net_gnd4 ),
      .S_AXI_ACP_AWQOS ( net_gnd4 ),
      .S_AXI_ACP_ARBURST ( net_gnd2 ),
      .S_AXI_ACP_ARLOCK ( net_gnd2 ),
      .S_AXI_ACP_ARSIZE ( net_gnd3 ),
      .S_AXI_ACP_AWBURST ( net_gnd2 ),
      .S_AXI_ACP_AWLOCK ( net_gnd2 ),
      .S_AXI_ACP_AWSIZE ( net_gnd3 ),
      .S_AXI_ACP_ARUSER ( net_gnd5 ),
      .S_AXI_ACP_AWUSER ( net_gnd5 ),
      .S_AXI_ACP_WDATA ( net_gnd64 ),
      .S_AXI_ACP_WSTRB ( net_gnd8 ),
      .S_AXI_HP0_ARESETN (  ),
      .S_AXI_HP0_ARREADY ( axi_hp0_M_ARREADY[0] ),
      .S_AXI_HP0_AWREADY ( axi_hp0_M_AWREADY[0] ),
      .S_AXI_HP0_BVALID ( axi_hp0_M_BVALID[0] ),
      .S_AXI_HP0_RLAST ( axi_hp0_M_RLAST[0] ),
      .S_AXI_HP0_RVALID ( axi_hp0_M_RVALID[0] ),
      .S_AXI_HP0_WREADY ( axi_hp0_M_WREADY[0] ),
      .S_AXI_HP0_BRESP ( axi_hp0_M_BRESP ),
      .S_AXI_HP0_RRESP ( axi_hp0_M_RRESP ),
      .S_AXI_HP0_BID ( axi_hp0_M_BID[0:0] ),
      .S_AXI_HP0_RID ( axi_hp0_M_RID[0:0] ),
      .S_AXI_HP0_RDATA ( axi_hp0_M_RDATA ),
      .S_AXI_HP0_RCOUNT (  ),
      .S_AXI_HP0_WCOUNT (  ),
      .S_AXI_HP0_RACOUNT (  ),
      .S_AXI_HP0_WACOUNT (  ),
      .S_AXI_HP0_ACLK ( processing_system7_0_FCLK_CLK0[0] ),
      .S_AXI_HP0_ARVALID ( axi_hp0_M_ARVALID[0] ),
      .S_AXI_HP0_AWVALID ( axi_hp0_M_AWVALID[0] ),
      .S_AXI_HP0_BREADY ( axi_hp0_M_BREADY[0] ),
      .S_AXI_HP0_RDISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP0_RREADY ( axi_hp0_M_RREADY[0] ),
      .S_AXI_HP0_WLAST ( axi_hp0_M_WLAST[0] ),
      .S_AXI_HP0_WRISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP0_WVALID ( axi_hp0_M_WVALID[0] ),
      .S_AXI_HP0_ARBURST ( axi_hp0_M_ARBURST ),
      .S_AXI_HP0_ARLOCK ( axi_hp0_M_ARLOCK ),
      .S_AXI_HP0_ARSIZE ( axi_hp0_M_ARSIZE ),
      .S_AXI_HP0_AWBURST ( axi_hp0_M_AWBURST ),
      .S_AXI_HP0_AWLOCK ( axi_hp0_M_AWLOCK ),
      .S_AXI_HP0_AWSIZE ( axi_hp0_M_AWSIZE ),
      .S_AXI_HP0_ARPROT ( axi_hp0_M_ARPROT ),
      .S_AXI_HP0_AWPROT ( axi_hp0_M_AWPROT ),
      .S_AXI_HP0_ARADDR ( axi_hp0_M_ARADDR ),
      .S_AXI_HP0_AWADDR ( axi_hp0_M_AWADDR ),
      .S_AXI_HP0_ARCACHE ( axi_hp0_M_ARCACHE ),
      .S_AXI_HP0_ARLEN ( axi_hp0_M_ARLEN[3:0] ),
      .S_AXI_HP0_ARQOS ( axi_hp0_M_ARQOS ),
      .S_AXI_HP0_AWCACHE ( axi_hp0_M_AWCACHE ),
      .S_AXI_HP0_AWLEN ( axi_hp0_M_AWLEN[3:0] ),
      .S_AXI_HP0_AWQOS ( axi_hp0_M_AWQOS ),
      .S_AXI_HP0_ARID ( axi_hp0_M_ARID[0:0] ),
      .S_AXI_HP0_AWID ( axi_hp0_M_AWID[0:0] ),
      .S_AXI_HP0_WID ( axi_hp0_M_WID[0:0] ),
      .S_AXI_HP0_WDATA ( axi_hp0_M_WDATA ),
      .S_AXI_HP0_WSTRB ( axi_hp0_M_WSTRB ),
      .S_AXI_HP1_ARESETN (  ),
      .S_AXI_HP1_ARREADY (  ),
      .S_AXI_HP1_AWREADY (  ),
      .S_AXI_HP1_BVALID (  ),
      .S_AXI_HP1_RLAST (  ),
      .S_AXI_HP1_RVALID (  ),
      .S_AXI_HP1_WREADY (  ),
      .S_AXI_HP1_BRESP (  ),
      .S_AXI_HP1_RRESP (  ),
      .S_AXI_HP1_BID (  ),
      .S_AXI_HP1_RID (  ),
      .S_AXI_HP1_RDATA (  ),
      .S_AXI_HP1_RCOUNT (  ),
      .S_AXI_HP1_WCOUNT (  ),
      .S_AXI_HP1_RACOUNT (  ),
      .S_AXI_HP1_WACOUNT (  ),
      .S_AXI_HP1_ACLK ( net_gnd0 ),
      .S_AXI_HP1_ARVALID ( net_gnd0 ),
      .S_AXI_HP1_AWVALID ( net_gnd0 ),
      .S_AXI_HP1_BREADY ( net_gnd0 ),
      .S_AXI_HP1_RDISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP1_RREADY ( net_gnd0 ),
      .S_AXI_HP1_WLAST ( net_gnd0 ),
      .S_AXI_HP1_WRISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP1_WVALID ( net_gnd0 ),
      .S_AXI_HP1_ARBURST ( net_gnd2 ),
      .S_AXI_HP1_ARLOCK ( net_gnd2 ),
      .S_AXI_HP1_ARSIZE ( net_gnd3 ),
      .S_AXI_HP1_AWBURST ( net_gnd2 ),
      .S_AXI_HP1_AWLOCK ( net_gnd2 ),
      .S_AXI_HP1_AWSIZE ( net_gnd3 ),
      .S_AXI_HP1_ARPROT ( net_gnd3 ),
      .S_AXI_HP1_AWPROT ( net_gnd3 ),
      .S_AXI_HP1_ARADDR ( net_gnd32 ),
      .S_AXI_HP1_AWADDR ( net_gnd32 ),
      .S_AXI_HP1_ARCACHE ( net_gnd4 ),
      .S_AXI_HP1_ARLEN ( net_gnd4 ),
      .S_AXI_HP1_ARQOS ( net_gnd4 ),
      .S_AXI_HP1_AWCACHE ( net_gnd4 ),
      .S_AXI_HP1_AWLEN ( net_gnd4 ),
      .S_AXI_HP1_AWQOS ( net_gnd4 ),
      .S_AXI_HP1_ARID ( net_gnd6 ),
      .S_AXI_HP1_AWID ( net_gnd6 ),
      .S_AXI_HP1_WID ( net_gnd6 ),
      .S_AXI_HP1_WDATA ( net_gnd64 ),
      .S_AXI_HP1_WSTRB ( net_gnd8 ),
      .S_AXI_HP2_ARESETN (  ),
      .S_AXI_HP2_ARREADY ( axi_hp2_M_ARREADY[0] ),
      .S_AXI_HP2_AWREADY ( axi_hp2_M_AWREADY[0] ),
      .S_AXI_HP2_BVALID ( axi_hp2_M_BVALID[0] ),
      .S_AXI_HP2_RLAST ( axi_hp2_M_RLAST[0] ),
      .S_AXI_HP2_RVALID ( axi_hp2_M_RVALID[0] ),
      .S_AXI_HP2_WREADY ( axi_hp2_M_WREADY[0] ),
      .S_AXI_HP2_BRESP ( axi_hp2_M_BRESP ),
      .S_AXI_HP2_RRESP ( axi_hp2_M_RRESP ),
      .S_AXI_HP2_BID ( axi_hp2_M_BID[0:0] ),
      .S_AXI_HP2_RID ( axi_hp2_M_RID[0:0] ),
      .S_AXI_HP2_RDATA ( axi_hp2_M_RDATA ),
      .S_AXI_HP2_RCOUNT (  ),
      .S_AXI_HP2_WCOUNT (  ),
      .S_AXI_HP2_RACOUNT (  ),
      .S_AXI_HP2_WACOUNT (  ),
      .S_AXI_HP2_ACLK ( clk150mhz[0] ),
      .S_AXI_HP2_ARVALID ( axi_hp2_M_ARVALID[0] ),
      .S_AXI_HP2_AWVALID ( axi_hp2_M_AWVALID[0] ),
      .S_AXI_HP2_BREADY ( axi_hp2_M_BREADY[0] ),
      .S_AXI_HP2_RDISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP2_RREADY ( axi_hp2_M_RREADY[0] ),
      .S_AXI_HP2_WLAST ( axi_hp2_M_WLAST[0] ),
      .S_AXI_HP2_WRISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP2_WVALID ( axi_hp2_M_WVALID[0] ),
      .S_AXI_HP2_ARBURST ( axi_hp2_M_ARBURST ),
      .S_AXI_HP2_ARLOCK ( axi_hp2_M_ARLOCK ),
      .S_AXI_HP2_ARSIZE ( axi_hp2_M_ARSIZE ),
      .S_AXI_HP2_AWBURST ( axi_hp2_M_AWBURST ),
      .S_AXI_HP2_AWLOCK ( axi_hp2_M_AWLOCK ),
      .S_AXI_HP2_AWSIZE ( axi_hp2_M_AWSIZE ),
      .S_AXI_HP2_ARPROT ( axi_hp2_M_ARPROT ),
      .S_AXI_HP2_AWPROT ( axi_hp2_M_AWPROT ),
      .S_AXI_HP2_ARADDR ( axi_hp2_M_ARADDR ),
      .S_AXI_HP2_AWADDR ( axi_hp2_M_AWADDR ),
      .S_AXI_HP2_ARCACHE ( axi_hp2_M_ARCACHE ),
      .S_AXI_HP2_ARLEN ( axi_hp2_M_ARLEN[3:0] ),
      .S_AXI_HP2_ARQOS ( axi_hp2_M_ARQOS ),
      .S_AXI_HP2_AWCACHE ( axi_hp2_M_AWCACHE ),
      .S_AXI_HP2_AWLEN ( axi_hp2_M_AWLEN[3:0] ),
      .S_AXI_HP2_AWQOS ( axi_hp2_M_AWQOS ),
      .S_AXI_HP2_ARID ( axi_hp2_M_ARID[0:0] ),
      .S_AXI_HP2_AWID ( axi_hp2_M_AWID[0:0] ),
      .S_AXI_HP2_WID ( axi_hp2_M_WID[0:0] ),
      .S_AXI_HP2_WDATA ( axi_hp2_M_WDATA ),
      .S_AXI_HP2_WSTRB ( axi_hp2_M_WSTRB ),
      .S_AXI_HP3_ARESETN (  ),
      .S_AXI_HP3_ARREADY (  ),
      .S_AXI_HP3_AWREADY (  ),
      .S_AXI_HP3_BVALID (  ),
      .S_AXI_HP3_RLAST (  ),
      .S_AXI_HP3_RVALID (  ),
      .S_AXI_HP3_WREADY (  ),
      .S_AXI_HP3_BRESP (  ),
      .S_AXI_HP3_RRESP (  ),
      .S_AXI_HP3_BID (  ),
      .S_AXI_HP3_RID (  ),
      .S_AXI_HP3_RDATA (  ),
      .S_AXI_HP3_RCOUNT (  ),
      .S_AXI_HP3_WCOUNT (  ),
      .S_AXI_HP3_RACOUNT (  ),
      .S_AXI_HP3_WACOUNT (  ),
      .S_AXI_HP3_ACLK ( net_gnd0 ),
      .S_AXI_HP3_ARVALID ( net_gnd0 ),
      .S_AXI_HP3_AWVALID ( net_gnd0 ),
      .S_AXI_HP3_BREADY ( net_gnd0 ),
      .S_AXI_HP3_RDISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP3_RREADY ( net_gnd0 ),
      .S_AXI_HP3_WLAST ( net_gnd0 ),
      .S_AXI_HP3_WRISSUECAP1_EN ( net_gnd0 ),
      .S_AXI_HP3_WVALID ( net_gnd0 ),
      .S_AXI_HP3_ARBURST ( net_gnd2 ),
      .S_AXI_HP3_ARLOCK ( net_gnd2 ),
      .S_AXI_HP3_ARSIZE ( net_gnd3 ),
      .S_AXI_HP3_AWBURST ( net_gnd2 ),
      .S_AXI_HP3_AWLOCK ( net_gnd2 ),
      .S_AXI_HP3_AWSIZE ( net_gnd3 ),
      .S_AXI_HP3_ARPROT ( net_gnd3 ),
      .S_AXI_HP3_AWPROT ( net_gnd3 ),
      .S_AXI_HP3_ARADDR ( net_gnd32 ),
      .S_AXI_HP3_AWADDR ( net_gnd32 ),
      .S_AXI_HP3_ARCACHE ( net_gnd4 ),
      .S_AXI_HP3_ARLEN ( net_gnd4 ),
      .S_AXI_HP3_ARQOS ( net_gnd4 ),
      .S_AXI_HP3_AWCACHE ( net_gnd4 ),
      .S_AXI_HP3_AWLEN ( net_gnd4 ),
      .S_AXI_HP3_AWQOS ( net_gnd4 ),
      .S_AXI_HP3_ARID ( net_gnd6 ),
      .S_AXI_HP3_AWID ( net_gnd6 ),
      .S_AXI_HP3_WID ( net_gnd6 ),
      .S_AXI_HP3_WDATA ( net_gnd64 ),
      .S_AXI_HP3_WSTRB ( net_gnd8 ),
      .DMA0_DATYPE (  ),
      .DMA0_DAVALID (  ),
      .DMA0_DRREADY (  ),
      .DMA0_RSTN (  ),
      .DMA0_ACLK ( net_gnd0 ),
      .DMA0_DAREADY ( net_gnd0 ),
      .DMA0_DRLAST ( net_gnd0 ),
      .DMA0_DRVALID ( net_gnd0 ),
      .DMA0_DRTYPE ( net_gnd2 ),
      .DMA1_DATYPE (  ),
      .DMA1_DAVALID (  ),
      .DMA1_DRREADY (  ),
      .DMA1_RSTN (  ),
      .DMA1_ACLK ( net_gnd0 ),
      .DMA1_DAREADY ( net_gnd0 ),
      .DMA1_DRLAST ( net_gnd0 ),
      .DMA1_DRVALID ( net_gnd0 ),
      .DMA1_DRTYPE ( net_gnd2 ),
      .DMA2_DATYPE (  ),
      .DMA2_DAVALID (  ),
      .DMA2_DRREADY (  ),
      .DMA2_RSTN (  ),
      .DMA2_ACLK ( net_gnd0 ),
      .DMA2_DAREADY ( net_gnd0 ),
      .DMA2_DRLAST ( net_gnd0 ),
      .DMA2_DRVALID ( net_gnd0 ),
      .DMA3_DRVALID ( net_gnd0 ),
      .DMA3_DATYPE (  ),
      .DMA3_DAVALID (  ),
      .DMA3_DRREADY (  ),
      .DMA3_RSTN (  ),
      .DMA3_ACLK ( net_gnd0 ),
      .DMA3_DAREADY ( net_gnd0 ),
      .DMA3_DRLAST ( net_gnd0 ),
      .DMA2_DRTYPE ( net_gnd2 ),
      .DMA3_DRTYPE ( net_gnd2 ),
      .FTMD_TRACEIN_DATA ( net_gnd32 ),
      .FTMD_TRACEIN_VALID ( net_gnd0 ),
      .FTMD_TRACEIN_CLK ( net_gnd0 ),
      .FTMD_TRACEIN_ATID ( net_gnd4 ),
      .FTMT_F2P_TRIG ( net_gnd4 ),
      .FTMT_F2P_TRIGACK (  ),
      .FTMT_F2P_DEBUG ( net_gnd32 ),
      .FTMT_P2F_TRIGACK ( net_gnd4 ),
      .FTMT_P2F_TRIG (  ),
      .FTMT_P2F_DEBUG (  ),
      .FCLK_CLK3 (  ),
      .FCLK_CLK2 ( processing_system7_0_FCLK_CLK2[0] ),
      .FCLK_CLK1 ( clk150mhz[0] ),
      .FCLK_CLK0 ( processing_system7_0_FCLK_CLK0[0] ),
      .FCLK_CLKTRIG3_N ( net_gnd0 ),
      .FCLK_CLKTRIG2_N ( net_gnd0 ),
      .FCLK_CLKTRIG1_N ( net_gnd0 ),
      .FCLK_CLKTRIG0_N ( net_gnd0 ),
      .FCLK_RESET3_N (  ),
      .FCLK_RESET2_N (  ),
      .FCLK_RESET1_N (  ),
      .FCLK_RESET0_N ( processing_system7_0_FCLK_RESET0_N ),
      .FPGA_IDLE_N ( net_gnd0 ),
      .DDR_ARB ( net_gnd4 ),
      .IRQ_F2P ( axi_vdma_0_mm2s_introut[0:0] ),
      .Core0_nFIQ ( net_gnd0 ),
      .Core0_nIRQ ( net_gnd0 ),
      .Core1_nFIQ ( net_gnd0 ),
      .Core1_nIRQ ( net_gnd0 ),
      .EVENT_EVENTO (  ),
      .EVENT_STANDBYWFE (  ),
      .EVENT_STANDBYWFI (  ),
      .EVENT_EVENTI ( net_gnd0 ),
      .MIO ( processing_system7_0_MIO ),
      .DDR_Clk ( processing_system7_0_DDR_Clk ),
      .DDR_Clk_n ( processing_system7_0_DDR_Clk_n ),
      .DDR_CKE ( processing_system7_0_DDR_CKE ),
      .DDR_CS_n ( processing_system7_0_DDR_CS_n ),
      .DDR_RAS_n ( processing_system7_0_DDR_RAS_n ),
      .DDR_CAS_n ( processing_system7_0_DDR_CAS_n ),
      .DDR_WEB ( processing_system7_0_DDR_WEB ),
      .DDR_BankAddr ( processing_system7_0_DDR_BankAddr ),
      .DDR_Addr ( processing_system7_0_DDR_Addr ),
      .DDR_ODT ( processing_system7_0_DDR_ODT ),
      .DDR_DRSTB ( processing_system7_0_DDR_DRSTB ),
      .DDR_DQ ( processing_system7_0_DDR_DQ ),
      .DDR_DM ( processing_system7_0_DDR_DM ),
      .DDR_DQS ( processing_system7_0_DDR_DQS ),
      .DDR_DQS_n ( processing_system7_0_DDR_DQS_n ),
      .DDR_VRN ( processing_system7_0_DDR_VRN ),
      .DDR_VRP ( processing_system7_0_DDR_VRP ),
      .PS_SRSTB ( processing_system7_0_PS_SRSTB ),
      .PS_CLK ( processing_system7_0_PS_CLK ),
      .PS_PORB ( processing_system7_0_PS_PORB ),
      .IRQ_P2F_DMAC_ABORT (  ),
      .IRQ_P2F_DMAC0 (  ),
      .IRQ_P2F_DMAC1 (  ),
      .IRQ_P2F_DMAC2 (  ),
      .IRQ_P2F_DMAC3 (  ),
      .IRQ_P2F_DMAC4 (  ),
      .IRQ_P2F_DMAC5 (  ),
      .IRQ_P2F_DMAC6 (  ),
      .IRQ_P2F_DMAC7 (  ),
      .IRQ_P2F_SMC (  ),
      .IRQ_P2F_QSPI (  ),
      .IRQ_P2F_CTI (  ),
      .IRQ_P2F_GPIO (  ),
      .IRQ_P2F_USB0 (  ),
      .IRQ_P2F_ENET0 (  ),
      .IRQ_P2F_ENET_WAKE0 (  ),
      .IRQ_P2F_SDIO0 (  ),
      .IRQ_P2F_I2C0 (  ),
      .IRQ_P2F_SPI0 (  ),
      .IRQ_P2F_UART0 (  ),
      .IRQ_P2F_CAN0 (  ),
      .IRQ_P2F_USB1 (  ),
      .IRQ_P2F_ENET1 (  ),
      .IRQ_P2F_ENET_WAKE1 (  ),
      .IRQ_P2F_SDIO1 (  ),
      .IRQ_P2F_I2C1 (  ),
      .IRQ_P2F_SPI1 (  ),
      .IRQ_P2F_UART1 (  ),
      .IRQ_P2F_CAN1 (  )
    );

  cpu0_axi_gp0_wrapper
    axi_gp0 (
      .INTERCONNECT_ACLK ( processing_system7_0_FCLK_CLK2[0] ),
      .INTERCONNECT_ARESETN ( sys_reset_n_Interconnect_aresetn[0] ),
      .S_AXI_ARESET_OUT_N (  ),
      .M_AXI_ARESET_OUT_N ( axi_gp0_M_ARESETN ),
      .IRQ (  ),
      .S_AXI_ACLK ( processing_system7_0_FCLK_CLK2[0:0] ),
      .S_AXI_AWID ( axi_gp0_S_AWID ),
      .S_AXI_AWADDR ( axi_gp0_S_AWADDR ),
      .S_AXI_AWLEN ( axi_gp0_S_AWLEN ),
      .S_AXI_AWSIZE ( axi_gp0_S_AWSIZE ),
      .S_AXI_AWBURST ( axi_gp0_S_AWBURST ),
      .S_AXI_AWLOCK ( axi_gp0_S_AWLOCK ),
      .S_AXI_AWCACHE ( axi_gp0_S_AWCACHE ),
      .S_AXI_AWPROT ( axi_gp0_S_AWPROT ),
      .S_AXI_AWQOS ( axi_gp0_S_AWQOS ),
      .S_AXI_AWUSER ( net_gnd1[0:0] ),
      .S_AXI_AWVALID ( axi_gp0_S_AWVALID[0:0] ),
      .S_AXI_AWREADY ( axi_gp0_S_AWREADY[0:0] ),
      .S_AXI_WID ( axi_gp0_S_WID ),
      .S_AXI_WDATA ( axi_gp0_S_WDATA ),
      .S_AXI_WSTRB ( axi_gp0_S_WSTRB ),
      .S_AXI_WLAST ( axi_gp0_S_WLAST[0:0] ),
      .S_AXI_WUSER ( net_gnd1[0:0] ),
      .S_AXI_WVALID ( axi_gp0_S_WVALID[0:0] ),
      .S_AXI_WREADY ( axi_gp0_S_WREADY[0:0] ),
      .S_AXI_BID ( axi_gp0_S_BID ),
      .S_AXI_BRESP ( axi_gp0_S_BRESP ),
      .S_AXI_BUSER (  ),
      .S_AXI_BVALID ( axi_gp0_S_BVALID[0:0] ),
      .S_AXI_BREADY ( axi_gp0_S_BREADY[0:0] ),
      .S_AXI_ARID ( axi_gp0_S_ARID ),
      .S_AXI_ARADDR ( axi_gp0_S_ARADDR ),
      .S_AXI_ARLEN ( axi_gp0_S_ARLEN ),
      .S_AXI_ARSIZE ( axi_gp0_S_ARSIZE ),
      .S_AXI_ARBURST ( axi_gp0_S_ARBURST ),
      .S_AXI_ARLOCK ( axi_gp0_S_ARLOCK ),
      .S_AXI_ARCACHE ( axi_gp0_S_ARCACHE ),
      .S_AXI_ARPROT ( axi_gp0_S_ARPROT ),
      .S_AXI_ARQOS ( axi_gp0_S_ARQOS ),
      .S_AXI_ARUSER ( net_gnd1[0:0] ),
      .S_AXI_ARVALID ( axi_gp0_S_ARVALID[0:0] ),
      .S_AXI_ARREADY ( axi_gp0_S_ARREADY[0:0] ),
      .S_AXI_RID ( axi_gp0_S_RID ),
      .S_AXI_RDATA ( axi_gp0_S_RDATA ),
      .S_AXI_RRESP ( axi_gp0_S_RRESP ),
      .S_AXI_RLAST ( axi_gp0_S_RLAST[0:0] ),
      .S_AXI_RUSER (  ),
      .S_AXI_RVALID ( axi_gp0_S_RVALID[0:0] ),
      .S_AXI_RREADY ( axi_gp0_S_RREADY[0:0] ),
      .M_AXI_ACLK ( pgassign2 ),
      .M_AXI_AWID (  ),
      .M_AXI_AWADDR ( axi_gp0_M_AWADDR ),
      .M_AXI_AWLEN (  ),
      .M_AXI_AWSIZE (  ),
      .M_AXI_AWBURST (  ),
      .M_AXI_AWLOCK (  ),
      .M_AXI_AWCACHE (  ),
      .M_AXI_AWPROT (  ),
      .M_AXI_AWREGION (  ),
      .M_AXI_AWQOS (  ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( axi_gp0_M_AWVALID ),
      .M_AXI_AWREADY ( axi_gp0_M_AWREADY ),
      .M_AXI_WID (  ),
      .M_AXI_WDATA ( axi_gp0_M_WDATA ),
      .M_AXI_WSTRB ( axi_gp0_M_WSTRB ),
      .M_AXI_WLAST (  ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( axi_gp0_M_WVALID ),
      .M_AXI_WREADY ( axi_gp0_M_WREADY ),
      .M_AXI_BID ( net_gnd48 ),
      .M_AXI_BRESP ( axi_gp0_M_BRESP ),
      .M_AXI_BUSER ( net_gnd4 ),
      .M_AXI_BVALID ( axi_gp0_M_BVALID ),
      .M_AXI_BREADY ( axi_gp0_M_BREADY ),
      .M_AXI_ARID (  ),
      .M_AXI_ARADDR ( axi_gp0_M_ARADDR ),
      .M_AXI_ARLEN (  ),
      .M_AXI_ARSIZE (  ),
      .M_AXI_ARBURST (  ),
      .M_AXI_ARLOCK (  ),
      .M_AXI_ARCACHE (  ),
      .M_AXI_ARPROT (  ),
      .M_AXI_ARREGION (  ),
      .M_AXI_ARQOS (  ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( axi_gp0_M_ARVALID ),
      .M_AXI_ARREADY ( axi_gp0_M_ARREADY ),
      .M_AXI_RID ( net_gnd48 ),
      .M_AXI_RDATA ( axi_gp0_M_RDATA ),
      .M_AXI_RRESP ( axi_gp0_M_RRESP ),
      .M_AXI_RLAST ( net_gnd4 ),
      .M_AXI_RUSER ( net_gnd4 ),
      .M_AXI_RVALID ( axi_gp0_M_RVALID ),
      .M_AXI_RREADY ( axi_gp0_M_RREADY ),
      .S_AXI_CTRL_AWADDR ( net_gnd32 ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32 ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32 ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

  cpu0_axi_hp0_wrapper
    axi_hp0 (
      .INTERCONNECT_ACLK ( processing_system7_0_FCLK_CLK0[0] ),
      .INTERCONNECT_ARESETN ( sys_reset_n_Interconnect_aresetn[0] ),
      .S_AXI_ARESET_OUT_N ( axi_hp0_S_ARESETN ),
      .M_AXI_ARESET_OUT_N (  ),
      .IRQ (  ),
      .S_AXI_ACLK ( pgassign3 ),
      .S_AXI_AWID ( net_gnd2 ),
      .S_AXI_AWADDR ( axi_hp0_S_AWADDR ),
      .S_AXI_AWLEN ( axi_hp0_S_AWLEN ),
      .S_AXI_AWSIZE ( axi_hp0_S_AWSIZE ),
      .S_AXI_AWBURST ( axi_hp0_S_AWBURST ),
      .S_AXI_AWLOCK ( net_gnd4 ),
      .S_AXI_AWCACHE ( axi_hp0_S_AWCACHE ),
      .S_AXI_AWPROT ( axi_hp0_S_AWPROT ),
      .S_AXI_AWQOS ( net_gnd8 ),
      .S_AXI_AWUSER ( net_gnd2 ),
      .S_AXI_AWVALID ( axi_hp0_S_AWVALID ),
      .S_AXI_AWREADY ( axi_hp0_S_AWREADY ),
      .S_AXI_WID ( net_gnd2 ),
      .S_AXI_WDATA ( axi_hp0_S_WDATA ),
      .S_AXI_WSTRB ( axi_hp0_S_WSTRB ),
      .S_AXI_WLAST ( axi_hp0_S_WLAST ),
      .S_AXI_WUSER ( net_gnd2 ),
      .S_AXI_WVALID ( axi_hp0_S_WVALID ),
      .S_AXI_WREADY ( axi_hp0_S_WREADY ),
      .S_AXI_BID (  ),
      .S_AXI_BRESP ( axi_hp0_S_BRESP ),
      .S_AXI_BUSER (  ),
      .S_AXI_BVALID ( axi_hp0_S_BVALID ),
      .S_AXI_BREADY ( axi_hp0_S_BREADY ),
      .S_AXI_ARID ( net_gnd2 ),
      .S_AXI_ARADDR ( axi_hp0_S_ARADDR ),
      .S_AXI_ARLEN ( axi_hp0_S_ARLEN ),
      .S_AXI_ARSIZE ( axi_hp0_S_ARSIZE ),
      .S_AXI_ARBURST ( axi_hp0_S_ARBURST ),
      .S_AXI_ARLOCK ( net_gnd4 ),
      .S_AXI_ARCACHE ( axi_hp0_S_ARCACHE ),
      .S_AXI_ARPROT ( axi_hp0_S_ARPROT ),
      .S_AXI_ARQOS ( net_gnd8 ),
      .S_AXI_ARUSER ( net_gnd2 ),
      .S_AXI_ARVALID ( axi_hp0_S_ARVALID ),
      .S_AXI_ARREADY ( axi_hp0_S_ARREADY ),
      .S_AXI_RID (  ),
      .S_AXI_RDATA ( axi_hp0_S_RDATA ),
      .S_AXI_RRESP ( axi_hp0_S_RRESP ),
      .S_AXI_RLAST ( axi_hp0_S_RLAST ),
      .S_AXI_RUSER (  ),
      .S_AXI_RVALID ( axi_hp0_S_RVALID ),
      .S_AXI_RREADY ( axi_hp0_S_RREADY ),
      .M_AXI_ACLK ( processing_system7_0_FCLK_CLK0[0:0] ),
      .M_AXI_AWID ( axi_hp0_M_AWID[0:0] ),
      .M_AXI_AWADDR ( axi_hp0_M_AWADDR ),
      .M_AXI_AWLEN ( axi_hp0_M_AWLEN ),
      .M_AXI_AWSIZE ( axi_hp0_M_AWSIZE ),
      .M_AXI_AWBURST ( axi_hp0_M_AWBURST ),
      .M_AXI_AWLOCK ( axi_hp0_M_AWLOCK ),
      .M_AXI_AWCACHE ( axi_hp0_M_AWCACHE ),
      .M_AXI_AWPROT ( axi_hp0_M_AWPROT ),
      .M_AXI_AWREGION (  ),
      .M_AXI_AWQOS ( axi_hp0_M_AWQOS ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( axi_hp0_M_AWVALID[0:0] ),
      .M_AXI_AWREADY ( axi_hp0_M_AWREADY[0:0] ),
      .M_AXI_WID ( axi_hp0_M_WID[0:0] ),
      .M_AXI_WDATA ( axi_hp0_M_WDATA ),
      .M_AXI_WSTRB ( axi_hp0_M_WSTRB ),
      .M_AXI_WLAST ( axi_hp0_M_WLAST[0:0] ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( axi_hp0_M_WVALID[0:0] ),
      .M_AXI_WREADY ( axi_hp0_M_WREADY[0:0] ),
      .M_AXI_BID ( axi_hp0_M_BID[0:0] ),
      .M_AXI_BRESP ( axi_hp0_M_BRESP ),
      .M_AXI_BUSER ( net_gnd1[0:0] ),
      .M_AXI_BVALID ( axi_hp0_M_BVALID[0:0] ),
      .M_AXI_BREADY ( axi_hp0_M_BREADY[0:0] ),
      .M_AXI_ARID ( axi_hp0_M_ARID[0:0] ),
      .M_AXI_ARADDR ( axi_hp0_M_ARADDR ),
      .M_AXI_ARLEN ( axi_hp0_M_ARLEN ),
      .M_AXI_ARSIZE ( axi_hp0_M_ARSIZE ),
      .M_AXI_ARBURST ( axi_hp0_M_ARBURST ),
      .M_AXI_ARLOCK ( axi_hp0_M_ARLOCK ),
      .M_AXI_ARCACHE ( axi_hp0_M_ARCACHE ),
      .M_AXI_ARPROT ( axi_hp0_M_ARPROT ),
      .M_AXI_ARREGION (  ),
      .M_AXI_ARQOS ( axi_hp0_M_ARQOS ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( axi_hp0_M_ARVALID[0:0] ),
      .M_AXI_ARREADY ( axi_hp0_M_ARREADY[0:0] ),
      .M_AXI_RID ( axi_hp0_M_RID[0:0] ),
      .M_AXI_RDATA ( axi_hp0_M_RDATA ),
      .M_AXI_RRESP ( axi_hp0_M_RRESP ),
      .M_AXI_RLAST ( axi_hp0_M_RLAST[0:0] ),
      .M_AXI_RUSER ( net_gnd1[0:0] ),
      .M_AXI_RVALID ( axi_hp0_M_RVALID[0:0] ),
      .M_AXI_RREADY ( axi_hp0_M_RREADY[0:0] ),
      .S_AXI_CTRL_AWADDR ( net_gnd32 ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32 ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32 ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

  cpu0_sys_reset_n_wrapper
    sys_reset_n (
      .Slowest_sync_clk ( processing_system7_0_FCLK_CLK2[0] ),
      .Ext_Reset_In ( processing_system7_0_FCLK_RESET0_N ),
      .Aux_Reset_In ( net_gnd0 ),
      .MB_Debug_Sys_Rst ( net_gnd0 ),
      .Core_Reset_Req_0 ( net_gnd0 ),
      .Chip_Reset_Req_0 ( net_gnd0 ),
      .System_Reset_Req_0 ( net_gnd0 ),
      .Core_Reset_Req_1 ( net_gnd0 ),
      .Chip_Reset_Req_1 ( net_gnd0 ),
      .System_Reset_Req_1 ( net_gnd0 ),
      .Dcm_locked ( pgassign1 ),
      .RstcPPCresetcore_0 (  ),
      .RstcPPCresetchip_0 (  ),
      .RstcPPCresetsys_0 (  ),
      .RstcPPCresetcore_1 (  ),
      .RstcPPCresetchip_1 (  ),
      .RstcPPCresetsys_1 (  ),
      .MB_Reset (  ),
      .Bus_Struct_Reset (  ),
      .Peripheral_Reset (  ),
      .Interconnect_aresetn ( sys_reset_n_Interconnect_aresetn[0:0] ),
      .Peripheral_aresetn (  )
    );

  cpu0_pldma_mwr_0_wrapper
    pldma_mwr_0 (
      .S_AXI_ACLK ( processing_system7_0_FCLK_CLK2[0] ),
      .S_AXI_ARESETN ( axi_gp0_M_ARESETN[0] ),
      .S_AXI_AWADDR ( axi_gp0_M_AWADDR[31:0] ),
      .S_AXI_AWVALID ( axi_gp0_M_AWVALID[0] ),
      .S_AXI_WDATA ( axi_gp0_M_WDATA[31:0] ),
      .S_AXI_WSTRB ( axi_gp0_M_WSTRB[3:0] ),
      .S_AXI_WVALID ( axi_gp0_M_WVALID[0] ),
      .S_AXI_BREADY ( axi_gp0_M_BREADY[0] ),
      .S_AXI_ARADDR ( axi_gp0_M_ARADDR[31:0] ),
      .S_AXI_ARVALID ( axi_gp0_M_ARVALID[0] ),
      .S_AXI_RREADY ( axi_gp0_M_RREADY[0] ),
      .S_AXI_ARREADY ( axi_gp0_M_ARREADY[0] ),
      .S_AXI_RDATA ( axi_gp0_M_RDATA[31:0] ),
      .S_AXI_RRESP ( axi_gp0_M_RRESP[1:0] ),
      .S_AXI_RVALID ( axi_gp0_M_RVALID[0] ),
      .S_AXI_WREADY ( axi_gp0_M_WREADY[0] ),
      .S_AXI_BRESP ( axi_gp0_M_BRESP[1:0] ),
      .S_AXI_BVALID ( axi_gp0_M_BVALID[0] ),
      .S_AXI_AWREADY ( axi_gp0_M_AWREADY[0] ),
      .m_axi_aclk ( processing_system7_0_FCLK_CLK0[0] ),
      .m_axi_aresetn ( axi_hp0_S_ARESETN[0] ),
      .md_error (  ),
      .m_axi_arready ( axi_hp0_S_ARREADY[0] ),
      .m_axi_arvalid ( axi_hp0_S_ARVALID[0] ),
      .m_axi_araddr ( axi_hp0_S_ARADDR[31:0] ),
      .m_axi_arlen ( axi_hp0_S_ARLEN[7:0] ),
      .m_axi_arsize ( axi_hp0_S_ARSIZE[2:0] ),
      .m_axi_arburst ( axi_hp0_S_ARBURST[1:0] ),
      .m_axi_arprot ( axi_hp0_S_ARPROT[2:0] ),
      .m_axi_arcache ( axi_hp0_S_ARCACHE[3:0] ),
      .m_axi_rready ( axi_hp0_S_RREADY[0] ),
      .m_axi_rvalid ( axi_hp0_S_RVALID[0] ),
      .m_axi_rdata ( axi_hp0_S_RDATA[63:0] ),
      .m_axi_rresp ( axi_hp0_S_RRESP[1:0] ),
      .m_axi_rlast ( axi_hp0_S_RLAST[0] ),
      .m_axi_awready ( axi_hp0_S_AWREADY[0] ),
      .m_axi_awvalid ( axi_hp0_S_AWVALID[0] ),
      .m_axi_awaddr ( axi_hp0_S_AWADDR[31:0] ),
      .m_axi_awlen ( axi_hp0_S_AWLEN[7:0] ),
      .m_axi_awsize ( axi_hp0_S_AWSIZE[2:0] ),
      .m_axi_awburst ( axi_hp0_S_AWBURST[1:0] ),
      .m_axi_awprot ( axi_hp0_S_AWPROT[2:0] ),
      .m_axi_awcache ( axi_hp0_S_AWCACHE[3:0] ),
      .m_axi_wready ( axi_hp0_S_WREADY[0] ),
      .m_axi_wvalid ( axi_hp0_S_WVALID[0] ),
      .m_axi_wdata ( axi_hp0_S_WDATA[63:0] ),
      .m_axi_wstrb ( axi_hp0_S_WSTRB[7:0] ),
      .m_axi_wlast ( axi_hp0_S_WLAST[0] ),
      .m_axi_bready ( axi_hp0_S_BREADY[0] ),
      .m_axi_bvalid ( axi_hp0_S_BVALID[0] ),
      .m_axi_bresp ( axi_hp0_S_BRESP[1:0] ),
      .u_debug ( pldma_0_u_debug ),
      .u_ctrl0 ( pldma_mwr_0_u_ctrl0 ),
      .u_ctrl1 ( pldma_mwr_0_u_ctrl1 ),
      .wr_clk ( pldma_0_wr_clk ),
      .data_wr ( pldma_0_data_wr ),
      .wr_en ( pldma_0_wr_en ),
      .afull ( pldma_0_afull ),
      .rst ( pldma_0_rst )
    );

  cpu0_pldma_mrd_0_wrapper
    pldma_mrd_0 (
      .S_AXI_ACLK ( processing_system7_0_FCLK_CLK2[0] ),
      .S_AXI_ARESETN ( axi_gp0_M_ARESETN[1] ),
      .S_AXI_AWADDR ( axi_gp0_M_AWADDR[63:32] ),
      .S_AXI_AWVALID ( axi_gp0_M_AWVALID[1] ),
      .S_AXI_WDATA ( axi_gp0_M_WDATA[63:32] ),
      .S_AXI_WSTRB ( axi_gp0_M_WSTRB[7:4] ),
      .S_AXI_WVALID ( axi_gp0_M_WVALID[1] ),
      .S_AXI_BREADY ( axi_gp0_M_BREADY[1] ),
      .S_AXI_ARADDR ( axi_gp0_M_ARADDR[63:32] ),
      .S_AXI_ARVALID ( axi_gp0_M_ARVALID[1] ),
      .S_AXI_RREADY ( axi_gp0_M_RREADY[1] ),
      .S_AXI_ARREADY ( axi_gp0_M_ARREADY[1] ),
      .S_AXI_RDATA ( axi_gp0_M_RDATA[63:32] ),
      .S_AXI_RRESP ( axi_gp0_M_RRESP[3:2] ),
      .S_AXI_RVALID ( axi_gp0_M_RVALID[1] ),
      .S_AXI_WREADY ( axi_gp0_M_WREADY[1] ),
      .S_AXI_BRESP ( axi_gp0_M_BRESP[3:2] ),
      .S_AXI_BVALID ( axi_gp0_M_BVALID[1] ),
      .S_AXI_AWREADY ( axi_gp0_M_AWREADY[1] ),
      .m_axi_aclk ( processing_system7_0_FCLK_CLK0[0] ),
      .m_axi_aresetn ( axi_hp0_S_ARESETN[1] ),
      .md_error (  ),
      .m_axi_arready ( axi_hp0_S_ARREADY[1] ),
      .m_axi_arvalid ( axi_hp0_S_ARVALID[1] ),
      .m_axi_araddr ( axi_hp0_S_ARADDR[63:32] ),
      .m_axi_arlen ( axi_hp0_S_ARLEN[15:8] ),
      .m_axi_arsize ( axi_hp0_S_ARSIZE[5:3] ),
      .m_axi_arburst ( axi_hp0_S_ARBURST[3:2] ),
      .m_axi_arprot ( axi_hp0_S_ARPROT[5:3] ),
      .m_axi_arcache ( axi_hp0_S_ARCACHE[7:4] ),
      .m_axi_rready ( axi_hp0_S_RREADY[1] ),
      .m_axi_rvalid ( axi_hp0_S_RVALID[1] ),
      .m_axi_rdata ( axi_hp0_S_RDATA[127:64] ),
      .m_axi_rresp ( axi_hp0_S_RRESP[3:2] ),
      .m_axi_rlast ( axi_hp0_S_RLAST[1] ),
      .m_axi_awready ( axi_hp0_S_AWREADY[1] ),
      .m_axi_awvalid ( axi_hp0_S_AWVALID[1] ),
      .m_axi_awaddr ( axi_hp0_S_AWADDR[63:32] ),
      .m_axi_awlen ( axi_hp0_S_AWLEN[15:8] ),
      .m_axi_awsize ( axi_hp0_S_AWSIZE[5:3] ),
      .m_axi_awburst ( axi_hp0_S_AWBURST[3:2] ),
      .m_axi_awprot ( axi_hp0_S_AWPROT[5:3] ),
      .m_axi_awcache ( axi_hp0_S_AWCACHE[7:4] ),
      .m_axi_wready ( axi_hp0_S_WREADY[1] ),
      .m_axi_wvalid ( axi_hp0_S_WVALID[1] ),
      .m_axi_wdata ( axi_hp0_S_WDATA[127:64] ),
      .m_axi_wstrb ( axi_hp0_S_WSTRB[15:8] ),
      .m_axi_wlast ( axi_hp0_S_WLAST[1] ),
      .m_axi_bready ( axi_hp0_S_BREADY[1] ),
      .m_axi_bvalid ( axi_hp0_S_BVALID[1] ),
      .m_axi_bresp ( axi_hp0_S_BRESP[3:2] ),
      .u_debug ( pldma_mrd_0_u_debug ),
      .rd_clk ( pldma_mrd_0_rd_clk ),
      .data_rd ( pldma_mrd_0_data_rd ),
      .rd_en ( pldma_mrd_0_rd_en ),
      .aempty ( pldma_mrd_0_aempty ),
      .rd_fifo_cnt ( pldma_mrd_0_rd_fifo_cnt ),
      .rst ( pldma_mrd_0_rst )
    );

  cpu0_axi_vdma_0_wrapper
    axi_vdma_0 (
      .s_axi_lite_aclk ( processing_system7_0_FCLK_CLK2[0] ),
      .m_axi_sg_aclk ( net_gnd0 ),
      .m_axi_mm2s_aclk ( processing_system7_0_FCLK_CLK0[0] ),
      .m_axi_s2mm_aclk ( net_gnd0 ),
      .m_axis_mm2s_aclk ( clk150mhz[0] ),
      .s_axis_s2mm_aclk ( net_gnd0 ),
      .axi_resetn ( axi_gp0_M_ARESETN[2] ),
      .s_axi_lite_awvalid ( axi_gp0_M_AWVALID[2] ),
      .s_axi_lite_awready ( axi_gp0_M_AWREADY[2] ),
      .s_axi_lite_awaddr ( axi_gp0_M_AWADDR[72:64] ),
      .s_axi_lite_wvalid ( axi_gp0_M_WVALID[2] ),
      .s_axi_lite_wready ( axi_gp0_M_WREADY[2] ),
      .s_axi_lite_wdata ( axi_gp0_M_WDATA[95:64] ),
      .s_axi_lite_bresp ( axi_gp0_M_BRESP[5:4] ),
      .s_axi_lite_bvalid ( axi_gp0_M_BVALID[2] ),
      .s_axi_lite_bready ( axi_gp0_M_BREADY[2] ),
      .s_axi_lite_arvalid ( axi_gp0_M_ARVALID[2] ),
      .s_axi_lite_arready ( axi_gp0_M_ARREADY[2] ),
      .s_axi_lite_araddr ( axi_gp0_M_ARADDR[72:64] ),
      .s_axi_lite_rvalid ( axi_gp0_M_RVALID[2] ),
      .s_axi_lite_rready ( axi_gp0_M_RREADY[2] ),
      .s_axi_lite_rdata ( axi_gp0_M_RDATA[95:64] ),
      .s_axi_lite_rresp ( axi_gp0_M_RRESP[5:4] ),
      .m_axi_sg_araddr (  ),
      .m_axi_sg_arlen (  ),
      .m_axi_sg_arsize (  ),
      .m_axi_sg_arburst (  ),
      .m_axi_sg_arprot (  ),
      .m_axi_sg_arcache (  ),
      .m_axi_sg_arvalid (  ),
      .m_axi_sg_arready ( net_gnd0 ),
      .m_axi_sg_rdata ( net_gnd32 ),
      .m_axi_sg_rresp ( net_gnd2 ),
      .m_axi_sg_rlast ( net_gnd0 ),
      .m_axi_sg_rvalid ( net_gnd0 ),
      .m_axi_sg_rready (  ),
      .m_axi_mm2s_araddr ( axi_hp2_S_ARADDR ),
      .m_axi_mm2s_arlen ( axi_hp2_S_ARLEN ),
      .m_axi_mm2s_arsize ( axi_hp2_S_ARSIZE ),
      .m_axi_mm2s_arburst ( axi_hp2_S_ARBURST ),
      .m_axi_mm2s_arprot ( axi_hp2_S_ARPROT ),
      .m_axi_mm2s_arcache ( axi_hp2_S_ARCACHE ),
      .m_axi_mm2s_arvalid ( axi_hp2_S_ARVALID[0] ),
      .m_axi_mm2s_arready ( axi_hp2_S_ARREADY[0] ),
      .m_axi_mm2s_rdata ( axi_hp2_S_RDATA ),
      .m_axi_mm2s_rresp ( axi_hp2_S_RRESP ),
      .m_axi_mm2s_rlast ( axi_hp2_S_RLAST[0] ),
      .m_axi_mm2s_rvalid ( axi_hp2_S_RVALID[0] ),
      .m_axi_mm2s_rready ( axi_hp2_S_RREADY[0] ),
      .mm2s_prmry_reset_out_n (  ),
      .m_axis_mm2s_tdata ( axi_vdma_0_M_AXIS_MM2S_TDATA ),
      .m_axis_mm2s_tkeep ( axi_vdma_0_M_AXIS_MM2S_TKEEP ),
      .m_axis_mm2s_tvalid ( axi_vdma_0_M_AXIS_MM2S_TVALID ),
      .m_axis_mm2s_tready ( axi_vdma_0_M_AXIS_MM2S_TREADY ),
      .m_axis_mm2s_tlast ( axi_vdma_0_M_AXIS_MM2S_TLAST ),
      .m_axis_mm2s_tuser (  ),
      .m_axi_s2mm_awaddr (  ),
      .m_axi_s2mm_awlen (  ),
      .m_axi_s2mm_awsize (  ),
      .m_axi_s2mm_awburst (  ),
      .m_axi_s2mm_awprot (  ),
      .m_axi_s2mm_awcache (  ),
      .m_axi_s2mm_awvalid (  ),
      .m_axi_s2mm_awready ( net_gnd0 ),
      .m_axi_s2mm_wdata (  ),
      .m_axi_s2mm_wstrb (  ),
      .m_axi_s2mm_wlast (  ),
      .m_axi_s2mm_wvalid (  ),
      .m_axi_s2mm_wready ( net_gnd0 ),
      .m_axi_s2mm_bresp ( net_gnd2 ),
      .m_axi_s2mm_bvalid ( net_gnd0 ),
      .m_axi_s2mm_bready (  ),
      .s2mm_prmry_reset_out_n (  ),
      .s_axis_s2mm_tdata ( net_gnd32 ),
      .s_axis_s2mm_tkeep ( net_vcc4 ),
      .s_axis_s2mm_tvalid ( net_gnd0 ),
      .s_axis_s2mm_tready (  ),
      .s_axis_s2mm_tlast ( net_gnd0 ),
      .s_axis_s2mm_tuser ( net_gnd1[0:0] ),
      .mm2s_fsync ( axi_hdmi_out_vdma_fs ),
      .mm2s_frame_ptr_in ( net_gnd6 ),
      .mm2s_frame_ptr_out (  ),
      .mm2s_fsync_out ( axi_vdma_0_mm2s_fsync_out ),
      .mm2s_prmtr_update (  ),
      .mm2s_buffer_empty ( axi_vdma_0_mm2s_buffer_empty ),
      .mm2s_buffer_almost_empty ( axi_vdma_0_mm2s_buffer_almost_empty ),
      .s2mm_fsync ( net_gnd0 ),
      .s2mm_frame_ptr_in ( net_gnd6 ),
      .s2mm_frame_ptr_out (  ),
      .s2mm_fsync_out (  ),
      .s2mm_buffer_full (  ),
      .s2mm_buffer_almost_full (  ),
      .s2mm_prmtr_update (  ),
      .mm2s_introut ( axi_vdma_0_mm2s_introut[0] ),
      .s2mm_introut (  ),
      .axi_vdma_tstvec (  )
    );

  cpu0_axi_hdmi_tx_16b_0_wrapper
    axi_hdmi_tx_16b_0 (
      .hdmi_ref_clk ( clk150mhz[0] ),
      .hdmi_clk ( axi_hdmi_tx_16b_0_hdmi_clk ),
      .hdmi_vsync ( axi_hdmi_tx_16b_0_hdmi_vsync ),
      .hdmi_hsync ( axi_hdmi_tx_16b_0_hdmi_hsync ),
      .hdmi_data_e ( axi_hdmi_tx_16b_0_hdmi_data_e ),
      .hdmi_data ( axi_hdmi_tx_16b_0_hdmi_data ),
      .vdma_clk ( clk150mhz[0] ),
      .vdma_fs ( axi_hdmi_out_vdma_fs ),
      .vdma_fs_ret ( axi_vdma_0_mm2s_fsync_out ),
      .vdma_empty ( axi_vdma_0_mm2s_buffer_empty ),
      .vdma_almost_empty ( axi_vdma_0_mm2s_buffer_almost_empty ),
      .up_status (  ),
      .debug_trigger (  ),
      .debug_data (  ),
      .S_AXI_ACLK ( processing_system7_0_FCLK_CLK2[0] ),
      .S_AXI_ARESETN ( axi_gp0_M_ARESETN[3] ),
      .S_AXI_AWADDR ( axi_gp0_M_AWADDR[127:96] ),
      .S_AXI_AWVALID ( axi_gp0_M_AWVALID[3] ),
      .S_AXI_WDATA ( axi_gp0_M_WDATA[127:96] ),
      .S_AXI_WSTRB ( axi_gp0_M_WSTRB[15:12] ),
      .S_AXI_WVALID ( axi_gp0_M_WVALID[3] ),
      .S_AXI_BREADY ( axi_gp0_M_BREADY[3] ),
      .S_AXI_ARADDR ( axi_gp0_M_ARADDR[127:96] ),
      .S_AXI_ARVALID ( axi_gp0_M_ARVALID[3] ),
      .S_AXI_RREADY ( axi_gp0_M_RREADY[3] ),
      .S_AXI_ARREADY ( axi_gp0_M_ARREADY[3] ),
      .S_AXI_RDATA ( axi_gp0_M_RDATA[127:96] ),
      .S_AXI_RRESP ( axi_gp0_M_RRESP[7:6] ),
      .S_AXI_RVALID ( axi_gp0_M_RVALID[3] ),
      .S_AXI_WREADY ( axi_gp0_M_WREADY[3] ),
      .S_AXI_BRESP ( axi_gp0_M_BRESP[7:6] ),
      .S_AXI_BVALID ( axi_gp0_M_BVALID[3] ),
      .S_AXI_AWREADY ( axi_gp0_M_AWREADY[3] ),
      .M_AXIS_MM2S_TVALID ( axi_vdma_0_M_AXIS_MM2S_TVALID ),
      .M_AXIS_MM2S_TKEEP ( axi_vdma_0_M_AXIS_MM2S_TKEEP ),
      .M_AXIS_MM2S_TDATA ( axi_vdma_0_M_AXIS_MM2S_TDATA ),
      .M_AXIS_MM2S_TLAST ( axi_vdma_0_M_AXIS_MM2S_TLAST ),
      .M_AXIS_MM2S_TREADY ( axi_vdma_0_M_AXIS_MM2S_TREADY )
    );

  cpu0_axi_hp2_wrapper
    axi_hp2 (
      .INTERCONNECT_ACLK ( clk150mhz[0] ),
      .INTERCONNECT_ARESETN ( sys_reset_n_Interconnect_aresetn[0] ),
      .S_AXI_ARESET_OUT_N (  ),
      .M_AXI_ARESET_OUT_N (  ),
      .IRQ (  ),
      .S_AXI_ACLK ( processing_system7_0_FCLK_CLK0[0:0] ),
      .S_AXI_AWID ( net_gnd1[0:0] ),
      .S_AXI_AWADDR ( net_gnd32 ),
      .S_AXI_AWLEN ( net_gnd8 ),
      .S_AXI_AWSIZE ( net_gnd3 ),
      .S_AXI_AWBURST ( net_gnd2 ),
      .S_AXI_AWLOCK ( net_gnd2 ),
      .S_AXI_AWCACHE ( net_gnd4 ),
      .S_AXI_AWPROT ( net_gnd3 ),
      .S_AXI_AWQOS ( net_gnd4 ),
      .S_AXI_AWUSER ( net_gnd1[0:0] ),
      .S_AXI_AWVALID ( net_gnd1[0:0] ),
      .S_AXI_AWREADY (  ),
      .S_AXI_WID ( net_gnd1[0:0] ),
      .S_AXI_WDATA ( net_gnd64 ),
      .S_AXI_WSTRB ( net_gnd8 ),
      .S_AXI_WLAST ( net_gnd1[0:0] ),
      .S_AXI_WUSER ( net_gnd1[0:0] ),
      .S_AXI_WVALID ( net_gnd1[0:0] ),
      .S_AXI_WREADY (  ),
      .S_AXI_BID (  ),
      .S_AXI_BRESP (  ),
      .S_AXI_BUSER (  ),
      .S_AXI_BVALID (  ),
      .S_AXI_BREADY ( net_gnd1[0:0] ),
      .S_AXI_ARID ( net_gnd1[0:0] ),
      .S_AXI_ARADDR ( axi_hp2_S_ARADDR ),
      .S_AXI_ARLEN ( axi_hp2_S_ARLEN ),
      .S_AXI_ARSIZE ( axi_hp2_S_ARSIZE ),
      .S_AXI_ARBURST ( axi_hp2_S_ARBURST ),
      .S_AXI_ARLOCK ( net_gnd2 ),
      .S_AXI_ARCACHE ( axi_hp2_S_ARCACHE ),
      .S_AXI_ARPROT ( axi_hp2_S_ARPROT ),
      .S_AXI_ARQOS ( net_gnd4 ),
      .S_AXI_ARUSER ( net_gnd1[0:0] ),
      .S_AXI_ARVALID ( axi_hp2_S_ARVALID[0:0] ),
      .S_AXI_ARREADY ( axi_hp2_S_ARREADY[0:0] ),
      .S_AXI_RID (  ),
      .S_AXI_RDATA ( axi_hp2_S_RDATA ),
      .S_AXI_RRESP ( axi_hp2_S_RRESP ),
      .S_AXI_RLAST ( axi_hp2_S_RLAST[0:0] ),
      .S_AXI_RUSER (  ),
      .S_AXI_RVALID ( axi_hp2_S_RVALID[0:0] ),
      .S_AXI_RREADY ( axi_hp2_S_RREADY[0:0] ),
      .M_AXI_ACLK ( clk150mhz[0:0] ),
      .M_AXI_AWID ( axi_hp2_M_AWID[0:0] ),
      .M_AXI_AWADDR ( axi_hp2_M_AWADDR ),
      .M_AXI_AWLEN ( axi_hp2_M_AWLEN ),
      .M_AXI_AWSIZE ( axi_hp2_M_AWSIZE ),
      .M_AXI_AWBURST ( axi_hp2_M_AWBURST ),
      .M_AXI_AWLOCK ( axi_hp2_M_AWLOCK ),
      .M_AXI_AWCACHE ( axi_hp2_M_AWCACHE ),
      .M_AXI_AWPROT ( axi_hp2_M_AWPROT ),
      .M_AXI_AWREGION (  ),
      .M_AXI_AWQOS ( axi_hp2_M_AWQOS ),
      .M_AXI_AWUSER (  ),
      .M_AXI_AWVALID ( axi_hp2_M_AWVALID[0:0] ),
      .M_AXI_AWREADY ( axi_hp2_M_AWREADY[0:0] ),
      .M_AXI_WID ( axi_hp2_M_WID[0:0] ),
      .M_AXI_WDATA ( axi_hp2_M_WDATA ),
      .M_AXI_WSTRB ( axi_hp2_M_WSTRB ),
      .M_AXI_WLAST ( axi_hp2_M_WLAST[0:0] ),
      .M_AXI_WUSER (  ),
      .M_AXI_WVALID ( axi_hp2_M_WVALID[0:0] ),
      .M_AXI_WREADY ( axi_hp2_M_WREADY[0:0] ),
      .M_AXI_BID ( axi_hp2_M_BID[0:0] ),
      .M_AXI_BRESP ( axi_hp2_M_BRESP ),
      .M_AXI_BUSER ( net_gnd1[0:0] ),
      .M_AXI_BVALID ( axi_hp2_M_BVALID[0:0] ),
      .M_AXI_BREADY ( axi_hp2_M_BREADY[0:0] ),
      .M_AXI_ARID ( axi_hp2_M_ARID[0:0] ),
      .M_AXI_ARADDR ( axi_hp2_M_ARADDR ),
      .M_AXI_ARLEN ( axi_hp2_M_ARLEN ),
      .M_AXI_ARSIZE ( axi_hp2_M_ARSIZE ),
      .M_AXI_ARBURST ( axi_hp2_M_ARBURST ),
      .M_AXI_ARLOCK ( axi_hp2_M_ARLOCK ),
      .M_AXI_ARCACHE ( axi_hp2_M_ARCACHE ),
      .M_AXI_ARPROT ( axi_hp2_M_ARPROT ),
      .M_AXI_ARREGION (  ),
      .M_AXI_ARQOS ( axi_hp2_M_ARQOS ),
      .M_AXI_ARUSER (  ),
      .M_AXI_ARVALID ( axi_hp2_M_ARVALID[0:0] ),
      .M_AXI_ARREADY ( axi_hp2_M_ARREADY[0:0] ),
      .M_AXI_RID ( axi_hp2_M_RID[0:0] ),
      .M_AXI_RDATA ( axi_hp2_M_RDATA ),
      .M_AXI_RRESP ( axi_hp2_M_RRESP ),
      .M_AXI_RLAST ( axi_hp2_M_RLAST[0:0] ),
      .M_AXI_RUSER ( net_gnd1[0:0] ),
      .M_AXI_RVALID ( axi_hp2_M_RVALID[0:0] ),
      .M_AXI_RREADY ( axi_hp2_M_RREADY[0:0] ),
      .S_AXI_CTRL_AWADDR ( net_gnd32 ),
      .S_AXI_CTRL_AWVALID ( net_gnd0 ),
      .S_AXI_CTRL_AWREADY (  ),
      .S_AXI_CTRL_WDATA ( net_gnd32 ),
      .S_AXI_CTRL_WVALID ( net_gnd0 ),
      .S_AXI_CTRL_WREADY (  ),
      .S_AXI_CTRL_BRESP (  ),
      .S_AXI_CTRL_BVALID (  ),
      .S_AXI_CTRL_BREADY ( net_gnd0 ),
      .S_AXI_CTRL_ARADDR ( net_gnd32 ),
      .S_AXI_CTRL_ARVALID ( net_gnd0 ),
      .S_AXI_CTRL_ARREADY (  ),
      .S_AXI_CTRL_RDATA (  ),
      .S_AXI_CTRL_RRESP (  ),
      .S_AXI_CTRL_RVALID (  ),
      .S_AXI_CTRL_RREADY ( net_gnd0 ),
      .INTERCONNECT_ARESET_OUT_N (  ),
      .DEBUG_AW_TRANS_SEQ (  ),
      .DEBUG_AW_ARB_GRANT (  ),
      .DEBUG_AR_TRANS_SEQ (  ),
      .DEBUG_AR_ARB_GRANT (  ),
      .DEBUG_AW_TRANS_QUAL (  ),
      .DEBUG_AW_ACCEPT_CNT (  ),
      .DEBUG_AW_ACTIVE_THREAD (  ),
      .DEBUG_AW_ACTIVE_TARGET (  ),
      .DEBUG_AW_ACTIVE_REGION (  ),
      .DEBUG_AW_ERROR (  ),
      .DEBUG_AW_TARGET (  ),
      .DEBUG_AR_TRANS_QUAL (  ),
      .DEBUG_AR_ACCEPT_CNT (  ),
      .DEBUG_AR_ACTIVE_THREAD (  ),
      .DEBUG_AR_ACTIVE_TARGET (  ),
      .DEBUG_AR_ACTIVE_REGION (  ),
      .DEBUG_AR_ERROR (  ),
      .DEBUG_AR_TARGET (  ),
      .DEBUG_B_TRANS_SEQ (  ),
      .DEBUG_R_BEAT_CNT (  ),
      .DEBUG_R_TRANS_SEQ (  ),
      .DEBUG_AW_ISSUING_CNT (  ),
      .DEBUG_AR_ISSUING_CNT (  ),
      .DEBUG_W_BEAT_CNT (  ),
      .DEBUG_W_TRANS_SEQ (  ),
      .DEBUG_BID_TARGET (  ),
      .DEBUG_BID_ERROR (  ),
      .DEBUG_RID_TARGET (  ),
      .DEBUG_RID_ERROR (  ),
      .DEBUG_SR_SC_ARADDR (  ),
      .DEBUG_SR_SC_ARADDRCONTROL (  ),
      .DEBUG_SR_SC_AWADDR (  ),
      .DEBUG_SR_SC_AWADDRCONTROL (  ),
      .DEBUG_SR_SC_BRESP (  ),
      .DEBUG_SR_SC_RDATA (  ),
      .DEBUG_SR_SC_RDATACONTROL (  ),
      .DEBUG_SR_SC_WDATA (  ),
      .DEBUG_SR_SC_WDATACONTROL (  ),
      .DEBUG_SC_SF_ARADDR (  ),
      .DEBUG_SC_SF_ARADDRCONTROL (  ),
      .DEBUG_SC_SF_AWADDR (  ),
      .DEBUG_SC_SF_AWADDRCONTROL (  ),
      .DEBUG_SC_SF_BRESP (  ),
      .DEBUG_SC_SF_RDATA (  ),
      .DEBUG_SC_SF_RDATACONTROL (  ),
      .DEBUG_SC_SF_WDATA (  ),
      .DEBUG_SC_SF_WDATACONTROL (  ),
      .DEBUG_SF_CB_ARADDR (  ),
      .DEBUG_SF_CB_ARADDRCONTROL (  ),
      .DEBUG_SF_CB_AWADDR (  ),
      .DEBUG_SF_CB_AWADDRCONTROL (  ),
      .DEBUG_SF_CB_BRESP (  ),
      .DEBUG_SF_CB_RDATA (  ),
      .DEBUG_SF_CB_RDATACONTROL (  ),
      .DEBUG_SF_CB_WDATA (  ),
      .DEBUG_SF_CB_WDATACONTROL (  ),
      .DEBUG_CB_MF_ARADDR (  ),
      .DEBUG_CB_MF_ARADDRCONTROL (  ),
      .DEBUG_CB_MF_AWADDR (  ),
      .DEBUG_CB_MF_AWADDRCONTROL (  ),
      .DEBUG_CB_MF_BRESP (  ),
      .DEBUG_CB_MF_RDATA (  ),
      .DEBUG_CB_MF_RDATACONTROL (  ),
      .DEBUG_CB_MF_WDATA (  ),
      .DEBUG_CB_MF_WDATACONTROL (  ),
      .DEBUG_MF_MC_ARADDR (  ),
      .DEBUG_MF_MC_ARADDRCONTROL (  ),
      .DEBUG_MF_MC_AWADDR (  ),
      .DEBUG_MF_MC_AWADDRCONTROL (  ),
      .DEBUG_MF_MC_BRESP (  ),
      .DEBUG_MF_MC_RDATA (  ),
      .DEBUG_MF_MC_RDATACONTROL (  ),
      .DEBUG_MF_MC_WDATA (  ),
      .DEBUG_MF_MC_WDATACONTROL (  ),
      .DEBUG_MC_MP_ARADDR (  ),
      .DEBUG_MC_MP_ARADDRCONTROL (  ),
      .DEBUG_MC_MP_AWADDR (  ),
      .DEBUG_MC_MP_AWADDRCONTROL (  ),
      .DEBUG_MC_MP_BRESP (  ),
      .DEBUG_MC_MP_RDATA (  ),
      .DEBUG_MC_MP_RDATACONTROL (  ),
      .DEBUG_MC_MP_WDATA (  ),
      .DEBUG_MC_MP_WDATACONTROL (  ),
      .DEBUG_MP_MR_ARADDR (  ),
      .DEBUG_MP_MR_ARADDRCONTROL (  ),
      .DEBUG_MP_MR_AWADDR (  ),
      .DEBUG_MP_MR_AWADDRCONTROL (  ),
      .DEBUG_MP_MR_BRESP (  ),
      .DEBUG_MP_MR_RDATA (  ),
      .DEBUG_MP_MR_RDATACONTROL (  ),
      .DEBUG_MP_MR_WDATA (  ),
      .DEBUG_MP_MR_WDATACONTROL (  )
    );

  IOBUF
    iobuf_0 (
      .I ( processing_system7_0_I2C1_SDA_O ),
      .IO ( processing_system7_0_I2C1_SDA ),
      .O ( processing_system7_0_I2C1_SDA_I ),
      .T ( processing_system7_0_I2C1_SDA_T )
    );

  IOBUF
    iobuf_1 (
      .I ( processing_system7_0_I2C1_SCL_O ),
      .IO ( processing_system7_0_I2C1_SCL ),
      .O ( processing_system7_0_I2C1_SCL_I ),
      .T ( processing_system7_0_I2C1_SCL_T )
    );

endmodule

