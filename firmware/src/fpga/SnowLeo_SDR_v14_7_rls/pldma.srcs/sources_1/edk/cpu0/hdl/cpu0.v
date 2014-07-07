//-----------------------------------------------------------------------------
// cpu0.v
//-----------------------------------------------------------------------------

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

  (* CORE_GENERATION_INFO = "processing_system7_0,processing_system7,{C_I2C0_PERIPHERAL_ENABLE = 1,C_UART0_PERIPHERAL_ENABLE = 1,C_I2C0_I2C0_IO = MIO 50 .. 51,C_UART1_PERIPHERAL_ENABLE = 0,C_UART0_UART0_IO = MIO 46 .. 47,C_CAN0_PERIPHERAL_ENABLE = 0,C_I2C1_I2C1_IO = EMIO,C_I2C1_PERIPHERAL_ENABLE = 1,C_SPI0_PERIPHERAL_ENABLE = 1,C_SD0_PERIPHERAL_ENABLE = 1,C_SPI0_SPI0_IO = EMIO,C_TTC0_PERIPHERAL_ENABLE = 1,C_TTC1_PERIPHERAL_ENABLE = 0,C_ENET0_RESET_ENABLE = 0,C_ENET0_GRP_MDIO_ENABLE = 1,C_ENET1_PERIPHERAL_ENABLE = 0,C_ENET0_ENET0_IO = MIO 16 .. 27,C_ENET0_PERIPHERAL_ENABLE = 1,C_USB0_RESET_ENABLE = 0,C_NAND_PERIPHERAL_ENABLE = 1,C_USB0_RESET_IO = -1,C_USB0_PERIPHERAL_ENABLE = 1,C_NAND_CYCLES_T_RC = 25,C_NAND_CYCLES_T_REA = 10,C_NAND_CYCLES_T_CLR = 15,C_NAND_CYCLES_T_RR = 25,C_NAND_CYCLES_T_WC = 25,C_NAND_CYCLES_T_WP = 15,C_NAND_CYCLES_T_AR = 15,C_WDT_PERIPHERAL_ENABLE = 1,C_MIO_MIO[2]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[0]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[1]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[15]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[13]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[11]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[9]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[7]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[5]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[3]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[14]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[12]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[10]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[8]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[6]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[4]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[26]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[24]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[22]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[20]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[18]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[16]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[27]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[25]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[23]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[21]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[19]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[17]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[39]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[37]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[35]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[33]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[31]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[29]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[38]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[36]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[34]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[32]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[30]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[28]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[52]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[50]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[48]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[46]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[44]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[42]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[40]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[51]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[49]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[47]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[45]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[43]_IOTYPE = LVCMOS 1.8V,C_MIO_MIO[41]_IOTYPE = LVCMOS 1.8V,C_UIPARAM_DDR_T_FAW = 30.0,C_UIPARAM_DDR_T_RAS_MIN = 36.0,C_UIPARAM_DDR_T_RC = 49.5,C_UIPARAM_DDR_T_RP = 7,C_UIPARAM_DDR_CWL = 6,C_UIPARAM_DDR_FREQ_MHZ = 533.333313,C_UIPARAM_DDR_SPEED_BIN = DDR3_1066F,C_UIPARAM_DDR_DEVICE_CAPACITY = 2048 MBits,C_UIPARAM_DDR_DRAM_WIDTH = 16 Bits,C_UIPARAM_DDR_BL = 8,C_UIPARAM_DDR_MEMORY_TYPE = DDR 3,C_MIO_MIO[53]_IOTYPE = LVCMOS 1.8V,C_UIPARAM_DDR_T_RCD = 7,C_UIPARAM_DDR_CL = 7,C_UIPARAM_DDR_ROW_ADDR_COUNT = 14,C_UIPARAM_DDR_PARTNO = Custom,C_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 = -0.001,C_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 = -0.007,C_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 = -0.003,C_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 = -0.004,C_DDR_V4.00.A_C_S_AXI_HP3_HIGHADDR = 0x1FFFFFFF,C_DDR_V4.00.A_C_S_AXI_HP2_HIGHADDR = 0x1FFFFFFF,C_DDR_V4.00.A_C_S_AXI_HP1_HIGHADDR = 0x1FFFFFFF,C_DDR_V4.00.A_C_S_AXI_HP0_HIGHADDR = 0x1FFFFFFF,C_UIPARAM_DDR_BOARD_DELAY3 = 0.011,C_UIPARAM_DDR_BOARD_DELAY1 = 0.01,C_UIPARAM_DDR_TRAIN_DATA_EYE = 1,C_UIPARAM_DDR_TRAIN_WRITE_LEVEL = 1,C_DDR_AXI_HP2_DATAWIDTH = 64,C_DDR_AXI_HP0_DATAWIDTH = 64,C_DDR_V4.00.A_C_S_AXI_HP3_BASEADDR = 0x00000000,C_DDR_V4.00.A_C_S_AXI_HP2_BASEADDR = 0x00000000,C_DDR_V4.00.A_C_S_AXI_HP1_BASEADDR = 0x00000000,C_DDR_V4.00.A_C_S_AXI_HP0_BASEADDR = 0x00000000,C_UIPARAM_DDR_BOARD_DELAY2 = 0.009,C_UIPARAM_DDR_BOARD_DELAY0 = 0.013,C_UIPARAM_DDR_USE_INTERNAL_VREF = 1,C_UIPARAM_DDR_TRAIN_READ_GATE = 1,C_GPIO_EMIO_GPIO_IO = 1,C_GPIO_EMIO_GPIO_ENABLE = 1,C_GPIO_PERIPHERAL_ENABLE = 1,C_GPIO_V2.00.A_C_EN_EMIO_GPIO = 1,C:GPIO_EMIO_GPIO_WIDTH = 1,C_PRESET_BANK1_VOLTAGE = LVCMOS 1.8V,C_PRESET_FPGA_PARTNUMBER = xc7z010clg400-1,C_CAN_PERIPHERAL_FREQMHZ = 100,C_FPGA1_PERIPHERAL_FREQMHZ = 153.000000,C_PRESET_GLOBAL_DEFAULT = powerup,C_PRESET_BANK0_VOLTAGE = LVCMOS 1.8V,C_PRESET_FPGA_SPEED = -1,C_SPI_PERIPHERAL_FREQMHZ = 120.000000,C_SDIO_PERIPHERAL_FREQMHZ = 50.000000,C_FPGA2_PERIPHERAL_FREQMHZ = 100.000000,C_FPGA0_PERIPHERAL_FREQMHZ = 200.000000,C_PRESET_GLOBAL_CONFIG = Default}" *)

  (* BOX_TYPE = "user_black_box" *)
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

  (* BOX_TYPE = "user_black_box" *)
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

  (* BOX_TYPE = "user_black_box" *)
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

  (* BOX_TYPE = "user_black_box" *)
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

  (* BOX_TYPE = "user_black_box" *)
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

  (* BOX_TYPE = "user_black_box" *)
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
      .rst ( pldma_mrd_0_rst )
    );

  (* BOX_TYPE = "user_black_box" *)
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

  (* BOX_TYPE = "user_black_box" *)
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

  (* BOX_TYPE = "user_black_box" *)
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

