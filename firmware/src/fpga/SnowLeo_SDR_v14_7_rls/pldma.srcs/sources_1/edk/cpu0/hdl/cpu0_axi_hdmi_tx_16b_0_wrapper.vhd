-------------------------------------------------------------------------------
-- cpu0_axi_hdmi_tx_16b_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_hdmi_tx_16b_v1_00_a;
use axi_hdmi_tx_16b_v1_00_a.all;

entity cpu0_axi_hdmi_tx_16b_0_wrapper is
  port (
    hdmi_ref_clk : in std_logic;
    hdmi_clk : out std_logic;
    hdmi_vsync : out std_logic;
    hdmi_hsync : out std_logic;
    hdmi_data_e : out std_logic;
    hdmi_data : out std_logic_vector(15 downto 0);
    vdma_clk : in std_logic;
    vdma_fs : out std_logic;
    vdma_fs_ret : in std_logic;
    vdma_empty : in std_logic;
    vdma_almost_empty : in std_logic;
    up_status : out std_logic_vector(7 downto 0);
    debug_trigger : out std_logic_vector(7 downto 0);
    debug_data : out std_logic_vector(63 downto 0);
    S_AXI_ACLK : in std_logic;
    S_AXI_ARESETN : in std_logic;
    S_AXI_AWADDR : in std_logic_vector(31 downto 0);
    S_AXI_AWVALID : in std_logic;
    S_AXI_WDATA : in std_logic_vector(31 downto 0);
    S_AXI_WSTRB : in std_logic_vector(3 downto 0);
    S_AXI_WVALID : in std_logic;
    S_AXI_BREADY : in std_logic;
    S_AXI_ARADDR : in std_logic_vector(31 downto 0);
    S_AXI_ARVALID : in std_logic;
    S_AXI_RREADY : in std_logic;
    S_AXI_ARREADY : out std_logic;
    S_AXI_RDATA : out std_logic_vector(31 downto 0);
    S_AXI_RRESP : out std_logic_vector(1 downto 0);
    S_AXI_RVALID : out std_logic;
    S_AXI_WREADY : out std_logic;
    S_AXI_BRESP : out std_logic_vector(1 downto 0);
    S_AXI_BVALID : out std_logic;
    S_AXI_AWREADY : out std_logic;
    M_AXIS_MM2S_TVALID : in std_logic;
    M_AXIS_MM2S_TKEEP : in std_logic_vector(7 downto 0);
    M_AXIS_MM2S_TDATA : in std_logic_vector(63 downto 0);
    M_AXIS_MM2S_TLAST : in std_logic;
    M_AXIS_MM2S_TREADY : out std_logic
  );
end cpu0_axi_hdmi_tx_16b_0_wrapper;

architecture STRUCTURE of cpu0_axi_hdmi_tx_16b_0_wrapper is

  component axi_hdmi_tx_16b is
    generic (
      C_S_AXI_DATA_WIDTH : INTEGER;
      C_S_AXI_ADDR_WIDTH : INTEGER;
      C_S_AXI_MIN_SIZE : std_logic_vector;
      C_USE_WSTRB : INTEGER;
      C_DPHASE_TIMEOUT : INTEGER;
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_FAMILY : STRING;
      C_NUM_REG : INTEGER;
      C_NUM_MEM : INTEGER;
      C_SLV_AWIDTH : INTEGER;
      C_SLV_DWIDTH : INTEGER
    );
    port (
      hdmi_ref_clk : in std_logic;
      hdmi_clk : out std_logic;
      hdmi_vsync : out std_logic;
      hdmi_hsync : out std_logic;
      hdmi_data_e : out std_logic;
      hdmi_data : out std_logic_vector(15 downto 0);
      vdma_clk : in std_logic;
      vdma_fs : out std_logic;
      vdma_fs_ret : in std_logic;
      vdma_empty : in std_logic;
      vdma_almost_empty : in std_logic;
      up_status : out std_logic_vector(7 downto 0);
      debug_trigger : out std_logic_vector(7 downto 0);
      debug_data : out std_logic_vector(63 downto 0);
      S_AXI_ACLK : in std_logic;
      S_AXI_ARESETN : in std_logic;
      S_AXI_AWADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_AWVALID : in std_logic;
      S_AXI_WDATA : in std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_WSTRB : in std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      S_AXI_WVALID : in std_logic;
      S_AXI_BREADY : in std_logic;
      S_AXI_ARADDR : in std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      S_AXI_ARVALID : in std_logic;
      S_AXI_RREADY : in std_logic;
      S_AXI_ARREADY : out std_logic;
      S_AXI_RDATA : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      S_AXI_RRESP : out std_logic_vector(1 downto 0);
      S_AXI_RVALID : out std_logic;
      S_AXI_WREADY : out std_logic;
      S_AXI_BRESP : out std_logic_vector(1 downto 0);
      S_AXI_BVALID : out std_logic;
      S_AXI_AWREADY : out std_logic;
      M_AXIS_MM2S_TVALID : in std_logic;
      M_AXIS_MM2S_TKEEP : in std_logic_vector(7 downto 0);
      M_AXIS_MM2S_TDATA : in std_logic_vector(63 downto 0);
      M_AXIS_MM2S_TLAST : in std_logic;
      M_AXIS_MM2S_TREADY : out std_logic
    );
  end component;

