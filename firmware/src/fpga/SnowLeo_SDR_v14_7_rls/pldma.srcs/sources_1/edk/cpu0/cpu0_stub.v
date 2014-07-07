//-----------------------------------------------------------------------------
// cpu0_stub.v
//-----------------------------------------------------------------------------

module cpu0_stub
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
    axi_gpio_0_GPIO_IO_pin,
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
    pldma_mwr_0_u_ctrl1_pin
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
  inout [3:0] axi_gpio_0_GPIO_IO_pin;
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

  (* BOX_TYPE = "user_black_box" *)
  cpu0
    cpu0_i (
      .processing_system7_0_MIO ( processing_system7_0_MIO ),
      .processing_system7_0_PS_SRSTB_pin ( processing_system7_0_PS_SRSTB_pin ),
      .processing_system7_0_PS_CLK_pin ( processing_system7_0_PS_CLK_pin ),
      .processing_system7_0_PS_PORB_pin ( processing_system7_0_PS_PORB_pin ),
      .processing_system7_0_DDR_Clk ( processing_system7_0_DDR_Clk ),
      .processing_system7_0_DDR_Clk_n ( processing_system7_0_DDR_Clk_n ),
      .processing_system7_0_DDR_CKE ( processing_system7_0_DDR_CKE ),
      .processing_system7_0_DDR_CS_n ( processing_system7_0_DDR_CS_n ),
      .processing_system7_0_DDR_RAS_n ( processing_system7_0_DDR_RAS_n ),
      .processing_system7_0_DDR_CAS_n ( processing_system7_0_DDR_CAS_n ),
      .processing_system7_0_DDR_WEB_pin ( processing_system7_0_DDR_WEB_pin ),
      .processing_system7_0_DDR_BankAddr ( processing_system7_0_DDR_BankAddr ),
      .processing_system7_0_DDR_Addr ( processing_system7_0_DDR_Addr ),
      .processing_system7_0_DDR_ODT ( processing_system7_0_DDR_ODT ),
      .processing_system7_0_DDR_DRSTB ( processing_system7_0_DDR_DRSTB ),
      .processing_system7_0_DDR_DQ ( processing_system7_0_DDR_DQ ),
      .processing_system7_0_DDR_DM ( processing_system7_0_DDR_DM ),
      .processing_system7_0_DDR_DQS ( processing_system7_0_DDR_DQS ),
      .processing_system7_0_DDR_DQS_n ( processing_system7_0_DDR_DQS_n ),
      .processing_system7_0_DDR_VRN ( processing_system7_0_DDR_VRN ),
      .processing_system7_0_DDR_VRP ( processing_system7_0_DDR_VRP ),
      .axi_gpio_0_GPIO_IO_pin ( axi_gpio_0_GPIO_IO_pin ),
      .pldma_0_u_debug_pin ( pldma_0_u_debug_pin ),
      .pldma_0_wr_clk_pin ( pldma_0_wr_clk_pin ),
      .pldma_0_data_wr_pin ( pldma_0_data_wr_pin ),
      .pldma_0_wr_en_pin ( pldma_0_wr_en_pin ),
      .pldma_0_afull_pin ( pldma_0_afull_pin ),
      .pldma_0_rst_pin ( pldma_0_rst_pin ),
      .pldma_mrd_0_u_debug_pin ( pldma_mrd_0_u_debug_pin ),
      .pldma_mrd_0_rd_clk_pin ( pldma_mrd_0_rd_clk_pin ),
      .pldma_mrd_0_data_rd_pin ( pldma_mrd_0_data_rd_pin ),
      .pldma_mrd_0_rd_en_pin ( pldma_mrd_0_rd_en_pin ),
      .pldma_mrd_0_rd_fifo_cnt_pin ( pldma_mrd_0_rd_fifo_cnt_pin ),
      .pldma_mrd_0_aempty_pin ( pldma_mrd_0_aempty_pin ),
      .pldma_mrd_0_rst_pin ( pldma_mrd_0_rst_pin ),
      .mstclk_0 ( mstclk_0 ),
      .pldma_mwr_0_u_ctrl0_pin ( pldma_mwr_0_u_ctrl0_pin ),
      .pldma_mwr_0_u_ctrl1_pin ( pldma_mwr_0_u_ctrl1_pin )
    );

endmodule