module cpu0_processing_system7_0_wrapper
  (
    CAN0_PHY_TX,
    CAN0_PHY_RX,
    CAN1_PHY_TX,
    CAN1_PHY_RX,
    ENET0_GMII_TX_EN,
    ENET0_GMII_TX_ER,
    ENET0_MDIO_MDC,
    ENET0_MDIO_O,
    ENET0_MDIO_T,
    ENET0_PTP_DELAY_REQ_RX,
    ENET0_PTP_DELAY_REQ_TX,
    ENET0_PTP_PDELAY_REQ_RX,
    ENET0_PTP_PDELAY_REQ_TX,
    ENET0_PTP_PDELAY_RESP_RX,
    ENET0_PTP_PDELAY_RESP_TX,
    ENET0_PTP_SYNC_FRAME_RX,
    ENET0_PTP_SYNC_FRAME_TX,
    ENET0_SOF_RX,
    ENET0_SOF_TX,
    ENET0_GMII_TXD,
    ENET0_GMII_COL,
    ENET0_GMII_CRS,
    ENET0_EXT_INTIN,
    ENET0_GMII_RX_CLK,
    ENET0_GMII_RX_DV,
    ENET0_GMII_RX_ER,
    ENET0_GMII_TX_CLK,
    ENET0_MDIO_I,
    ENET0_GMII_RXD,
    ENET1_GMII_TX_EN,
    ENET1_GMII_TX_ER,
    ENET1_MDIO_MDC,
    ENET1_MDIO_O,
    ENET1_MDIO_T,
    ENET1_PTP_DELAY_REQ_RX,
    ENET1_PTP_DELAY_REQ_TX,
    ENET1_PTP_PDELAY_REQ_RX,
    ENET1_PTP_PDELAY_REQ_TX,
    ENET1_PTP_PDELAY_RESP_RX,
    ENET1_PTP_PDELAY_RESP_TX,
    ENET1_PTP_SYNC_FRAME_RX,
    ENET1_PTP_SYNC_FRAME_TX,
    ENET1_SOF_RX,
    ENET1_SOF_TX,
    ENET1_GMII_TXD,
    ENET1_GMII_COL,
    ENET1_GMII_CRS,
    ENET1_EXT_INTIN,
    ENET1_GMII_RX_CLK,
    ENET1_GMII_RX_DV,
    ENET1_GMII_RX_ER,
    ENET1_GMII_TX_CLK,
    ENET1_MDIO_I,
    ENET1_GMII_RXD,
    GPIO_I,
    GPIO_O,
    GPIO_T,
    I2C0_SDA_I,
    I2C0_SDA_O,
    I2C0_SDA_T,
    I2C0_SCL_I,
    I2C0_SCL_O,
    I2C0_SCL_T,
    I2C1_SDA_I,
    I2C1_SDA_O,
    I2C1_SDA_T,
    I2C1_SCL_I,
    I2C1_SCL_O,
    I2C1_SCL_T,
    PJTAG_TCK,
    PJTAG_TMS,
    PJTAG_TD_I,
    PJTAG_TD_T,
    PJTAG_TD_O,
    SDIO0_CLK,
    SDIO0_CLK_FB,
    SDIO0_CMD_O,
    SDIO0_CMD_I,
    SDIO0_CMD_T,
    SDIO0_DATA_I,
    SDIO0_DATA_O,
    SDIO0_DATA_T,
    SDIO0_LED,
    SDIO0_CDN,
    SDIO0_WP,
    SDIO0_BUSPOW,
    SDIO0_BUSVOLT,
    SDIO1_CLK,
    SDIO1_CLK_FB,
    SDIO1_CMD_O,
    SDIO1_CMD_I,
    SDIO1_CMD_T,
    SDIO1_DATA_I,
    SDIO1_DATA_O,
    SDIO1_DATA_T,
    SDIO1_LED,
    SDIO1_CDN,
    SDIO1_WP,
    SDIO1_BUSPOW,
    SDIO1_BUSVOLT,
    SPI0_SCLK_I,
    SPI0_SCLK_O,
    SPI0_SCLK_T,
    SPI0_MOSI_I,
    SPI0_MOSI_O,
    SPI0_MOSI_T,
    SPI0_MISO_I,
    SPI0_MISO_O,
    SPI0_MISO_T,
    SPI0_SS_I,
    SPI0_SS_O,
    SPI0_SS1_O,
    SPI0_SS2_O,
    SPI0_SS_T,
    SPI1_SCLK_I,
    SPI1_SCLK_O,
    SPI1_SCLK_T,
    SPI1_MOSI_I,
    SPI1_MOSI_O,
    SPI1_MOSI_T,
    SPI1_MISO_I,
    SPI1_MISO_O,
    SPI1_MISO_T,
    SPI1_SS_I,
    SPI1_SS_O,
    SPI1_SS1_O,
    SPI1_SS2_O,
    SPI1_SS_T,
    UART0_DTRN,
    UART0_RTSN,
    UART0_TX,
    UART0_CTSN,
    UART0_DCDN,
    UART0_DSRN,
    UART0_RIN,
    UART0_RX,
    UART1_DTRN,
    UART1_RTSN,
    UART1_TX,
    UART1_CTSN,
    UART1_DCDN,
    UART1_DSRN,
    UART1_RIN,
    UART1_RX,
    TTC0_WAVE0_OUT,
    TTC0_WAVE1_OUT,
    TTC0_WAVE2_OUT,
    TTC0_CLK0_IN,
    TTC0_CLK1_IN,
    TTC0_CLK2_IN,
    TTC1_WAVE0_OUT,
    TTC1_WAVE1_OUT,
    TTC1_WAVE2_OUT,
    TTC1_CLK0_IN,
    TTC1_CLK1_IN,
    TTC1_CLK2_IN,
    WDT_CLK_IN,
    WDT_RST_OUT,
    TRACE_CLK,
    TRACE_CTL,
    TRACE_DATA,
    USB0_PORT_INDCTL,
    USB1_PORT_INDCTL,
    USB0_VBUS_PWRSELECT,
    USB1_VBUS_PWRSELECT,
    USB0_VBUS_PWRFAULT,
    USB1_VBUS_PWRFAULT,
    SRAM_INTIN,
    M_AXI_GP0_ARESETN,
    M_AXI_GP0_ARVALID,
    M_AXI_GP0_AWVALID,
    M_AXI_GP0_BREADY,
    M_AXI_GP0_RREADY,
    M_AXI_GP0_WLAST,
    M_AXI_GP0_WVALID,
    M_AXI_GP0_ARID,
    M_AXI_GP0_AWID,
    M_AXI_GP0_WID,
    M_AXI_GP0_ARBURST,
    M_AXI_GP0_ARLOCK,
    M_AXI_GP0_ARSIZE,
    M_AXI_GP0_AWBURST,
    M_AXI_GP0_AWLOCK,
    M_AXI_GP0_AWSIZE,
    M_AXI_GP0_ARPROT,
    M_AXI_GP0_AWPROT,
    M_AXI_GP0_ARADDR,
    M_AXI_GP0_AWADDR,
    M_AXI_GP0_WDATA,
    M_AXI_GP0_ARCACHE,
    M_AXI_GP0_ARLEN,
    M_AXI_GP0_ARQOS,
    M_AXI_GP0_AWCACHE,
    M_AXI_GP0_AWLEN,
    M_AXI_GP0_AWQOS,
    M_AXI_GP0_WSTRB,
    M_AXI_GP0_ACLK,
    M_AXI_GP0_ARREADY,
    M_AXI_GP0_AWREADY,
    M_AXI_GP0_BVALID,
    M_AXI_GP0_RLAST,
    M_AXI_GP0_RVALID,
    M_AXI_GP0_WREADY,
    M_AXI_GP0_BID,
    M_AXI_GP0_RID,
    M_AXI_GP0_BRESP,
    M_AXI_GP0_RRESP,
    M_AXI_GP0_RDATA,
    M_AXI_GP1_ARESETN,
    M_AXI_GP1_ARVALID,
    M_AXI_GP1_AWVALID,
    M_AXI_GP1_BREADY,
    M_AXI_GP1_RREADY,
    M_AXI_GP1_WLAST,
    M_AXI_GP1_WVALID,
    M_AXI_GP1_ARID,
    M_AXI_GP1_AWID,
    M_AXI_GP1_WID,
    M_AXI_GP1_ARBURST,
    M_AXI_GP1_ARLOCK,
    M_AXI_GP1_ARSIZE,
    M_AXI_GP1_AWBURST,
    M_AXI_GP1_AWLOCK,
    M_AXI_GP1_AWSIZE,
    M_AXI_GP1_ARPROT,
    M_AXI_GP1_AWPROT,
    M_AXI_GP1_ARADDR,
    M_AXI_GP1_AWADDR,
    M_AXI_GP1_WDATA,
    M_AXI_GP1_ARCACHE,
    M_AXI_GP1_ARLEN,
    M_AXI_GP1_ARQOS,
    M_AXI_GP1_AWCACHE,
    M_AXI_GP1_AWLEN,
    M_AXI_GP1_AWQOS,
    M_AXI_GP1_WSTRB,
    M_AXI_GP1_ACLK,
    M_AXI_GP1_ARREADY,
    M_AXI_GP1_AWREADY,
    M_AXI_GP1_BVALID,
    M_AXI_GP1_RLAST,
    M_AXI_GP1_RVALID,
    M_AXI_GP1_WREADY,
    M_AXI_GP1_BID,
    M_AXI_GP1_RID,
    M_AXI_GP1_BRESP,
    M_AXI_GP1_RRESP,
    M_AXI_GP1_RDATA,
    S_AXI_GP0_ARESETN,
    S_AXI_GP0_ARREADY,
    S_AXI_GP0_AWREADY,
    S_AXI_GP0_BVALID,
    S_AXI_GP0_RLAST,
    S_AXI_GP0_RVALID,
    S_AXI_GP0_WREADY,
    S_AXI_GP0_BRESP,
    S_AXI_GP0_RRESP,
    S_AXI_GP0_RDATA,
    S_AXI_GP0_BID,
    S_AXI_GP0_RID,
    S_AXI_GP0_ACLK,
    S_AXI_GP0_ARVALID,
    S_AXI_GP0_AWVALID,
    S_AXI_GP0_BREADY,
    S_AXI_GP0_RREADY,
    S_AXI_GP0_WLAST,
    S_AXI_GP0_WVALID,
    S_AXI_GP0_ARBURST,
    S_AXI_GP0_ARLOCK,
    S_AXI_GP0_ARSIZE,
    S_AXI_GP0_AWBURST,
    S_AXI_GP0_AWLOCK,
    S_AXI_GP0_AWSIZE,
    S_AXI_GP0_ARPROT,
    S_AXI_GP0_AWPROT,
    S_AXI_GP0_ARADDR,
    S_AXI_GP0_AWADDR,
    S_AXI_GP0_WDATA,
    S_AXI_GP0_ARCACHE,
    S_AXI_GP0_ARLEN,
    S_AXI_GP0_ARQOS,
    S_AXI_GP0_AWCACHE,
    S_AXI_GP0_AWLEN,
    S_AXI_GP0_AWQOS,
    S_AXI_GP0_WSTRB,
    S_AXI_GP0_ARID,
    S_AXI_GP0_AWID,
    S_AXI_GP0_WID,
    S_AXI_GP1_ARESETN,
    S_AXI_GP1_ARREADY,
    S_AXI_GP1_AWREADY,
    S_AXI_GP1_BVALID,
    S_AXI_GP1_RLAST,
    S_AXI_GP1_RVALID,
    S_AXI_GP1_WREADY,
    S_AXI_GP1_BRESP,
    S_AXI_GP1_RRESP,
    S_AXI_GP1_RDATA,
    S_AXI_GP1_BID,
    S_AXI_GP1_RID,
    S_AXI_GP1_ACLK,
    S_AXI_GP1_ARVALID,
    S_AXI_GP1_AWVALID,
    S_AXI_GP1_BREADY,
    S_AXI_GP1_RREADY,
    S_AXI_GP1_WLAST,
    S_AXI_GP1_WVALID,
    S_AXI_GP1_ARBURST,
    S_AXI_GP1_ARLOCK,
    S_AXI_GP1_ARSIZE,
    S_AXI_GP1_AWBURST,
    S_AXI_GP1_AWLOCK,
    S_AXI_GP1_AWSIZE,
    S_AXI_GP1_ARPROT,
    S_AXI_GP1_AWPROT,
    S_AXI_GP1_ARADDR,
    S_AXI_GP1_AWADDR,
    S_AXI_GP1_WDATA,
    S_AXI_GP1_ARCACHE,
    S_AXI_GP1_ARLEN,
    S_AXI_GP1_ARQOS,
    S_AXI_GP1_AWCACHE,
    S_AXI_GP1_AWLEN,
    S_AXI_GP1_AWQOS,
    S_AXI_GP1_WSTRB,
    S_AXI_GP1_ARID,
    S_AXI_GP1_AWID,
    S_AXI_GP1_WID,
    S_AXI_ACP_ARESETN,
    S_AXI_ACP_AWREADY,
    S_AXI_ACP_ARREADY,
    S_AXI_ACP_BVALID,
    S_AXI_ACP_RLAST,
    S_AXI_ACP_RVALID,
    S_AXI_ACP_WREADY,
    S_AXI_ACP_BRESP,
    S_AXI_ACP_RRESP,
    S_AXI_ACP_BID,
    S_AXI_ACP_RID,
    S_AXI_ACP_RDATA,
    S_AXI_ACP_ACLK,
    S_AXI_ACP_ARVALID,
    S_AXI_ACP_AWVALID,
    S_AXI_ACP_BREADY,
    S_AXI_ACP_RREADY,
    S_AXI_ACP_WLAST,
    S_AXI_ACP_WVALID,
    S_AXI_ACP_ARID,
    S_AXI_ACP_ARPROT,
    S_AXI_ACP_AWID,
    S_AXI_ACP_AWPROT,
    S_AXI_ACP_WID,
    S_AXI_ACP_ARADDR,
    S_AXI_ACP_AWADDR,
    S_AXI_ACP_ARCACHE,
    S_AXI_ACP_ARLEN,
    S_AXI_ACP_ARQOS,
    S_AXI_ACP_AWCACHE,
    S_AXI_ACP_AWLEN,
    S_AXI_ACP_AWQOS,
    S_AXI_ACP_ARBURST,
    S_AXI_ACP_ARLOCK,
    S_AXI_ACP_ARSIZE,
    S_AXI_ACP_AWBURST,
    S_AXI_ACP_AWLOCK,
    S_AXI_ACP_AWSIZE,
    S_AXI_ACP_ARUSER,
    S_AXI_ACP_AWUSER,
    S_AXI_ACP_WDATA,
    S_AXI_ACP_WSTRB,
    S_AXI_HP0_ARESETN,
    S_AXI_HP0_ARREADY,
    S_AXI_HP0_AWREADY,
    S_AXI_HP0_BVALID,
    S_AXI_HP0_RLAST,
    S_AXI_HP0_RVALID,
    S_AXI_HP0_WREADY,
    S_AXI_HP0_BRESP,
    S_AXI_HP0_RRESP,
    S_AXI_HP0_BID,
    S_AXI_HP0_RID,
    S_AXI_HP0_RDATA,
    S_AXI_HP0_RCOUNT,
    S_AXI_HP0_WCOUNT,
    S_AXI_HP0_RACOUNT,
    S_AXI_HP0_WACOUNT,
    S_AXI_HP0_ACLK,
    S_AXI_HP0_ARVALID,
    S_AXI_HP0_AWVALID,
    S_AXI_HP0_BREADY,
    S_AXI_HP0_RDISSUECAP1_EN,
    S_AXI_HP0_RREADY,
    S_AXI_HP0_WLAST,
    S_AXI_HP0_WRISSUECAP1_EN,
    S_AXI_HP0_WVALID,
    S_AXI_HP0_ARBURST,
    S_AXI_HP0_ARLOCK,
    S_AXI_HP0_ARSIZE,
    S_AXI_HP0_AWBURST,
    S_AXI_HP0_AWLOCK,
    S_AXI_HP0_AWSIZE,
    S_AXI_HP0_ARPROT,
    S_AXI_HP0_AWPROT,
    S_AXI_HP0_ARADDR,
    S_AXI_HP0_AWADDR,
    S_AXI_HP0_ARCACHE,
    S_AXI_HP0_ARLEN,
    S_AXI_HP0_ARQOS,
    S_AXI_HP0_AWCACHE,
    S_AXI_HP0_AWLEN,
    S_AXI_HP0_AWQOS,
    S_AXI_HP0_ARID,
    S_AXI_HP0_AWID,
    S_AXI_HP0_WID,
    S_AXI_HP0_WDATA,
    S_AXI_HP0_WSTRB,
    S_AXI_HP1_ARESETN,
    S_AXI_HP1_ARREADY,
    S_AXI_HP1_AWREADY,
    S_AXI_HP1_BVALID,
    S_AXI_HP1_RLAST,
    S_AXI_HP1_RVALID,
    S_AXI_HP1_WREADY,
    S_AXI_HP1_BRESP,
    S_AXI_HP1_RRESP,
    S_AXI_HP1_BID,
    S_AXI_HP1_RID,
    S_AXI_HP1_RDATA,
    S_AXI_HP1_RCOUNT,
    S_AXI_HP1_WCOUNT,
    S_AXI_HP1_RACOUNT,
    S_AXI_HP1_WACOUNT,
    S_AXI_HP1_ACLK,
    S_AXI_HP1_ARVALID,
    S_AXI_HP1_AWVALID,
    S_AXI_HP1_BREADY,
    S_AXI_HP1_RDISSUECAP1_EN,
    S_AXI_HP1_RREADY,
    S_AXI_HP1_WLAST,
    S_AXI_HP1_WRISSUECAP1_EN,
    S_AXI_HP1_WVALID,
    S_AXI_HP1_ARBURST,
    S_AXI_HP1_ARLOCK,
    S_AXI_HP1_ARSIZE,
    S_AXI_HP1_AWBURST,
    S_AXI_HP1_AWLOCK,
    S_AXI_HP1_AWSIZE,
    S_AXI_HP1_ARPROT,
    S_AXI_HP1_AWPROT,
    S_AXI_HP1_ARADDR,
    S_AXI_HP1_AWADDR,
    S_AXI_HP1_ARCACHE,
    S_AXI_HP1_ARLEN,
    S_AXI_HP1_ARQOS,
    S_AXI_HP1_AWCACHE,
    S_AXI_HP1_AWLEN,
    S_AXI_HP1_AWQOS,
    S_AXI_HP1_ARID,
    S_AXI_HP1_AWID,
    S_AXI_HP1_WID,
    S_AXI_HP1_WDATA,
    S_AXI_HP1_WSTRB,
    S_AXI_HP2_ARESETN,
    S_AXI_HP2_ARREADY,
    S_AXI_HP2_AWREADY,
    S_AXI_HP2_BVALID,
    S_AXI_HP2_RLAST,
    S_AXI_HP2_RVALID,
    S_AXI_HP2_WREADY,
    S_AXI_HP2_BRESP,
    S_AXI_HP2_RRESP,
    S_AXI_HP2_BID,
    S_AXI_HP2_RID,
    S_AXI_HP2_RDATA,
    S_AXI_HP2_RCOUNT,
    S_AXI_HP2_WCOUNT,
    S_AXI_HP2_RACOUNT,
    S_AXI_HP2_WACOUNT,
    S_AXI_HP2_ACLK,
    S_AXI_HP2_ARVALID,
    S_AXI_HP2_AWVALID,
    S_AXI_HP2_BREADY,
    S_AXI_HP2_RDISSUECAP1_EN,
    S_AXI_HP2_RREADY,
    S_AXI_HP2_WLAST,
    S_AXI_HP2_WRISSUECAP1_EN,
    S_AXI_HP2_WVALID,
    S_AXI_HP2_ARBURST,
    S_AXI_HP2_ARLOCK,
    S_AXI_HP2_ARSIZE,
    S_AXI_HP2_AWBURST,
    S_AXI_HP2_AWLOCK,
    S_AXI_HP2_AWSIZE,
    S_AXI_HP2_ARPROT,
    S_AXI_HP2_AWPROT,
    S_AXI_HP2_ARADDR,
    S_AXI_HP2_AWADDR,
    S_AXI_HP2_ARCACHE,
    S_AXI_HP2_ARLEN,
    S_AXI_HP2_ARQOS,
    S_AXI_HP2_AWCACHE,
    S_AXI_HP2_AWLEN,
    S_AXI_HP2_AWQOS,
    S_AXI_HP2_ARID,
    S_AXI_HP2_AWID,
    S_AXI_HP2_WID,
    S_AXI_HP2_WDATA,
    S_AXI_HP2_WSTRB,
    S_AXI_HP3_ARESETN,
    S_AXI_HP3_ARREADY,
    S_AXI_HP3_AWREADY,
    S_AXI_HP3_BVALID,
    S_AXI_HP3_RLAST,
    S_AXI_HP3_RVALID,
    S_AXI_HP3_WREADY,
    S_AXI_HP3_BRESP,
    S_AXI_HP3_RRESP,
    S_AXI_HP3_BID,
    S_AXI_HP3_RID,
    S_AXI_HP3_RDATA,
    S_AXI_HP3_RCOUNT,
    S_AXI_HP3_WCOUNT,
    S_AXI_HP3_RACOUNT,
    S_AXI_HP3_WACOUNT,
    S_AXI_HP3_ACLK,
    S_AXI_HP3_ARVALID,
    S_AXI_HP3_AWVALID,
    S_AXI_HP3_BREADY,
    S_AXI_HP3_RDISSUECAP1_EN,
    S_AXI_HP3_RREADY,
    S_AXI_HP3_WLAST,
    S_AXI_HP3_WRISSUECAP1_EN,
    S_AXI_HP3_WVALID,
    S_AXI_HP3_ARBURST,
    S_AXI_HP3_ARLOCK,
    S_AXI_HP3_ARSIZE,
    S_AXI_HP3_AWBURST,
    S_AXI_HP3_AWLOCK,
    S_AXI_HP3_AWSIZE,
    S_AXI_HP3_ARPROT,
    S_AXI_HP3_AWPROT,
    S_AXI_HP3_ARADDR,
    S_AXI_HP3_AWADDR,
    S_AXI_HP3_ARCACHE,
    S_AXI_HP3_ARLEN,
    S_AXI_HP3_ARQOS,
    S_AXI_HP3_AWCACHE,
    S_AXI_HP3_AWLEN,
    S_AXI_HP3_AWQOS,
    S_AXI_HP3_ARID,
    S_AXI_HP3_AWID,
    S_AXI_HP3_WID,
    S_AXI_HP3_WDATA,
    S_AXI_HP3_WSTRB,
    DMA0_DATYPE,
    DMA0_DAVALID,
    DMA0_DRREADY,
    DMA0_RSTN,
    DMA0_ACLK,
    DMA0_DAREADY,
    DMA0_DRLAST,
    DMA0_DRVALID,
    DMA0_DRTYPE,
    DMA1_DATYPE,
    DMA1_DAVALID,
    DMA1_DRREADY,
    DMA1_RSTN,
    DMA1_ACLK,
    DMA1_DAREADY,
    DMA1_DRLAST,
    DMA1_DRVALID,
    DMA1_DRTYPE,
    DMA2_DATYPE,
    DMA2_DAVALID,
    DMA2_DRREADY,
    DMA2_RSTN,
    DMA2_ACLK,
    DMA2_DAREADY,
    DMA2_DRLAST,
    DMA2_DRVALID,
    DMA3_DRVALID,
    DMA3_DATYPE,
    DMA3_DAVALID,
    DMA3_DRREADY,
    DMA3_RSTN,
    DMA3_ACLK,
    DMA3_DAREADY,
    DMA3_DRLAST,
    DMA2_DRTYPE,
    DMA3_DRTYPE,
    FTMD_TRACEIN_DATA,
    FTMD_TRACEIN_VALID,
    FTMD_TRACEIN_CLK,
    FTMD_TRACEIN_ATID,
    FTMT_F2P_TRIG,
    FTMT_F2P_TRIGACK,
    FTMT_F2P_DEBUG,
    FTMT_P2F_TRIGACK,
    FTMT_P2F_TRIG,
    FTMT_P2F_DEBUG,
    FCLK_CLK3,
    FCLK_CLK2,
    FCLK_CLK1,
    FCLK_CLK0,
    FCLK_CLKTRIG3_N,
    FCLK_CLKTRIG2_N,
    FCLK_CLKTRIG1_N,
    FCLK_CLKTRIG0_N,
    FCLK_RESET3_N,
    FCLK_RESET2_N,
    FCLK_RESET1_N,
    FCLK_RESET0_N,
    FPGA_IDLE_N,
    DDR_ARB,
    IRQ_F2P,
    Core0_nFIQ,
    Core0_nIRQ,
    Core1_nFIQ,
    Core1_nIRQ,
    EVENT_EVENTO,
    EVENT_STANDBYWFE,
    EVENT_STANDBYWFI,
    EVENT_EVENTI,
    MIO,
    DDR_Clk,
    DDR_Clk_n,
    DDR_CKE,
    DDR_CS_n,
    DDR_RAS_n,
    DDR_CAS_n,
    DDR_WEB,
    DDR_BankAddr,
    DDR_Addr,
    DDR_ODT,
    DDR_DRSTB,
    DDR_DQ,
    DDR_DM,
    DDR_DQS,
    DDR_DQS_n,
    DDR_VRN,
    DDR_VRP,
    PS_SRSTB,
    PS_CLK,
    PS_PORB,
    IRQ_P2F_DMAC_ABORT,
    IRQ_P2F_DMAC0,
    IRQ_P2F_DMAC1,
    IRQ_P2F_DMAC2,
    IRQ_P2F_DMAC3,
    IRQ_P2F_DMAC4,
    IRQ_P2F_DMAC5,
    IRQ_P2F_DMAC6,
    IRQ_P2F_DMAC7,
    IRQ_P2F_SMC,
    IRQ_P2F_QSPI,
    IRQ_P2F_CTI,
    IRQ_P2F_GPIO,
    IRQ_P2F_USB0,
    IRQ_P2F_ENET0,
    IRQ_P2F_ENET_WAKE0,
    IRQ_P2F_SDIO0,
    IRQ_P2F_I2C0,
    IRQ_P2F_SPI0,
    IRQ_P2F_UART0,
    IRQ_P2F_CAN0,
    IRQ_P2F_USB1,
    IRQ_P2F_ENET1,
    IRQ_P2F_ENET_WAKE1,
    IRQ_P2F_SDIO1,
    IRQ_P2F_I2C1,
    IRQ_P2F_SPI1,
    IRQ_P2F_UART1,
    IRQ_P2F_CAN1
  );
  output CAN0_PHY_TX;
  input CAN0_PHY_RX;
  output CAN1_PHY_TX;
  input CAN1_PHY_RX;
  output ENET0_GMII_TX_EN;
  output ENET0_GMII_TX_ER;
  output ENET0_MDIO_MDC;
  output ENET0_MDIO_O;
  output ENET0_MDIO_T;
  output ENET0_PTP_DELAY_REQ_RX;
  output ENET0_PTP_DELAY_REQ_TX;
  output ENET0_PTP_PDELAY_REQ_RX;
  output ENET0_PTP_PDELAY_REQ_TX;
  output ENET0_PTP_PDELAY_RESP_RX;
  output ENET0_PTP_PDELAY_RESP_TX;
  output ENET0_PTP_SYNC_FRAME_RX;
  output ENET0_PTP_SYNC_FRAME_TX;
  output ENET0_SOF_RX;
  output ENET0_SOF_TX;
  output [7:0] ENET0_GMII_TXD;
  input ENET0_GMII_COL;
  input ENET0_GMII_CRS;
  input ENET0_EXT_INTIN;
  input ENET0_GMII_RX_CLK;
  input ENET0_GMII_RX_DV;
  input ENET0_GMII_RX_ER;
  input ENET0_GMII_TX_CLK;
  input ENET0_MDIO_I;
  input [7:0] ENET0_GMII_RXD;
  output ENET1_GMII_TX_EN;
  output ENET1_GMII_TX_ER;
  output ENET1_MDIO_MDC;
  output ENET1_MDIO_O;
  output ENET1_MDIO_T;
  output ENET1_PTP_DELAY_REQ_RX;
  output ENET1_PTP_DELAY_REQ_TX;
  output ENET1_PTP_PDELAY_REQ_RX;
  output ENET1_PTP_PDELAY_REQ_TX;
  output ENET1_PTP_PDELAY_RESP_RX;
  output ENET1_PTP_PDELAY_RESP_TX;
  output ENET1_PTP_SYNC_FRAME_RX;
  output ENET1_PTP_SYNC_FRAME_TX;
  output ENET1_SOF_RX;
  output ENET1_SOF_TX;
  output [7:0] ENET1_GMII_TXD;
  input ENET1_GMII_COL;
  input ENET1_GMII_CRS;
  input ENET1_EXT_INTIN;
  input ENET1_GMII_RX_CLK;
  input ENET1_GMII_RX_DV;
  input ENET1_GMII_RX_ER;
  input ENET1_GMII_TX_CLK;
  input ENET1_MDIO_I;
  input [7:0] ENET1_GMII_RXD;
  input [0:0] GPIO_I;
  output [0:0] GPIO_O;
  output [0:0] GPIO_T;
  input I2C0_SDA_I;
  output I2C0_SDA_O;
  output I2C0_SDA_T;
  input I2C0_SCL_I;
  output I2C0_SCL_O;
  output I2C0_SCL_T;
  input I2C1_SDA_I;
  output I2C1_SDA_O;
  output I2C1_SDA_T;
  input I2C1_SCL_I;
  output I2C1_SCL_O;
  output I2C1_SCL_T;
  input PJTAG_TCK;
  input PJTAG_TMS;
  input PJTAG_TD_I;
  output PJTAG_TD_T;
  output PJTAG_TD_O;
  output SDIO0_CLK;
  input SDIO0_CLK_FB;
  output SDIO0_CMD_O;
  input SDIO0_CMD_I;
  output SDIO0_CMD_T;
  input [3:0] SDIO0_DATA_I;
  output [3:0] SDIO0_DATA_O;
  output [3:0] SDIO0_DATA_T;
  output SDIO0_LED;
  input SDIO0_CDN;
  input SDIO0_WP;
  output SDIO0_BUSPOW;
  output [2:0] SDIO0_BUSVOLT;
  output SDIO1_CLK;
  input SDIO1_CLK_FB;
  output SDIO1_CMD_O;
  input SDIO1_CMD_I;
  output SDIO1_CMD_T;
  input [3:0] SDIO1_DATA_I;
  output [3:0] SDIO1_DATA_O;
  output [3:0] SDIO1_DATA_T;
  output SDIO1_LED;
  input SDIO1_CDN;
  input SDIO1_WP;
  output SDIO1_BUSPOW;
  output [2:0] SDIO1_BUSVOLT;
  input SPI0_SCLK_I;
  output SPI0_SCLK_O;
  output SPI0_SCLK_T;
  input SPI0_MOSI_I;
  output SPI0_MOSI_O;
  output SPI0_MOSI_T;
  input SPI0_MISO_I;
  output SPI0_MISO_O;
  output SPI0_MISO_T;
  input SPI0_SS_I;
  output SPI0_SS_O;
  output SPI0_SS1_O;
  output SPI0_SS2_O;
  output SPI0_SS_T;
  input SPI1_SCLK_I;
  output SPI1_SCLK_O;
  output SPI1_SCLK_T;
  input SPI1_MOSI_I;
  output SPI1_MOSI_O;
  output SPI1_MOSI_T;
  input SPI1_MISO_I;
  output SPI1_MISO_O;
  output SPI1_MISO_T;
  input SPI1_SS_I;
  output SPI1_SS_O;
  output SPI1_SS1_O;
  output SPI1_SS2_O;
  output SPI1_SS_T;
  output UART0_DTRN;
  output UART0_RTSN;
  output UART0_TX;
  input UART0_CTSN;
  input UART0_DCDN;
  input UART0_DSRN;
  input UART0_RIN;
  input UART0_RX;
  output UART1_DTRN;
  output UART1_RTSN;
  output UART1_TX;
  input UART1_CTSN;
  input UART1_DCDN;
  input UART1_DSRN;
  input UART1_RIN;
  input UART1_RX;
  output TTC0_WAVE0_OUT;
  output TTC0_WAVE1_OUT;
  output TTC0_WAVE2_OUT;
  input TTC0_CLK0_IN;
  input TTC0_CLK1_IN;
  input TTC0_CLK2_IN;
  output TTC1_WAVE0_OUT;
  output TTC1_WAVE1_OUT;
  output TTC1_WAVE2_OUT;
  input TTC1_CLK0_IN;
  input TTC1_CLK1_IN;
  input TTC1_CLK2_IN;
  input WDT_CLK_IN;
  output WDT_RST_OUT;
  input TRACE_CLK;
  output TRACE_CTL;
  output [31:0] TRACE_DATA;
  output [1:0] USB0_PORT_INDCTL;
  output [1:0] USB1_PORT_INDCTL;
  output USB0_VBUS_PWRSELECT;
  output USB1_VBUS_PWRSELECT;
  input USB0_VBUS_PWRFAULT;
  input USB1_VBUS_PWRFAULT;
  input SRAM_INTIN;
  output M_AXI_GP0_ARESETN;
  output M_AXI_GP0_ARVALID;
  output M_AXI_GP0_AWVALID;
  output M_AXI_GP0_BREADY;
  output M_AXI_GP0_RREADY;
  output M_AXI_GP0_WLAST;
  output M_AXI_GP0_WVALID;
  output [11:0] M_AXI_GP0_ARID;
  output [11:0] M_AXI_GP0_AWID;
  output [11:0] M_AXI_GP0_WID;
  output [1:0] M_AXI_GP0_ARBURST;
  output [1:0] M_AXI_GP0_ARLOCK;
  output [2:0] M_AXI_GP0_ARSIZE;
  output [1:0] M_AXI_GP0_AWBURST;
  output [1:0] M_AXI_GP0_AWLOCK;
  output [2:0] M_AXI_GP0_AWSIZE;
  output [2:0] M_AXI_GP0_ARPROT;
  output [2:0] M_AXI_GP0_AWPROT;
  output [31:0] M_AXI_GP0_ARADDR;
  output [31:0] M_AXI_GP0_AWADDR;
  output [31:0] M_AXI_GP0_WDATA;
  output [3:0] M_AXI_GP0_ARCACHE;
  output [3:0] M_AXI_GP0_ARLEN;
  output [3:0] M_AXI_GP0_ARQOS;
  output [3:0] M_AXI_GP0_AWCACHE;
  output [3:0] M_AXI_GP0_AWLEN;
  output [3:0] M_AXI_GP0_AWQOS;
  output [3:0] M_AXI_GP0_WSTRB;
  input M_AXI_GP0_ACLK;
  input M_AXI_GP0_ARREADY;
  input M_AXI_GP0_AWREADY;
  input M_AXI_GP0_BVALID;
  input M_AXI_GP0_RLAST;
  input M_AXI_GP0_RVALID;
  input M_AXI_GP0_WREADY;
  input [11:0] M_AXI_GP0_BID;
  input [11:0] M_AXI_GP0_RID;
  input [1:0] M_AXI_GP0_BRESP;
  input [1:0] M_AXI_GP0_RRESP;
  input [31:0] M_AXI_GP0_RDATA;
  output M_AXI_GP1_ARESETN;
  output M_AXI_GP1_ARVALID;
  output M_AXI_GP1_AWVALID;
  output M_AXI_GP1_BREADY;
  output M_AXI_GP1_RREADY;
  output M_AXI_GP1_WLAST;
  output M_AXI_GP1_WVALID;
  output [11:0] M_AXI_GP1_ARID;
  output [11:0] M_AXI_GP1_AWID;
  output [11:0] M_AXI_GP1_WID;
  output [1:0] M_AXI_GP1_ARBURST;
  output [1:0] M_AXI_GP1_ARLOCK;
  output [2:0] M_AXI_GP1_ARSIZE;
  output [1:0] M_AXI_GP1_AWBURST;
  output [1:0] M_AXI_GP1_AWLOCK;
  output [2:0] M_AXI_GP1_AWSIZE;
  output [2:0] M_AXI_GP1_ARPROT;
  output [2:0] M_AXI_GP1_AWPROT;
  output [31:0] M_AXI_GP1_ARADDR;
  output [31:0] M_AXI_GP1_AWADDR;
  output [31:0] M_AXI_GP1_WDATA;
  output [3:0] M_AXI_GP1_ARCACHE;
  output [3:0] M_AXI_GP1_ARLEN;
  output [3:0] M_AXI_GP1_ARQOS;
  output [3:0] M_AXI_GP1_AWCACHE;
  output [3:0] M_AXI_GP1_AWLEN;
  output [3:0] M_AXI_GP1_AWQOS;
  output [3:0] M_AXI_GP1_WSTRB;
  input M_AXI_GP1_ACLK;
  input M_AXI_GP1_ARREADY;
  input M_AXI_GP1_AWREADY;
  input M_AXI_GP1_BVALID;
  input M_AXI_GP1_RLAST;
  input M_AXI_GP1_RVALID;
  input M_AXI_GP1_WREADY;
  input [11:0] M_AXI_GP1_BID;
  input [11:0] M_AXI_GP1_RID;
  input [1:0] M_AXI_GP1_BRESP;
  input [1:0] M_AXI_GP1_RRESP;
  input [31:0] M_AXI_GP1_RDATA;
  output S_AXI_GP0_ARESETN;
  output S_AXI_GP0_ARREADY;
  output S_AXI_GP0_AWREADY;
  output S_AXI_GP0_BVALID;
  output S_AXI_GP0_RLAST;
  output S_AXI_GP0_RVALID;
  output S_AXI_GP0_WREADY;
  output [1:0] S_AXI_GP0_BRESP;
  output [1:0] S_AXI_GP0_RRESP;
  output [31:0] S_AXI_GP0_RDATA;
  output [5:0] S_AXI_GP0_BID;
  output [5:0] S_AXI_GP0_RID;
  input S_AXI_GP0_ACLK;
  input S_AXI_GP0_ARVALID;
  input S_AXI_GP0_AWVALID;
  input S_AXI_GP0_BREADY;
  input S_AXI_GP0_RREADY;
  input S_AXI_GP0_WLAST;
  input S_AXI_GP0_WVALID;
  input [1:0] S_AXI_GP0_ARBURST;
  input [1:0] S_AXI_GP0_ARLOCK;
  input [2:0] S_AXI_GP0_ARSIZE;
  input [1:0] S_AXI_GP0_AWBURST;
  input [1:0] S_AXI_GP0_AWLOCK;
  input [2:0] S_AXI_GP0_AWSIZE;
  input [2:0] S_AXI_GP0_ARPROT;
  input [2:0] S_AXI_GP0_AWPROT;
  input [31:0] S_AXI_GP0_ARADDR;
  input [31:0] S_AXI_GP0_AWADDR;
  input [31:0] S_AXI_GP0_WDATA;
  input [3:0] S_AXI_GP0_ARCACHE;
  input [3:0] S_AXI_GP0_ARLEN;
  input [3:0] S_AXI_GP0_ARQOS;
  input [3:0] S_AXI_GP0_AWCACHE;
  input [3:0] S_AXI_GP0_AWLEN;
  input [3:0] S_AXI_GP0_AWQOS;
  input [3:0] S_AXI_GP0_WSTRB;
  input [5:0] S_AXI_GP0_ARID;
  input [5:0] S_AXI_GP0_AWID;
  input [5:0] S_AXI_GP0_WID;
  output S_AXI_GP1_ARESETN;
  output S_AXI_GP1_ARREADY;
  output S_AXI_GP1_AWREADY;
  output S_AXI_GP1_BVALID;
  output S_AXI_GP1_RLAST;
  output S_AXI_GP1_RVALID;
  output S_AXI_GP1_WREADY;
  output [1:0] S_AXI_GP1_BRESP;
  output [1:0] S_AXI_GP1_RRESP;
  output [31:0] S_AXI_GP1_RDATA;
  output [5:0] S_AXI_GP1_BID;
  output [5:0] S_AXI_GP1_RID;
  input S_AXI_GP1_ACLK;
  input S_AXI_GP1_ARVALID;
  input S_AXI_GP1_AWVALID;
  input S_AXI_GP1_BREADY;
  input S_AXI_GP1_RREADY;
  input S_AXI_GP1_WLAST;
  input S_AXI_GP1_WVALID;
  input [1:0] S_AXI_GP1_ARBURST;
  input [1:0] S_AXI_GP1_ARLOCK;
  input [2:0] S_AXI_GP1_ARSIZE;
  input [1:0] S_AXI_GP1_AWBURST;
  input [1:0] S_AXI_GP1_AWLOCK;
  input [2:0] S_AXI_GP1_AWSIZE;
  input [2:0] S_AXI_GP1_ARPROT;
  input [2:0] S_AXI_GP1_AWPROT;
  input [31:0] S_AXI_GP1_ARADDR;
  input [31:0] S_AXI_GP1_AWADDR;
  input [31:0] S_AXI_GP1_WDATA;
  input [3:0] S_AXI_GP1_ARCACHE;
  input [3:0] S_AXI_GP1_ARLEN;
  input [3:0] S_AXI_GP1_ARQOS;
  input [3:0] S_AXI_GP1_AWCACHE;
  input [3:0] S_AXI_GP1_AWLEN;
  input [3:0] S_AXI_GP1_AWQOS;
  input [3:0] S_AXI_GP1_WSTRB;
  input [5:0] S_AXI_GP1_ARID;
  input [5:0] S_AXI_GP1_AWID;
  input [5:0] S_AXI_GP1_WID;
  output S_AXI_ACP_ARESETN;
  output S_AXI_ACP_AWREADY;
  output S_AXI_ACP_ARREADY;
  output S_AXI_ACP_BVALID;
  output S_AXI_ACP_RLAST;
  output S_AXI_ACP_RVALID;
  output S_AXI_ACP_WREADY;
  output [1:0] S_AXI_ACP_BRESP;
  output [1:0] S_AXI_ACP_RRESP;
  output [2:0] S_AXI_ACP_BID;
  output [2:0] S_AXI_ACP_RID;
  output [63:0] S_AXI_ACP_RDATA;
  input S_AXI_ACP_ACLK;
  input S_AXI_ACP_ARVALID;
  input S_AXI_ACP_AWVALID;
  input S_AXI_ACP_BREADY;
  input S_AXI_ACP_RREADY;
  input S_AXI_ACP_WLAST;
  input S_AXI_ACP_WVALID;
  input [2:0] S_AXI_ACP_ARID;
  input [2:0] S_AXI_ACP_ARPROT;
  input [2:0] S_AXI_ACP_AWID;
  input [2:0] S_AXI_ACP_AWPROT;
  input [2:0] S_AXI_ACP_WID;
  input [31:0] S_AXI_ACP_ARADDR;
  input [31:0] S_AXI_ACP_AWADDR;
  input [3:0] S_AXI_ACP_ARCACHE;
  input [3:0] S_AXI_ACP_ARLEN;
  input [3:0] S_AXI_ACP_ARQOS;
  input [3:0] S_AXI_ACP_AWCACHE;
  input [3:0] S_AXI_ACP_AWLEN;
  input [3:0] S_AXI_ACP_AWQOS;
  input [1:0] S_AXI_ACP_ARBURST;
  input [1:0] S_AXI_ACP_ARLOCK;
  input [2:0] S_AXI_ACP_ARSIZE;
  input [1:0] S_AXI_ACP_AWBURST;
  input [1:0] S_AXI_ACP_AWLOCK;
  input [2:0] S_AXI_ACP_AWSIZE;
  input [4:0] S_AXI_ACP_ARUSER;
  input [4:0] S_AXI_ACP_AWUSER;
  input [63:0] S_AXI_ACP_WDATA;
  input [7:0] S_AXI_ACP_WSTRB;
  output S_AXI_HP0_ARESETN;
  output S_AXI_HP0_ARREADY;
  output S_AXI_HP0_AWREADY;
  output S_AXI_HP0_BVALID;
  output S_AXI_HP0_RLAST;
  output S_AXI_HP0_RVALID;
  output S_AXI_HP0_WREADY;
  output [1:0] S_AXI_HP0_BRESP;
  output [1:0] S_AXI_HP0_RRESP;
  output [0:0] S_AXI_HP0_BID;
  output [0:0] S_AXI_HP0_RID;
  output [63:0] S_AXI_HP0_RDATA;
  output [7:0] S_AXI_HP0_RCOUNT;
  output [7:0] S_AXI_HP0_WCOUNT;
  output [2:0] S_AXI_HP0_RACOUNT;
  output [5:0] S_AXI_HP0_WACOUNT;
  input S_AXI_HP0_ACLK;
  input S_AXI_HP0_ARVALID;
  input S_AXI_HP0_AWVALID;
  input S_AXI_HP0_BREADY;
  input S_AXI_HP0_RDISSUECAP1_EN;
  input S_AXI_HP0_RREADY;
  input S_AXI_HP0_WLAST;
  input S_AXI_HP0_WRISSUECAP1_EN;
  input S_AXI_HP0_WVALID;
  input [1:0] S_AXI_HP0_ARBURST;
  input [1:0] S_AXI_HP0_ARLOCK;
  input [2:0] S_AXI_HP0_ARSIZE;
  input [1:0] S_AXI_HP0_AWBURST;
  input [1:0] S_AXI_HP0_AWLOCK;
  input [2:0] S_AXI_HP0_AWSIZE;
  input [2:0] S_AXI_HP0_ARPROT;
  input [2:0] S_AXI_HP0_AWPROT;
  input [31:0] S_AXI_HP0_ARADDR;
  input [31:0] S_AXI_HP0_AWADDR;
  input [3:0] S_AXI_HP0_ARCACHE;
  input [3:0] S_AXI_HP0_ARLEN;
  input [3:0] S_AXI_HP0_ARQOS;
  input [3:0] S_AXI_HP0_AWCACHE;
  input [3:0] S_AXI_HP0_AWLEN;
  input [3:0] S_AXI_HP0_AWQOS;
  input [0:0] S_AXI_HP0_ARID;
  input [0:0] S_AXI_HP0_AWID;
  input [0:0] S_AXI_HP0_WID;
  input [63:0] S_AXI_HP0_WDATA;
  input [7:0] S_AXI_HP0_WSTRB;
  output S_AXI_HP1_ARESETN;
  output S_AXI_HP1_ARREADY;
  output S_AXI_HP1_AWREADY;
  output S_AXI_HP1_BVALID;
  output S_AXI_HP1_RLAST;
  output S_AXI_HP1_RVALID;
  output S_AXI_HP1_WREADY;
  output [1:0] S_AXI_HP1_BRESP;
  output [1:0] S_AXI_HP1_RRESP;
  output [5:0] S_AXI_HP1_BID;
  output [5:0] S_AXI_HP1_RID;
  output [63:0] S_AXI_HP1_RDATA;
  output [7:0] S_AXI_HP1_RCOUNT;
  output [7:0] S_AXI_HP1_WCOUNT;
  output [2:0] S_AXI_HP1_RACOUNT;
  output [5:0] S_AXI_HP1_WACOUNT;
  input S_AXI_HP1_ACLK;
  input S_AXI_HP1_ARVALID;
  input S_AXI_HP1_AWVALID;
  input S_AXI_HP1_BREADY;
  input S_AXI_HP1_RDISSUECAP1_EN;
  input S_AXI_HP1_RREADY;
  input S_AXI_HP1_WLAST;
  input S_AXI_HP1_WRISSUECAP1_EN;
  input S_AXI_HP1_WVALID;
  input [1:0] S_AXI_HP1_ARBURST;
  input [1:0] S_AXI_HP1_ARLOCK;
  input [2:0] S_AXI_HP1_ARSIZE;
  input [1:0] S_AXI_HP1_AWBURST;
  input [1:0] S_AXI_HP1_AWLOCK;
  input [2:0] S_AXI_HP1_AWSIZE;
  input [2:0] S_AXI_HP1_ARPROT;
  input [2:0] S_AXI_HP1_AWPROT;
  input [31:0] S_AXI_HP1_ARADDR;
  input [31:0] S_AXI_HP1_AWADDR;
  input [3:0] S_AXI_HP1_ARCACHE;
  input [3:0] S_AXI_HP1_ARLEN;
  input [3:0] S_AXI_HP1_ARQOS;
  input [3:0] S_AXI_HP1_AWCACHE;
  input [3:0] S_AXI_HP1_AWLEN;
  input [3:0] S_AXI_HP1_AWQOS;
  input [5:0] S_AXI_HP1_ARID;
  input [5:0] S_AXI_HP1_AWID;
  input [5:0] S_AXI_HP1_WID;
  input [63:0] S_AXI_HP1_WDATA;
  input [7:0] S_AXI_HP1_WSTRB;
  output S_AXI_HP2_ARESETN;
  output S_AXI_HP2_ARREADY;
  output S_AXI_HP2_AWREADY;
  output S_AXI_HP2_BVALID;
  output S_AXI_HP2_RLAST;
  output S_AXI_HP2_RVALID;
  output S_AXI_HP2_WREADY;
  output [1:0] S_AXI_HP2_BRESP;
  output [1:0] S_AXI_HP2_RRESP;
  output [0:0] S_AXI_HP2_BID;
  output [0:0] S_AXI_HP2_RID;
  output [63:0] S_AXI_HP2_RDATA;
  output [7:0] S_AXI_HP2_RCOUNT;
  output [7:0] S_AXI_HP2_WCOUNT;
  output [2:0] S_AXI_HP2_RACOUNT;
  output [5:0] S_AXI_HP2_WACOUNT;
  input S_AXI_HP2_ACLK;
  input S_AXI_HP2_ARVALID;
  input S_AXI_HP2_AWVALID;
  input S_AXI_HP2_BREADY;
  input S_AXI_HP2_RDISSUECAP1_EN;
  input S_AXI_HP2_RREADY;
  input S_AXI_HP2_WLAST;
  input S_AXI_HP2_WRISSUECAP1_EN;
  input S_AXI_HP2_WVALID;
  input [1:0] S_AXI_HP2_ARBURST;
  input [1:0] S_AXI_HP2_ARLOCK;
  input [2:0] S_AXI_HP2_ARSIZE;
  input [1:0] S_AXI_HP2_AWBURST;
  input [1:0] S_AXI_HP2_AWLOCK;
  input [2:0] S_AXI_HP2_AWSIZE;
  input [2:0] S_AXI_HP2_ARPROT;
  input [2:0] S_AXI_HP2_AWPROT;
  input [31:0] S_AXI_HP2_ARADDR;
  input [31:0] S_AXI_HP2_AWADDR;
  input [3:0] S_AXI_HP2_ARCACHE;
  input [3:0] S_AXI_HP2_ARLEN;
  input [3:0] S_AXI_HP2_ARQOS;
  input [3:0] S_AXI_HP2_AWCACHE;
  input [3:0] S_AXI_HP2_AWLEN;
  input [3:0] S_AXI_HP2_AWQOS;
  input [0:0] S_AXI_HP2_ARID;
  input [0:0] S_AXI_HP2_AWID;
  input [0:0] S_AXI_HP2_WID;
  input [63:0] S_AXI_HP2_WDATA;
  input [7:0] S_AXI_HP2_WSTRB;
  output S_AXI_HP3_ARESETN;
  output S_AXI_HP3_ARREADY;
  output S_AXI_HP3_AWREADY;
  output S_AXI_HP3_BVALID;
  output S_AXI_HP3_RLAST;
  output S_AXI_HP3_RVALID;
  output S_AXI_HP3_WREADY;
  output [1:0] S_AXI_HP3_BRESP;
  output [1:0] S_AXI_HP3_RRESP;
  output [5:0] S_AXI_HP3_BID;
  output [5:0] S_AXI_HP3_RID;
  output [63:0] S_AXI_HP3_RDATA;
  output [7:0] S_AXI_HP3_RCOUNT;
  output [7:0] S_AXI_HP3_WCOUNT;
  output [2:0] S_AXI_HP3_RACOUNT;
  output [5:0] S_AXI_HP3_WACOUNT;
  input S_AXI_HP3_ACLK;
  input S_AXI_HP3_ARVALID;
  input S_AXI_HP3_AWVALID;
  input S_AXI_HP3_BREADY;
  input S_AXI_HP3_RDISSUECAP1_EN;
  input S_AXI_HP3_RREADY;
  input S_AXI_HP3_WLAST;
  input S_AXI_HP3_WRISSUECAP1_EN;
  input S_AXI_HP3_WVALID;
  input [1:0] S_AXI_HP3_ARBURST;
  input [1:0] S_AXI_HP3_ARLOCK;
  input [2:0] S_AXI_HP3_ARSIZE;
  input [1:0] S_AXI_HP3_AWBURST;
  input [1:0] S_AXI_HP3_AWLOCK;
  input [2:0] S_AXI_HP3_AWSIZE;
  input [2:0] S_AXI_HP3_ARPROT;
  input [2:0] S_AXI_HP3_AWPROT;
  input [31:0] S_AXI_HP3_ARADDR;
  input [31:0] S_AXI_HP3_AWADDR;
  input [3:0] S_AXI_HP3_ARCACHE;
  input [3:0] S_AXI_HP3_ARLEN;
  input [3:0] S_AXI_HP3_ARQOS;
  input [3:0] S_AXI_HP3_AWCACHE;
  input [3:0] S_AXI_HP3_AWLEN;
  input [3:0] S_AXI_HP3_AWQOS;
  input [5:0] S_AXI_HP3_ARID;
  input [5:0] S_AXI_HP3_AWID;
  input [5:0] S_AXI_HP3_WID;
  input [63:0] S_AXI_HP3_WDATA;
  input [7:0] S_AXI_HP3_WSTRB;
  output [1:0] DMA0_DATYPE;
  output DMA0_DAVALID;
  output DMA0_DRREADY;
  output DMA0_RSTN;
  input DMA0_ACLK;
  input DMA0_DAREADY;
  input DMA0_DRLAST;
  input DMA0_DRVALID;
  input [1:0] DMA0_DRTYPE;
  output [1:0] DMA1_DATYPE;
  output DMA1_DAVALID;
  output DMA1_DRREADY;
  output DMA1_RSTN;
  input DMA1_ACLK;
  input DMA1_DAREADY;
  input DMA1_DRLAST;
  input DMA1_DRVALID;
  input [1:0] DMA1_DRTYPE;
  output [1:0] DMA2_DATYPE;
  output DMA2_DAVALID;
  output DMA2_DRREADY;
  output DMA2_RSTN;
  input DMA2_ACLK;
  input DMA2_DAREADY;
  input DMA2_DRLAST;
  input DMA2_DRVALID;
  input DMA3_DRVALID;
  output [1:0] DMA3_DATYPE;
  output DMA3_DAVALID;
  output DMA3_DRREADY;
  output DMA3_RSTN;
  input DMA3_ACLK;
  input DMA3_DAREADY;
  input DMA3_DRLAST;
  input [1:0] DMA2_DRTYPE;
  input [1:0] DMA3_DRTYPE;
  input [31:0] FTMD_TRACEIN_DATA;
  input FTMD_TRACEIN_VALID;
  input FTMD_TRACEIN_CLK;
  input [3:0] FTMD_TRACEIN_ATID;
  input [3:0] FTMT_F2P_TRIG;
  output [3:0] FTMT_F2P_TRIGACK;
  input [31:0] FTMT_F2P_DEBUG;
  input [3:0] FTMT_P2F_TRIGACK;
  output [3:0] FTMT_P2F_TRIG;
  output [31:0] FTMT_P2F_DEBUG;
  output FCLK_CLK3;
  output FCLK_CLK2;
  output FCLK_CLK1;
  output FCLK_CLK0;
  input FCLK_CLKTRIG3_N;
  input FCLK_CLKTRIG2_N;
  input FCLK_CLKTRIG1_N;
  input FCLK_CLKTRIG0_N;
  output FCLK_RESET3_N;
  output FCLK_RESET2_N;
  output FCLK_RESET1_N;
  output FCLK_RESET0_N;
  input FPGA_IDLE_N;
  input [3:0] DDR_ARB;
  input [0:0] IRQ_F2P;
  input Core0_nFIQ;
  input Core0_nIRQ;
  input Core1_nFIQ;
  input Core1_nIRQ;
  output EVENT_EVENTO;
  output [1:0] EVENT_STANDBYWFE;
  output [1:0] EVENT_STANDBYWFI;
  input EVENT_EVENTI;
  inout [53:0] MIO;
  inout DDR_Clk;
  inout DDR_Clk_n;
  inout DDR_CKE;
  inout DDR_CS_n;
  inout DDR_RAS_n;
  inout DDR_CAS_n;
  output DDR_WEB;
  inout [2:0] DDR_BankAddr;
  inout [14:0] DDR_Addr;
  inout DDR_ODT;
  inout DDR_DRSTB;
  inout [31:0] DDR_DQ;
  inout [3:0] DDR_DM;
  inout [3:0] DDR_DQS;
  inout [3:0] DDR_DQS_n;
  inout DDR_VRN;
  inout DDR_VRP;
  input PS_SRSTB;
  input PS_CLK;
  input PS_PORB;
  output IRQ_P2F_DMAC_ABORT;
  output IRQ_P2F_DMAC0;
  output IRQ_P2F_DMAC1;
  output IRQ_P2F_DMAC2;
  output IRQ_P2F_DMAC3;
  output IRQ_P2F_DMAC4;
  output IRQ_P2F_DMAC5;
  output IRQ_P2F_DMAC6;
  output IRQ_P2F_DMAC7;
  output IRQ_P2F_SMC;
  output IRQ_P2F_QSPI;
  output IRQ_P2F_CTI;
  output IRQ_P2F_GPIO;
  output IRQ_P2F_USB0;
  output IRQ_P2F_ENET0;
  output IRQ_P2F_ENET_WAKE0;
  output IRQ_P2F_SDIO0;
  output IRQ_P2F_I2C0;
  output IRQ_P2F_SPI0;
  output IRQ_P2F_UART0;
  output IRQ_P2F_CAN0;
  output IRQ_P2F_USB1;
  output IRQ_P2F_ENET1;
  output IRQ_P2F_ENET_WAKE1;
  output IRQ_P2F_SDIO1;
  output IRQ_P2F_I2C1;
  output IRQ_P2F_SPI1;
  output IRQ_P2F_UART1;
  output IRQ_P2F_CAN1;
