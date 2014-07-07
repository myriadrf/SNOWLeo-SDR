//-----------------------------------------------------------------------------
// cpu0_pldma_mrd_0_wrapper.v
//-----------------------------------------------------------------------------

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

  pldma_mrd
    #(
      .C_S_AXI_DATA_WIDTH ( 32 ),
      .C_S_AXI_ADDR_WIDTH ( 32 ),
      .C_S_AXI_MIN_SIZE ( 32'h000001ff ),
      .C_USE_WSTRB ( 1 ),
      .C_DPHASE_TIMEOUT ( 8 ),
      .C_BASEADDR ( 32'h41220000 ),
      .C_HIGHADDR ( 32'h4122ffff ),
      .C_FAMILY ( "zynq" ),
      .C_NUM_REG ( 4 ),
      .C_NUM_MEM ( 1 ),
      .C_SLV_AWIDTH ( 32 ),
      .C_SLV_DWIDTH ( 32 ),
      .C_M_AXI_ADDR_WIDTH ( 32 ),
      .C_M_AXI_DATA_WIDTH ( 64 ),
      .C_MAX_BURST_LEN ( 256 ),
      .C_NATIVE_DATA_WIDTH ( 64 ),
      .C_LENGTH_WIDTH ( 12 ),
      .C_ADDR_PIPE_DEPTH ( 1 )
    )
    pldma_mrd_0 (
      .S_AXI_ACLK ( S_AXI_ACLK ),
      .S_AXI_ARESETN ( S_AXI_ARESETN ),
      .S_AXI_AWADDR ( S_AXI_AWADDR ),
      .S_AXI_AWVALID ( S_AXI_AWVALID ),
      .S_AXI_WDATA ( S_AXI_WDATA ),
      .S_AXI_WSTRB ( S_AXI_WSTRB ),
      .S_AXI_WVALID ( S_AXI_WVALID ),
      .S_AXI_BREADY ( S_AXI_BREADY ),
      .S_AXI_ARADDR ( S_AXI_ARADDR ),
      .S_AXI_ARVALID ( S_AXI_ARVALID ),
      .S_AXI_RREADY ( S_AXI_RREADY ),
      .S_AXI_ARREADY ( S_AXI_ARREADY ),
      .S_AXI_RDATA ( S_AXI_RDATA ),
      .S_AXI_RRESP ( S_AXI_RRESP ),
      .S_AXI_RVALID ( S_AXI_RVALID ),
      .S_AXI_WREADY ( S_AXI_WREADY ),
      .S_AXI_BRESP ( S_AXI_BRESP ),
      .S_AXI_BVALID ( S_AXI_BVALID ),
      .S_AXI_AWREADY ( S_AXI_AWREADY ),
      .m_axi_aclk ( m_axi_aclk ),
      .m_axi_aresetn ( m_axi_aresetn ),
      .md_error ( md_error ),
      .m_axi_arready ( m_axi_arready ),
      .m_axi_arvalid ( m_axi_arvalid ),
      .m_axi_araddr ( m_axi_araddr ),
      .m_axi_arlen ( m_axi_arlen ),
      .m_axi_arsize ( m_axi_arsize ),
      .m_axi_arburst ( m_axi_arburst ),
      .m_axi_arprot ( m_axi_arprot ),
      .m_axi_arcache ( m_axi_arcache ),
      .m_axi_rready ( m_axi_rready ),
      .m_axi_rvalid ( m_axi_rvalid ),
      .m_axi_rdata ( m_axi_rdata ),
      .m_axi_rresp ( m_axi_rresp ),
      .m_axi_rlast ( m_axi_rlast ),
      .m_axi_awready ( m_axi_awready ),
      .m_axi_awvalid ( m_axi_awvalid ),
      .m_axi_awaddr ( m_axi_awaddr ),
      .m_axi_awlen ( m_axi_awlen ),
      .m_axi_awsize ( m_axi_awsize ),
      .m_axi_awburst ( m_axi_awburst ),
      .m_axi_awprot ( m_axi_awprot ),
      .m_axi_awcache ( m_axi_awcache ),
      .m_axi_wready ( m_axi_wready ),
      .m_axi_wvalid ( m_axi_wvalid ),
      .m_axi_wdata ( m_axi_wdata ),
      .m_axi_wstrb ( m_axi_wstrb ),
      .m_axi_wlast ( m_axi_wlast ),
      .m_axi_bready ( m_axi_bready ),
      .m_axi_bvalid ( m_axi_bvalid ),
      .m_axi_bresp ( m_axi_bresp ),
      .u_debug ( u_debug ),
      .rd_clk ( rd_clk ),
      .data_rd ( data_rd ),
      .rd_en ( rd_en ),
      .aempty ( aempty ),
      .rst ( rst )
    );

endmodule