begin

  axi_hdmi_tx_16b_0 : axi_hdmi_tx_16b
    generic map (
      C_S_AXI_DATA_WIDTH => 32,
      C_S_AXI_ADDR_WIDTH => 32,
      C_S_AXI_MIN_SIZE => X"000001ff",
      C_USE_WSTRB => 0,
      C_DPHASE_TIMEOUT => 8,
      C_BASEADDR => X"40420000",
      C_HIGHADDR => X"4042FFFF",
      C_FAMILY => "zynq",
      C_NUM_REG => 1,
      C_NUM_MEM => 1,
      C_SLV_AWIDTH => 32,
      C_SLV_DWIDTH => 32
    )
    port map (
      hdmi_ref_clk => hdmi_ref_clk,
      hdmi_clk => hdmi_clk,
      hdmi_vsync => hdmi_vsync,
      hdmi_hsync => hdmi_hsync,
      hdmi_data_e => hdmi_data_e,
      hdmi_data => hdmi_data,
      vdma_clk => vdma_clk,
      vdma_fs => vdma_fs,
      vdma_fs_ret => vdma_fs_ret,
      vdma_empty => vdma_empty,
      vdma_almost_empty => vdma_almost_empty,
      up_status => up_status,
      debug_trigger => debug_trigger,
      debug_data => debug_data,
      S_AXI_ACLK => S_AXI_ACLK,
      S_AXI_ARESETN => S_AXI_ARESETN,
      S_AXI_AWADDR => S_AXI_AWADDR,
      S_AXI_AWVALID => S_AXI_AWVALID,
      S_AXI_WDATA => S_AXI_WDATA,
      S_AXI_WSTRB => S_AXI_WSTRB,
      S_AXI_WVALID => S_AXI_WVALID,
      S_AXI_BREADY => S_AXI_BREADY,
      S_AXI_ARADDR => S_AXI_ARADDR,
      S_AXI_ARVALID => S_AXI_ARVALID,
      S_AXI_RREADY => S_AXI_RREADY,
      S_AXI_ARREADY => S_AXI_ARREADY,
      S_AXI_RDATA => S_AXI_RDATA,
      S_AXI_RRESP => S_AXI_RRESP,
      S_AXI_RVALID => S_AXI_RVALID,
      S_AXI_WREADY => S_AXI_WREADY,
      S_AXI_BRESP => S_AXI_BRESP,
      S_AXI_BVALID => S_AXI_BVALID,
      S_AXI_AWREADY => S_AXI_AWREADY,
      M_AXIS_MM2S_TVALID => M_AXIS_MM2S_TVALID,
      M_AXIS_MM2S_TKEEP => M_AXIS_MM2S_TKEEP,
      M_AXIS_MM2S_TDATA => M_AXIS_MM2S_TDATA,
      M_AXIS_MM2S_TLAST => M_AXIS_MM2S_TLAST,
      M_AXIS_MM2S_TREADY => M_AXIS_MM2S_TREADY
    );

end architecture STRUCTURE;