endmodule

module cpu0_axi_gp0_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [0:0] S_AXI_ARESET_OUT_N;
  output [3:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [0:0] S_AXI_ACLK;
  input [11:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input [1:0] S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input [3:0] S_AXI_AWQOS;
  input [0:0] S_AXI_AWUSER;
  input [0:0] S_AXI_AWVALID;
  output [0:0] S_AXI_AWREADY;
  input [11:0] S_AXI_WID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input [0:0] S_AXI_WLAST;
  input [0:0] S_AXI_WUSER;
  input [0:0] S_AXI_WVALID;
  output [0:0] S_AXI_WREADY;
  output [11:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output [0:0] S_AXI_BUSER;
  output [0:0] S_AXI_BVALID;
  input [0:0] S_AXI_BREADY;
  input [11:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input [1:0] S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input [3:0] S_AXI_ARQOS;
  input [0:0] S_AXI_ARUSER;
  input [0:0] S_AXI_ARVALID;
  output [0:0] S_AXI_ARREADY;
  output [11:0] S_AXI_RID;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output [0:0] S_AXI_RLAST;
  output [0:0] S_AXI_RUSER;
  output [0:0] S_AXI_RVALID;
  input [0:0] S_AXI_RREADY;
  input [3:0] M_AXI_ACLK;
  output [47:0] M_AXI_AWID;
  output [127:0] M_AXI_AWADDR;
  output [31:0] M_AXI_AWLEN;
  output [11:0] M_AXI_AWSIZE;
  output [7:0] M_AXI_AWBURST;
  output [7:0] M_AXI_AWLOCK;
  output [15:0] M_AXI_AWCACHE;
  output [11:0] M_AXI_AWPROT;
  output [15:0] M_AXI_AWREGION;
  output [15:0] M_AXI_AWQOS;
  output [3:0] M_AXI_AWUSER;
  output [3:0] M_AXI_AWVALID;
  input [3:0] M_AXI_AWREADY;
  output [47:0] M_AXI_WID;
  output [127:0] M_AXI_WDATA;
  output [15:0] M_AXI_WSTRB;
  output [3:0] M_AXI_WLAST;
  output [3:0] M_AXI_WUSER;
  output [3:0] M_AXI_WVALID;
  input [3:0] M_AXI_WREADY;
  input [47:0] M_AXI_BID;
  input [7:0] M_AXI_BRESP;
  input [3:0] M_AXI_BUSER;
  input [3:0] M_AXI_BVALID;
  output [3:0] M_AXI_BREADY;
  output [47:0] M_AXI_ARID;
  output [127:0] M_AXI_ARADDR;
  output [31:0] M_AXI_ARLEN;
  output [11:0] M_AXI_ARSIZE;
  output [7:0] M_AXI_ARBURST;
  output [7:0] M_AXI_ARLOCK;
  output [15:0] M_AXI_ARCACHE;
  output [11:0] M_AXI_ARPROT;
  output [15:0] M_AXI_ARREGION;
  output [15:0] M_AXI_ARQOS;
  output [3:0] M_AXI_ARUSER;
  output [3:0] M_AXI_ARVALID;
  input [3:0] M_AXI_ARREADY;
  input [47:0] M_AXI_RID;
  input [127:0] M_AXI_RDATA;
  input [7:0] M_AXI_RRESP;
  input [3:0] M_AXI_RLAST;
  input [3:0] M_AXI_RUSER;
  input [3:0] M_AXI_RVALID;
  output [3:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [34:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [34:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [15:0] DEBUG_SR_SC_BRESP;
  output [31:0] DEBUG_SR_SC_RDATA;
  output [16:0] DEBUG_SR_SC_RDATACONTROL;
  output [31:0] DEBUG_SR_SC_WDATA;
  output [6:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [34:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [34:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [15:0] DEBUG_SC_SF_BRESP;
  output [31:0] DEBUG_SC_SF_RDATA;
  output [16:0] DEBUG_SC_SF_RDATACONTROL;
  output [31:0] DEBUG_SC_SF_WDATA;
  output [6:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [34:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [34:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [15:0] DEBUG_SF_CB_BRESP;
  output [31:0] DEBUG_SF_CB_RDATA;
  output [16:0] DEBUG_SF_CB_RDATACONTROL;
  output [31:0] DEBUG_SF_CB_WDATA;
  output [6:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [34:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [34:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [15:0] DEBUG_CB_MF_BRESP;
  output [31:0] DEBUG_CB_MF_RDATA;
  output [16:0] DEBUG_CB_MF_RDATACONTROL;
  output [31:0] DEBUG_CB_MF_WDATA;
  output [6:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [34:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [34:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [15:0] DEBUG_MF_MC_BRESP;
  output [31:0] DEBUG_MF_MC_RDATA;
  output [16:0] DEBUG_MF_MC_RDATACONTROL;
  output [31:0] DEBUG_MF_MC_WDATA;
  output [6:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [34:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [34:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [15:0] DEBUG_MC_MP_BRESP;
  output [31:0] DEBUG_MC_MP_RDATA;
  output [16:0] DEBUG_MC_MP_RDATACONTROL;
  output [31:0] DEBUG_MC_MP_WDATA;
  output [6:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [34:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [34:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [15:0] DEBUG_MP_MR_BRESP;
  output [31:0] DEBUG_MP_MR_RDATA;
  output [16:0] DEBUG_MP_MR_RDATACONTROL;
  output [31:0] DEBUG_MP_MR_WDATA;
  output [6:0] DEBUG_MP_MR_WDATACONTROL;
endmodule

module cpu0_axi_hp0_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [1:0] S_AXI_ARESET_OUT_N;
  output [0:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [1:0] S_AXI_ACLK;
  input [1:0] S_AXI_AWID;
  input [63:0] S_AXI_AWADDR;
  input [15:0] S_AXI_AWLEN;
  input [5:0] S_AXI_AWSIZE;
  input [3:0] S_AXI_AWBURST;
  input [3:0] S_AXI_AWLOCK;
  input [7:0] S_AXI_AWCACHE;
  input [5:0] S_AXI_AWPROT;
  input [7:0] S_AXI_AWQOS;
  input [1:0] S_AXI_AWUSER;
  input [1:0] S_AXI_AWVALID;
  output [1:0] S_AXI_AWREADY;
  input [1:0] S_AXI_WID;
  input [127:0] S_AXI_WDATA;
  input [15:0] S_AXI_WSTRB;
  input [1:0] S_AXI_WLAST;
  input [1:0] S_AXI_WUSER;
  input [1:0] S_AXI_WVALID;
  output [1:0] S_AXI_WREADY;
  output [1:0] S_AXI_BID;
  output [3:0] S_AXI_BRESP;
  output [1:0] S_AXI_BUSER;
  output [1:0] S_AXI_BVALID;
  input [1:0] S_AXI_BREADY;
  input [1:0] S_AXI_ARID;
  input [63:0] S_AXI_ARADDR;
  input [15:0] S_AXI_ARLEN;
  input [5:0] S_AXI_ARSIZE;
  input [3:0] S_AXI_ARBURST;
  input [3:0] S_AXI_ARLOCK;
  input [7:0] S_AXI_ARCACHE;
  input [5:0] S_AXI_ARPROT;
  input [7:0] S_AXI_ARQOS;
  input [1:0] S_AXI_ARUSER;
  input [1:0] S_AXI_ARVALID;
  output [1:0] S_AXI_ARREADY;
  output [1:0] S_AXI_RID;
  output [127:0] S_AXI_RDATA;
  output [3:0] S_AXI_RRESP;
  output [1:0] S_AXI_RLAST;
  output [1:0] S_AXI_RUSER;
  output [1:0] S_AXI_RVALID;
  input [1:0] S_AXI_RREADY;
  input [0:0] M_AXI_ACLK;
  output [0:0] M_AXI_AWID;
  output [31:0] M_AXI_AWADDR;
  output [7:0] M_AXI_AWLEN;
  output [2:0] M_AXI_AWSIZE;
  output [1:0] M_AXI_AWBURST;
  output [1:0] M_AXI_AWLOCK;
  output [3:0] M_AXI_AWCACHE;
  output [2:0] M_AXI_AWPROT;
  output [3:0] M_AXI_AWREGION;
  output [3:0] M_AXI_AWQOS;
  output [0:0] M_AXI_AWUSER;
  output [0:0] M_AXI_AWVALID;
  input [0:0] M_AXI_AWREADY;
  output [0:0] M_AXI_WID;
  output [63:0] M_AXI_WDATA;
  output [7:0] M_AXI_WSTRB;
  output [0:0] M_AXI_WLAST;
  output [0:0] M_AXI_WUSER;
  output [0:0] M_AXI_WVALID;
  input [0:0] M_AXI_WREADY;
  input [0:0] M_AXI_BID;
  input [1:0] M_AXI_BRESP;
  input [0:0] M_AXI_BUSER;
  input [0:0] M_AXI_BVALID;
  output [0:0] M_AXI_BREADY;
  output [0:0] M_AXI_ARID;
  output [31:0] M_AXI_ARADDR;
  output [7:0] M_AXI_ARLEN;
  output [2:0] M_AXI_ARSIZE;
  output [1:0] M_AXI_ARBURST;
  output [1:0] M_AXI_ARLOCK;
  output [3:0] M_AXI_ARCACHE;
  output [2:0] M_AXI_ARPROT;
  output [3:0] M_AXI_ARREGION;
  output [3:0] M_AXI_ARQOS;
  output [0:0] M_AXI_ARUSER;
  output [0:0] M_AXI_ARVALID;
  input [0:0] M_AXI_ARREADY;
  input [0:0] M_AXI_RID;
  input [63:0] M_AXI_RDATA;
  input [1:0] M_AXI_RRESP;
  input [0:0] M_AXI_RLAST;
  input [0:0] M_AXI_RUSER;
  input [0:0] M_AXI_RVALID;
  output [0:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [23:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [23:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [4:0] DEBUG_SR_SC_BRESP;
  output [63:0] DEBUG_SR_SC_RDATA;
  output [5:0] DEBUG_SR_SC_RDATACONTROL;
  output [63:0] DEBUG_SR_SC_WDATA;
  output [10:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [23:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [23:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [4:0] DEBUG_SC_SF_BRESP;
  output [63:0] DEBUG_SC_SF_RDATA;
  output [5:0] DEBUG_SC_SF_RDATACONTROL;
  output [63:0] DEBUG_SC_SF_WDATA;
  output [10:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [23:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [23:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [4:0] DEBUG_SF_CB_BRESP;
  output [63:0] DEBUG_SF_CB_RDATA;
  output [5:0] DEBUG_SF_CB_RDATACONTROL;
  output [63:0] DEBUG_SF_CB_WDATA;
  output [10:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [23:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [23:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [4:0] DEBUG_CB_MF_BRESP;
  output [63:0] DEBUG_CB_MF_RDATA;
  output [5:0] DEBUG_CB_MF_RDATACONTROL;
  output [63:0] DEBUG_CB_MF_WDATA;
  output [10:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [23:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [23:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [4:0] DEBUG_MF_MC_BRESP;
  output [63:0] DEBUG_MF_MC_RDATA;
  output [5:0] DEBUG_MF_MC_RDATACONTROL;
  output [63:0] DEBUG_MF_MC_WDATA;
  output [10:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [23:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [23:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [4:0] DEBUG_MC_MP_BRESP;
  output [63:0] DEBUG_MC_MP_RDATA;
  output [5:0] DEBUG_MC_MP_RDATACONTROL;
  output [63:0] DEBUG_MC_MP_WDATA;
  output [10:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [23:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [23:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [4:0] DEBUG_MP_MR_BRESP;
  output [63:0] DEBUG_MP_MR_RDATA;
  output [5:0] DEBUG_MP_MR_RDATACONTROL;
  output [63:0] DEBUG_MP_MR_WDATA;
  output [10:0] DEBUG_MP_MR_WDATACONTROL;
endmodule

module cpu0_sys_reset_n_wrapper
  (
    Slowest_sync_clk,
    Ext_Reset_In,
    Aux_Reset_In,
    MB_Debug_Sys_Rst,
    Core_Reset_Req_0,
    Chip_Reset_Req_0,
    System_Reset_Req_0,
    Core_Reset_Req_1,
    Chip_Reset_Req_1,
    System_Reset_Req_1,
    Dcm_locked,
    RstcPPCresetcore_0,
    RstcPPCresetchip_0,
    RstcPPCresetsys_0,
    RstcPPCresetcore_1,
    RstcPPCresetchip_1,
    RstcPPCresetsys_1,
    MB_Reset,
    Bus_Struct_Reset,
    Peripheral_Reset,
    Interconnect_aresetn,
    Peripheral_aresetn
  );
  input Slowest_sync_clk;
  input Ext_Reset_In;
  input Aux_Reset_In;
  input MB_Debug_Sys_Rst;
  input Core_Reset_Req_0;
  input Chip_Reset_Req_0;
  input System_Reset_Req_0;
  input Core_Reset_Req_1;
  input Chip_Reset_Req_1;
  input System_Reset_Req_1;
  input Dcm_locked;
  output RstcPPCresetcore_0;
  output RstcPPCresetchip_0;
  output RstcPPCresetsys_0;
  output RstcPPCresetcore_1;
  output RstcPPCresetchip_1;
  output RstcPPCresetsys_1;
  output MB_Reset;
  output [0:0] Bus_Struct_Reset;
  output [0:0] Peripheral_Reset;
  output [0:0] Interconnect_aresetn;
  output [0:0] Peripheral_aresetn;
endmodule

module cpu0_pldma_mwr_0_wrapper
  (
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_RREADY,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_AWREADY,
    m_axi_aclk,
    m_axi_aresetn,
    md_error,
    m_axi_arready,
    m_axi_arvalid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arprot,
    m_axi_arcache,
    m_axi_rready,
    m_axi_rvalid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awprot,
    m_axi_awcache,
    m_axi_wready,
    m_axi_wvalid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_bready,
    m_axi_bvalid,
    m_axi_bresp,
    u_debug,
    u_ctrl0,
    u_ctrl1,
    wr_clk,
    data_wr,
    wr_en,
    afull,
    rst
  );
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  input S_AXI_RREADY;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  output S_AXI_AWREADY;
  input m_axi_aclk;
  input m_axi_aresetn;
  output md_error;
  input m_axi_arready;
  output m_axi_arvalid;
  output [31:0] m_axi_araddr;
  output [7:0] m_axi_arlen;
  output [2:0] m_axi_arsize;
  output [1:0] m_axi_arburst;
  output [2:0] m_axi_arprot;
  output [3:0] m_axi_arcache;
  output m_axi_rready;
  input m_axi_rvalid;
  input [63:0] m_axi_rdata;
  input [1:0] m_axi_rresp;
  input m_axi_rlast;
  input m_axi_awready;
  output m_axi_awvalid;
  output [31:0] m_axi_awaddr;
  output [7:0] m_axi_awlen;
  output [2:0] m_axi_awsize;
  output [1:0] m_axi_awburst;
  output [2:0] m_axi_awprot;
  output [3:0] m_axi_awcache;
  input m_axi_wready;
  output m_axi_wvalid;
  output [63:0] m_axi_wdata;
  output [7:0] m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_bready;
  input m_axi_bvalid;
  input [1:0] m_axi_bresp;
  output [139:0] u_debug;
  output [31:0] u_ctrl0;
  output [31:0] u_ctrl1;
  input wr_clk;
  input [31:0] data_wr;
  input wr_en;
  output afull;
  output rst;
endmodule

module cpu0_pldma_mrd_0_wrapper
  (
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_RREADY,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_AWREADY,
    m_axi_aclk,
    m_axi_aresetn,
    md_error,
    m_axi_arready,
    m_axi_arvalid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arprot,
    m_axi_arcache,
    m_axi_rready,
    m_axi_rvalid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_awready,
    m_axi_awvalid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awprot,
    m_axi_awcache,
    m_axi_wready,
    m_axi_wvalid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_bready,
    m_axi_bvalid,
    m_axi_bresp,
    u_debug,
    rd_clk,
    data_rd,
    rd_en,
    aempty,
    rst
  );
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  input S_AXI_RREADY;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  output S_AXI_AWREADY;
  input m_axi_aclk;
  input m_axi_aresetn;
  output md_error;
  input m_axi_arready;
  output m_axi_arvalid;
  output [31:0] m_axi_araddr;
  output [7:0] m_axi_arlen;
  output [2:0] m_axi_arsize;
  output [1:0] m_axi_arburst;
  output [2:0] m_axi_arprot;
  output [3:0] m_axi_arcache;
  output m_axi_rready;
  input m_axi_rvalid;
  input [63:0] m_axi_rdata;
  input [1:0] m_axi_rresp;
  input m_axi_rlast;
  input m_axi_awready;
  output m_axi_awvalid;
  output [31:0] m_axi_awaddr;
  output [7:0] m_axi_awlen;
  output [2:0] m_axi_awsize;
  output [1:0] m_axi_awburst;
  output [2:0] m_axi_awprot;
  output [3:0] m_axi_awcache;
  input m_axi_wready;
  output m_axi_wvalid;
  output [63:0] m_axi_wdata;
  output [7:0] m_axi_wstrb;
  output m_axi_wlast;
  output m_axi_bready;
  input m_axi_bvalid;
  input [1:0] m_axi_bresp;
  output [139:0] u_debug;
  input rd_clk;
  output [31:0] data_rd;
  input rd_en;
  output aempty;
  output rst;
endmodule

module cpu0_axi_vdma_0_wrapper
  (
    s_axi_lite_aclk,
    m_axi_sg_aclk,
    m_axi_mm2s_aclk,
    m_axi_s2mm_aclk,
    m_axis_mm2s_aclk,
    s_axis_s2mm_aclk,
    axi_resetn,
    s_axi_lite_awvalid,
    s_axi_lite_awready,
    s_axi_lite_awaddr,
    s_axi_lite_wvalid,
    s_axi_lite_wready,
    s_axi_lite_wdata,
    s_axi_lite_bresp,
    s_axi_lite_bvalid,
    s_axi_lite_bready,
    s_axi_lite_arvalid,
    s_axi_lite_arready,
    s_axi_lite_araddr,
    s_axi_lite_rvalid,
    s_axi_lite_rready,
    s_axi_lite_rdata,
    s_axi_lite_rresp,
    m_axi_sg_araddr,
    m_axi_sg_arlen,
    m_axi_sg_arsize,
    m_axi_sg_arburst,
    m_axi_sg_arprot,
    m_axi_sg_arcache,
    m_axi_sg_arvalid,
    m_axi_sg_arready,
    m_axi_sg_rdata,
    m_axi_sg_rresp,
    m_axi_sg_rlast,
    m_axi_sg_rvalid,
    m_axi_sg_rready,
    m_axi_mm2s_araddr,
    m_axi_mm2s_arlen,
    m_axi_mm2s_arsize,
    m_axi_mm2s_arburst,
    m_axi_mm2s_arprot,
    m_axi_mm2s_arcache,
    m_axi_mm2s_arvalid,
    m_axi_mm2s_arready,
    m_axi_mm2s_rdata,
    m_axi_mm2s_rresp,
    m_axi_mm2s_rlast,
    m_axi_mm2s_rvalid,
    m_axi_mm2s_rready,
    mm2s_prmry_reset_out_n,
    m_axis_mm2s_tdata,
    m_axis_mm2s_tkeep,
    m_axis_mm2s_tvalid,
    m_axis_mm2s_tready,
    m_axis_mm2s_tlast,
    m_axis_mm2s_tuser,
    m_axi_s2mm_awaddr,
    m_axi_s2mm_awlen,
    m_axi_s2mm_awsize,
    m_axi_s2mm_awburst,
    m_axi_s2mm_awprot,
    m_axi_s2mm_awcache,
    m_axi_s2mm_awvalid,
    m_axi_s2mm_awready,
    m_axi_s2mm_wdata,
    m_axi_s2mm_wstrb,
    m_axi_s2mm_wlast,
    m_axi_s2mm_wvalid,
    m_axi_s2mm_wready,
    m_axi_s2mm_bresp,
    m_axi_s2mm_bvalid,
    m_axi_s2mm_bready,
    s2mm_prmry_reset_out_n,
    s_axis_s2mm_tdata,
    s_axis_s2mm_tkeep,
    s_axis_s2mm_tvalid,
    s_axis_s2mm_tready,
    s_axis_s2mm_tlast,
    s_axis_s2mm_tuser,
    mm2s_fsync,
    mm2s_frame_ptr_in,
    mm2s_frame_ptr_out,
    mm2s_fsync_out,
    mm2s_prmtr_update,
    mm2s_buffer_empty,
    mm2s_buffer_almost_empty,
    s2mm_fsync,
    s2mm_frame_ptr_in,
    s2mm_frame_ptr_out,
    s2mm_fsync_out,
    s2mm_buffer_full,
    s2mm_buffer_almost_full,
    s2mm_prmtr_update,
    mm2s_introut,
    s2mm_introut,
    axi_vdma_tstvec
  );
  input s_axi_lite_aclk;
  input m_axi_sg_aclk;
  input m_axi_mm2s_aclk;
  input m_axi_s2mm_aclk;
  input m_axis_mm2s_aclk;
  input s_axis_s2mm_aclk;
  input axi_resetn;
  input s_axi_lite_awvalid;
  output s_axi_lite_awready;
  input [8:0] s_axi_lite_awaddr;
  input s_axi_lite_wvalid;
  output s_axi_lite_wready;
  input [31:0] s_axi_lite_wdata;
  output [1:0] s_axi_lite_bresp;
  output s_axi_lite_bvalid;
  input s_axi_lite_bready;
  input s_axi_lite_arvalid;
  output s_axi_lite_arready;
  input [8:0] s_axi_lite_araddr;
  output s_axi_lite_rvalid;
  input s_axi_lite_rready;
  output [31:0] s_axi_lite_rdata;
  output [1:0] s_axi_lite_rresp;
  output [31:0] m_axi_sg_araddr;
  output [7:0] m_axi_sg_arlen;
  output [2:0] m_axi_sg_arsize;
  output [1:0] m_axi_sg_arburst;
  output [2:0] m_axi_sg_arprot;
  output [3:0] m_axi_sg_arcache;
  output m_axi_sg_arvalid;
  input m_axi_sg_arready;
  input [31:0] m_axi_sg_rdata;
  input [1:0] m_axi_sg_rresp;
  input m_axi_sg_rlast;
  input m_axi_sg_rvalid;
  output m_axi_sg_rready;
  output [31:0] m_axi_mm2s_araddr;
  output [7:0] m_axi_mm2s_arlen;
  output [2:0] m_axi_mm2s_arsize;
  output [1:0] m_axi_mm2s_arburst;
  output [2:0] m_axi_mm2s_arprot;
  output [3:0] m_axi_mm2s_arcache;
  output m_axi_mm2s_arvalid;
  input m_axi_mm2s_arready;
  input [63:0] m_axi_mm2s_rdata;
  input [1:0] m_axi_mm2s_rresp;
  input m_axi_mm2s_rlast;
  input m_axi_mm2s_rvalid;
  output m_axi_mm2s_rready;
  output mm2s_prmry_reset_out_n;
  output [63:0] m_axis_mm2s_tdata;
  output [7:0] m_axis_mm2s_tkeep;
  output m_axis_mm2s_tvalid;
  input m_axis_mm2s_tready;
  output m_axis_mm2s_tlast;
  output [0:0] m_axis_mm2s_tuser;
  output [31:0] m_axi_s2mm_awaddr;
  output [7:0] m_axi_s2mm_awlen;
  output [2:0] m_axi_s2mm_awsize;
  output [1:0] m_axi_s2mm_awburst;
  output [2:0] m_axi_s2mm_awprot;
  output [3:0] m_axi_s2mm_awcache;
  output m_axi_s2mm_awvalid;
  input m_axi_s2mm_awready;
  output [31:0] m_axi_s2mm_wdata;
  output [3:0] m_axi_s2mm_wstrb;
  output m_axi_s2mm_wlast;
  output m_axi_s2mm_wvalid;
  input m_axi_s2mm_wready;
  input [1:0] m_axi_s2mm_bresp;
  input m_axi_s2mm_bvalid;
  output m_axi_s2mm_bready;
  output s2mm_prmry_reset_out_n;
  input [31:0] s_axis_s2mm_tdata;
  input [3:0] s_axis_s2mm_tkeep;
  input s_axis_s2mm_tvalid;
  output s_axis_s2mm_tready;
  input s_axis_s2mm_tlast;
  input [0:0] s_axis_s2mm_tuser;
  input mm2s_fsync;
  input [5:0] mm2s_frame_ptr_in;
  output [5:0] mm2s_frame_ptr_out;
  output mm2s_fsync_out;
  output mm2s_prmtr_update;
  output mm2s_buffer_empty;
  output mm2s_buffer_almost_empty;
  input s2mm_fsync;
  input [5:0] s2mm_frame_ptr_in;
  output [5:0] s2mm_frame_ptr_out;
  output s2mm_fsync_out;
  output s2mm_buffer_full;
  output s2mm_buffer_almost_full;
  output s2mm_prmtr_update;
  output mm2s_introut;
  output s2mm_introut;
  output [63:0] axi_vdma_tstvec;
endmodule

module cpu0_axi_hdmi_tx_16b_0_wrapper
  (
    hdmi_ref_clk,
    hdmi_clk,
    hdmi_vsync,
    hdmi_hsync,
    hdmi_data_e,
    hdmi_data,
    vdma_clk,
    vdma_fs,
    vdma_fs_ret,
    vdma_empty,
    vdma_almost_empty,
    up_status,
    debug_trigger,
    debug_data,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_RREADY,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_AWREADY,
    M_AXIS_MM2S_TVALID,
    M_AXIS_MM2S_TKEEP,
    M_AXIS_MM2S_TDATA,
    M_AXIS_MM2S_TLAST,
    M_AXIS_MM2S_TREADY
  );
  input hdmi_ref_clk;
  output hdmi_clk;
  output hdmi_vsync;
  output hdmi_hsync;
  output hdmi_data_e;
  output [15:0] hdmi_data;
  input vdma_clk;
  output vdma_fs;
  input vdma_fs_ret;
  input vdma_empty;
  input vdma_almost_empty;
  output [7:0] up_status;
  output [7:0] debug_trigger;
  output [63:0] debug_data;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [31:0] S_AXI_AWADDR;
  input S_AXI_AWVALID;
  input [31:0] S_AXI_WDATA;
  input [3:0] S_AXI_WSTRB;
  input S_AXI_WVALID;
  input S_AXI_BREADY;
  input [31:0] S_AXI_ARADDR;
  input S_AXI_ARVALID;
  input S_AXI_RREADY;
  output S_AXI_ARREADY;
  output [31:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output S_AXI_RVALID;
  output S_AXI_WREADY;
  output [1:0] S_AXI_BRESP;
  output S_AXI_BVALID;
  output S_AXI_AWREADY;
  input M_AXIS_MM2S_TVALID;
  input [7:0] M_AXIS_MM2S_TKEEP;
  input [63:0] M_AXIS_MM2S_TDATA;
  input M_AXIS_MM2S_TLAST;
  output M_AXIS_MM2S_TREADY;
endmodule

module cpu0_axi_hp2_wrapper
  (
    INTERCONNECT_ACLK,
    INTERCONNECT_ARESETN,
    S_AXI_ARESET_OUT_N,
    M_AXI_ARESET_OUT_N,
    IRQ,
    S_AXI_ACLK,
    S_AXI_AWID,
    S_AXI_AWADDR,
    S_AXI_AWLEN,
    S_AXI_AWSIZE,
    S_AXI_AWBURST,
    S_AXI_AWLOCK,
    S_AXI_AWCACHE,
    S_AXI_AWPROT,
    S_AXI_AWQOS,
    S_AXI_AWUSER,
    S_AXI_AWVALID,
    S_AXI_AWREADY,
    S_AXI_WID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WLAST,
    S_AXI_WUSER,
    S_AXI_WVALID,
    S_AXI_WREADY,
    S_AXI_BID,
    S_AXI_BRESP,
    S_AXI_BUSER,
    S_AXI_BVALID,
    S_AXI_BREADY,
    S_AXI_ARID,
    S_AXI_ARADDR,
    S_AXI_ARLEN,
    S_AXI_ARSIZE,
    S_AXI_ARBURST,
    S_AXI_ARLOCK,
    S_AXI_ARCACHE,
    S_AXI_ARPROT,
    S_AXI_ARQOS,
    S_AXI_ARUSER,
    S_AXI_ARVALID,
    S_AXI_ARREADY,
    S_AXI_RID,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RLAST,
    S_AXI_RUSER,
    S_AXI_RVALID,
    S_AXI_RREADY,
    M_AXI_ACLK,
    M_AXI_AWID,
    M_AXI_AWADDR,
    M_AXI_AWLEN,
    M_AXI_AWSIZE,
    M_AXI_AWBURST,
    M_AXI_AWLOCK,
    M_AXI_AWCACHE,
    M_AXI_AWPROT,
    M_AXI_AWREGION,
    M_AXI_AWQOS,
    M_AXI_AWUSER,
    M_AXI_AWVALID,
    M_AXI_AWREADY,
    M_AXI_WID,
    M_AXI_WDATA,
    M_AXI_WSTRB,
    M_AXI_WLAST,
    M_AXI_WUSER,
    M_AXI_WVALID,
    M_AXI_WREADY,
    M_AXI_BID,
    M_AXI_BRESP,
    M_AXI_BUSER,
    M_AXI_BVALID,
    M_AXI_BREADY,
    M_AXI_ARID,
    M_AXI_ARADDR,
    M_AXI_ARLEN,
    M_AXI_ARSIZE,
    M_AXI_ARBURST,
    M_AXI_ARLOCK,
    M_AXI_ARCACHE,
    M_AXI_ARPROT,
    M_AXI_ARREGION,
    M_AXI_ARQOS,
    M_AXI_ARUSER,
    M_AXI_ARVALID,
    M_AXI_ARREADY,
    M_AXI_RID,
    M_AXI_RDATA,
    M_AXI_RRESP,
    M_AXI_RLAST,
    M_AXI_RUSER,
    M_AXI_RVALID,
    M_AXI_RREADY,
    S_AXI_CTRL_AWADDR,
    S_AXI_CTRL_AWVALID,
    S_AXI_CTRL_AWREADY,
    S_AXI_CTRL_WDATA,
    S_AXI_CTRL_WVALID,
    S_AXI_CTRL_WREADY,
    S_AXI_CTRL_BRESP,
    S_AXI_CTRL_BVALID,
    S_AXI_CTRL_BREADY,
    S_AXI_CTRL_ARADDR,
    S_AXI_CTRL_ARVALID,
    S_AXI_CTRL_ARREADY,
    S_AXI_CTRL_RDATA,
    S_AXI_CTRL_RRESP,
    S_AXI_CTRL_RVALID,
    S_AXI_CTRL_RREADY,
    INTERCONNECT_ARESET_OUT_N,
    DEBUG_AW_TRANS_SEQ,
    DEBUG_AW_ARB_GRANT,
    DEBUG_AR_TRANS_SEQ,
    DEBUG_AR_ARB_GRANT,
    DEBUG_AW_TRANS_QUAL,
    DEBUG_AW_ACCEPT_CNT,
    DEBUG_AW_ACTIVE_THREAD,
    DEBUG_AW_ACTIVE_TARGET,
    DEBUG_AW_ACTIVE_REGION,
    DEBUG_AW_ERROR,
    DEBUG_AW_TARGET,
    DEBUG_AR_TRANS_QUAL,
    DEBUG_AR_ACCEPT_CNT,
    DEBUG_AR_ACTIVE_THREAD,
    DEBUG_AR_ACTIVE_TARGET,
    DEBUG_AR_ACTIVE_REGION,
    DEBUG_AR_ERROR,
    DEBUG_AR_TARGET,
    DEBUG_B_TRANS_SEQ,
    DEBUG_R_BEAT_CNT,
    DEBUG_R_TRANS_SEQ,
    DEBUG_AW_ISSUING_CNT,
    DEBUG_AR_ISSUING_CNT,
    DEBUG_W_BEAT_CNT,
    DEBUG_W_TRANS_SEQ,
    DEBUG_BID_TARGET,
    DEBUG_BID_ERROR,
    DEBUG_RID_TARGET,
    DEBUG_RID_ERROR,
    DEBUG_SR_SC_ARADDR,
    DEBUG_SR_SC_ARADDRCONTROL,
    DEBUG_SR_SC_AWADDR,
    DEBUG_SR_SC_AWADDRCONTROL,
    DEBUG_SR_SC_BRESP,
    DEBUG_SR_SC_RDATA,
    DEBUG_SR_SC_RDATACONTROL,
    DEBUG_SR_SC_WDATA,
    DEBUG_SR_SC_WDATACONTROL,
    DEBUG_SC_SF_ARADDR,
    DEBUG_SC_SF_ARADDRCONTROL,
    DEBUG_SC_SF_AWADDR,
    DEBUG_SC_SF_AWADDRCONTROL,
    DEBUG_SC_SF_BRESP,
    DEBUG_SC_SF_RDATA,
    DEBUG_SC_SF_RDATACONTROL,
    DEBUG_SC_SF_WDATA,
    DEBUG_SC_SF_WDATACONTROL,
    DEBUG_SF_CB_ARADDR,
    DEBUG_SF_CB_ARADDRCONTROL,
    DEBUG_SF_CB_AWADDR,
    DEBUG_SF_CB_AWADDRCONTROL,
    DEBUG_SF_CB_BRESP,
    DEBUG_SF_CB_RDATA,
    DEBUG_SF_CB_RDATACONTROL,
    DEBUG_SF_CB_WDATA,
    DEBUG_SF_CB_WDATACONTROL,
    DEBUG_CB_MF_ARADDR,
    DEBUG_CB_MF_ARADDRCONTROL,
    DEBUG_CB_MF_AWADDR,
    DEBUG_CB_MF_AWADDRCONTROL,
    DEBUG_CB_MF_BRESP,
    DEBUG_CB_MF_RDATA,
    DEBUG_CB_MF_RDATACONTROL,
    DEBUG_CB_MF_WDATA,
    DEBUG_CB_MF_WDATACONTROL,
    DEBUG_MF_MC_ARADDR,
    DEBUG_MF_MC_ARADDRCONTROL,
    DEBUG_MF_MC_AWADDR,
    DEBUG_MF_MC_AWADDRCONTROL,
    DEBUG_MF_MC_BRESP,
    DEBUG_MF_MC_RDATA,
    DEBUG_MF_MC_RDATACONTROL,
    DEBUG_MF_MC_WDATA,
    DEBUG_MF_MC_WDATACONTROL,
    DEBUG_MC_MP_ARADDR,
    DEBUG_MC_MP_ARADDRCONTROL,
    DEBUG_MC_MP_AWADDR,
    DEBUG_MC_MP_AWADDRCONTROL,
    DEBUG_MC_MP_BRESP,
    DEBUG_MC_MP_RDATA,
    DEBUG_MC_MP_RDATACONTROL,
    DEBUG_MC_MP_WDATA,
    DEBUG_MC_MP_WDATACONTROL,
    DEBUG_MP_MR_ARADDR,
    DEBUG_MP_MR_ARADDRCONTROL,
    DEBUG_MP_MR_AWADDR,
    DEBUG_MP_MR_AWADDRCONTROL,
    DEBUG_MP_MR_BRESP,
    DEBUG_MP_MR_RDATA,
    DEBUG_MP_MR_RDATACONTROL,
    DEBUG_MP_MR_WDATA,
    DEBUG_MP_MR_WDATACONTROL
  );
  input INTERCONNECT_ACLK;
  input INTERCONNECT_ARESETN;
  output [0:0] S_AXI_ARESET_OUT_N;
  output [0:0] M_AXI_ARESET_OUT_N;
  output IRQ;
  input [0:0] S_AXI_ACLK;
  input [0:0] S_AXI_AWID;
  input [31:0] S_AXI_AWADDR;
  input [7:0] S_AXI_AWLEN;
  input [2:0] S_AXI_AWSIZE;
  input [1:0] S_AXI_AWBURST;
  input [1:0] S_AXI_AWLOCK;
  input [3:0] S_AXI_AWCACHE;
  input [2:0] S_AXI_AWPROT;
  input [3:0] S_AXI_AWQOS;
  input [0:0] S_AXI_AWUSER;
  input [0:0] S_AXI_AWVALID;
  output [0:0] S_AXI_AWREADY;
  input [0:0] S_AXI_WID;
  input [63:0] S_AXI_WDATA;
  input [7:0] S_AXI_WSTRB;
  input [0:0] S_AXI_WLAST;
  input [0:0] S_AXI_WUSER;
  input [0:0] S_AXI_WVALID;
  output [0:0] S_AXI_WREADY;
  output [0:0] S_AXI_BID;
  output [1:0] S_AXI_BRESP;
  output [0:0] S_AXI_BUSER;
  output [0:0] S_AXI_BVALID;
  input [0:0] S_AXI_BREADY;
  input [0:0] S_AXI_ARID;
  input [31:0] S_AXI_ARADDR;
  input [7:0] S_AXI_ARLEN;
  input [2:0] S_AXI_ARSIZE;
  input [1:0] S_AXI_ARBURST;
  input [1:0] S_AXI_ARLOCK;
  input [3:0] S_AXI_ARCACHE;
  input [2:0] S_AXI_ARPROT;
  input [3:0] S_AXI_ARQOS;
  input [0:0] S_AXI_ARUSER;
  input [0:0] S_AXI_ARVALID;
  output [0:0] S_AXI_ARREADY;
  output [0:0] S_AXI_RID;
  output [63:0] S_AXI_RDATA;
  output [1:0] S_AXI_RRESP;
  output [0:0] S_AXI_RLAST;
  output [0:0] S_AXI_RUSER;
  output [0:0] S_AXI_RVALID;
  input [0:0] S_AXI_RREADY;
  input [0:0] M_AXI_ACLK;
  output [0:0] M_AXI_AWID;
  output [31:0] M_AXI_AWADDR;
  output [7:0] M_AXI_AWLEN;
  output [2:0] M_AXI_AWSIZE;
  output [1:0] M_AXI_AWBURST;
  output [1:0] M_AXI_AWLOCK;
  output [3:0] M_AXI_AWCACHE;
  output [2:0] M_AXI_AWPROT;
  output [3:0] M_AXI_AWREGION;
  output [3:0] M_AXI_AWQOS;
  output [0:0] M_AXI_AWUSER;
  output [0:0] M_AXI_AWVALID;
  input [0:0] M_AXI_AWREADY;
  output [0:0] M_AXI_WID;
  output [63:0] M_AXI_WDATA;
  output [7:0] M_AXI_WSTRB;
  output [0:0] M_AXI_WLAST;
  output [0:0] M_AXI_WUSER;
  output [0:0] M_AXI_WVALID;
  input [0:0] M_AXI_WREADY;
  input [0:0] M_AXI_BID;
  input [1:0] M_AXI_BRESP;
  input [0:0] M_AXI_BUSER;
  input [0:0] M_AXI_BVALID;
  output [0:0] M_AXI_BREADY;
  output [0:0] M_AXI_ARID;
  output [31:0] M_AXI_ARADDR;
  output [7:0] M_AXI_ARLEN;
  output [2:0] M_AXI_ARSIZE;
  output [1:0] M_AXI_ARBURST;
  output [1:0] M_AXI_ARLOCK;
  output [3:0] M_AXI_ARCACHE;
  output [2:0] M_AXI_ARPROT;
  output [3:0] M_AXI_ARREGION;
  output [3:0] M_AXI_ARQOS;
  output [0:0] M_AXI_ARUSER;
  output [0:0] M_AXI_ARVALID;
  input [0:0] M_AXI_ARREADY;
  input [0:0] M_AXI_RID;
  input [63:0] M_AXI_RDATA;
  input [1:0] M_AXI_RRESP;
  input [0:0] M_AXI_RLAST;
  input [0:0] M_AXI_RUSER;
  input [0:0] M_AXI_RVALID;
  output [0:0] M_AXI_RREADY;
  input [31:0] S_AXI_CTRL_AWADDR;
  input S_AXI_CTRL_AWVALID;
  output S_AXI_CTRL_AWREADY;
  input [31:0] S_AXI_CTRL_WDATA;
  input S_AXI_CTRL_WVALID;
  output S_AXI_CTRL_WREADY;
  output [1:0] S_AXI_CTRL_BRESP;
  output S_AXI_CTRL_BVALID;
  input S_AXI_CTRL_BREADY;
  input [31:0] S_AXI_CTRL_ARADDR;
  input S_AXI_CTRL_ARVALID;
  output S_AXI_CTRL_ARREADY;
  output [31:0] S_AXI_CTRL_RDATA;
  output [1:0] S_AXI_CTRL_RRESP;
  output S_AXI_CTRL_RVALID;
  input S_AXI_CTRL_RREADY;
  output INTERCONNECT_ARESET_OUT_N;
  output [7:0] DEBUG_AW_TRANS_SEQ;
  output [7:0] DEBUG_AW_ARB_GRANT;
  output [7:0] DEBUG_AR_TRANS_SEQ;
  output [7:0] DEBUG_AR_ARB_GRANT;
  output [0:0] DEBUG_AW_TRANS_QUAL;
  output [7:0] DEBUG_AW_ACCEPT_CNT;
  output [15:0] DEBUG_AW_ACTIVE_THREAD;
  output [7:0] DEBUG_AW_ACTIVE_TARGET;
  output [7:0] DEBUG_AW_ACTIVE_REGION;
  output [7:0] DEBUG_AW_ERROR;
  output [7:0] DEBUG_AW_TARGET;
  output [0:0] DEBUG_AR_TRANS_QUAL;
  output [7:0] DEBUG_AR_ACCEPT_CNT;
  output [15:0] DEBUG_AR_ACTIVE_THREAD;
  output [7:0] DEBUG_AR_ACTIVE_TARGET;
  output [7:0] DEBUG_AR_ACTIVE_REGION;
  output [7:0] DEBUG_AR_ERROR;
  output [7:0] DEBUG_AR_TARGET;
  output [7:0] DEBUG_B_TRANS_SEQ;
  output [7:0] DEBUG_R_BEAT_CNT;
  output [7:0] DEBUG_R_TRANS_SEQ;
  output [7:0] DEBUG_AW_ISSUING_CNT;
  output [7:0] DEBUG_AR_ISSUING_CNT;
  output [7:0] DEBUG_W_BEAT_CNT;
  output [7:0] DEBUG_W_TRANS_SEQ;
  output [7:0] DEBUG_BID_TARGET;
  output DEBUG_BID_ERROR;
  output [7:0] DEBUG_RID_TARGET;
  output DEBUG_RID_ERROR;
  output [31:0] DEBUG_SR_SC_ARADDR;
  output [23:0] DEBUG_SR_SC_ARADDRCONTROL;
  output [31:0] DEBUG_SR_SC_AWADDR;
  output [23:0] DEBUG_SR_SC_AWADDRCONTROL;
  output [4:0] DEBUG_SR_SC_BRESP;
  output [63:0] DEBUG_SR_SC_RDATA;
  output [5:0] DEBUG_SR_SC_RDATACONTROL;
  output [63:0] DEBUG_SR_SC_WDATA;
  output [10:0] DEBUG_SR_SC_WDATACONTROL;
  output [31:0] DEBUG_SC_SF_ARADDR;
  output [23:0] DEBUG_SC_SF_ARADDRCONTROL;
  output [31:0] DEBUG_SC_SF_AWADDR;
  output [23:0] DEBUG_SC_SF_AWADDRCONTROL;
  output [4:0] DEBUG_SC_SF_BRESP;
  output [63:0] DEBUG_SC_SF_RDATA;
  output [5:0] DEBUG_SC_SF_RDATACONTROL;
  output [63:0] DEBUG_SC_SF_WDATA;
  output [10:0] DEBUG_SC_SF_WDATACONTROL;
  output [31:0] DEBUG_SF_CB_ARADDR;
  output [23:0] DEBUG_SF_CB_ARADDRCONTROL;
  output [31:0] DEBUG_SF_CB_AWADDR;
  output [23:0] DEBUG_SF_CB_AWADDRCONTROL;
  output [4:0] DEBUG_SF_CB_BRESP;
  output [63:0] DEBUG_SF_CB_RDATA;
  output [5:0] DEBUG_SF_CB_RDATACONTROL;
  output [63:0] DEBUG_SF_CB_WDATA;
  output [10:0] DEBUG_SF_CB_WDATACONTROL;
  output [31:0] DEBUG_CB_MF_ARADDR;
  output [23:0] DEBUG_CB_MF_ARADDRCONTROL;
  output [31:0] DEBUG_CB_MF_AWADDR;
  output [23:0] DEBUG_CB_MF_AWADDRCONTROL;
  output [4:0] DEBUG_CB_MF_BRESP;
  output [63:0] DEBUG_CB_MF_RDATA;
  output [5:0] DEBUG_CB_MF_RDATACONTROL;
  output [63:0] DEBUG_CB_MF_WDATA;
  output [10:0] DEBUG_CB_MF_WDATACONTROL;
  output [31:0] DEBUG_MF_MC_ARADDR;
  output [23:0] DEBUG_MF_MC_ARADDRCONTROL;
  output [31:0] DEBUG_MF_MC_AWADDR;
  output [23:0] DEBUG_MF_MC_AWADDRCONTROL;
  output [4:0] DEBUG_MF_MC_BRESP;
  output [63:0] DEBUG_MF_MC_RDATA;
  output [5:0] DEBUG_MF_MC_RDATACONTROL;
  output [63:0] DEBUG_MF_MC_WDATA;
  output [10:0] DEBUG_MF_MC_WDATACONTROL;
  output [31:0] DEBUG_MC_MP_ARADDR;
  output [23:0] DEBUG_MC_MP_ARADDRCONTROL;
  output [31:0] DEBUG_MC_MP_AWADDR;
  output [23:0] DEBUG_MC_MP_AWADDRCONTROL;
  output [4:0] DEBUG_MC_MP_BRESP;
  output [63:0] DEBUG_MC_MP_RDATA;
  output [5:0] DEBUG_MC_MP_RDATACONTROL;
  output [63:0] DEBUG_MC_MP_WDATA;
  output [10:0] DEBUG_MC_MP_WDATACONTROL;
  output [31:0] DEBUG_MP_MR_ARADDR;
  output [23:0] DEBUG_MP_MR_ARADDRCONTROL;
  output [31:0] DEBUG_MP_MR_AWADDR;
  output [23:0] DEBUG_MP_MR_AWADDRCONTROL;
  output [4:0] DEBUG_MP_MR_BRESP;
  output [63:0] DEBUG_MP_MR_RDATA;
  output [5:0] DEBUG_MP_MR_RDATACONTROL;
  output [63:0] DEBUG_MP_MR_WDATA;
  output [10:0] DEBUG_MP_MR_WDATACONTROL;
endmodule

