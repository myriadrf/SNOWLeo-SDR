-------------------------------------------------------------------------------
-- cpu0_axi_vdma_0_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library axi_vdma_v5_04_a;
use axi_vdma_v5_04_a.all;

entity cpu0_axi_vdma_0_wrapper is
  port (
    s_axi_lite_aclk : in std_logic;
    m_axi_sg_aclk : in std_logic;
    m_axi_mm2s_aclk : in std_logic;
    m_axi_s2mm_aclk : in std_logic;
    m_axis_mm2s_aclk : in std_logic;
    s_axis_s2mm_aclk : in std_logic;
    axi_resetn : in std_logic;
    s_axi_lite_awvalid : in std_logic;
    s_axi_lite_awready : out std_logic;
    s_axi_lite_awaddr : in std_logic_vector(8 downto 0);
    s_axi_lite_wvalid : in std_logic;
    s_axi_lite_wready : out std_logic;
    s_axi_lite_wdata : in std_logic_vector(31 downto 0);
    s_axi_lite_bresp : out std_logic_vector(1 downto 0);
    s_axi_lite_bvalid : out std_logic;
    s_axi_lite_bready : in std_logic;
    s_axi_lite_arvalid : in std_logic;
    s_axi_lite_arready : out std_logic;
    s_axi_lite_araddr : in std_logic_vector(8 downto 0);
    s_axi_lite_rvalid : out std_logic;
    s_axi_lite_rready : in std_logic;
    s_axi_lite_rdata : out std_logic_vector(31 downto 0);
    s_axi_lite_rresp : out std_logic_vector(1 downto 0);
    m_axi_sg_araddr : out std_logic_vector(31 downto 0);
    m_axi_sg_arlen : out std_logic_vector(7 downto 0);
    m_axi_sg_arsize : out std_logic_vector(2 downto 0);
    m_axi_sg_arburst : out std_logic_vector(1 downto 0);
    m_axi_sg_arprot : out std_logic_vector(2 downto 0);
    m_axi_sg_arcache : out std_logic_vector(3 downto 0);
    m_axi_sg_arvalid : out std_logic;
    m_axi_sg_arready : in std_logic;
    m_axi_sg_rdata : in std_logic_vector(31 downto 0);
    m_axi_sg_rresp : in std_logic_vector(1 downto 0);
    m_axi_sg_rlast : in std_logic;
    m_axi_sg_rvalid : in std_logic;
    m_axi_sg_rready : out std_logic;
    m_axi_mm2s_araddr : out std_logic_vector(31 downto 0);
    m_axi_mm2s_arlen : out std_logic_vector(7 downto 0);
    m_axi_mm2s_arsize : out std_logic_vector(2 downto 0);
    m_axi_mm2s_arburst : out std_logic_vector(1 downto 0);
    m_axi_mm2s_arprot : out std_logic_vector(2 downto 0);
    m_axi_mm2s_arcache : out std_logic_vector(3 downto 0);
    m_axi_mm2s_arvalid : out std_logic;
    m_axi_mm2s_arready : in std_logic;
    m_axi_mm2s_rdata : in std_logic_vector(63 downto 0);
    m_axi_mm2s_rresp : in std_logic_vector(1 downto 0);
    m_axi_mm2s_rlast : in std_logic;
    m_axi_mm2s_rvalid : in std_logic;
    m_axi_mm2s_rready : out std_logic;
    mm2s_prmry_reset_out_n : out std_logic;
    m_axis_mm2s_tdata : out std_logic_vector(63 downto 0);
    m_axis_mm2s_tkeep : out std_logic_vector(7 downto 0);
    m_axis_mm2s_tvalid : out std_logic;
    m_axis_mm2s_tready : in std_logic;
    m_axis_mm2s_tlast : out std_logic;
    m_axis_mm2s_tuser : out std_logic_vector(0 to 0);
    m_axi_s2mm_awaddr : out std_logic_vector(31 downto 0);
    m_axi_s2mm_awlen : out std_logic_vector(7 downto 0);
    m_axi_s2mm_awsize : out std_logic_vector(2 downto 0);
    m_axi_s2mm_awburst : out std_logic_vector(1 downto 0);
    m_axi_s2mm_awprot : out std_logic_vector(2 downto 0);
    m_axi_s2mm_awcache : out std_logic_vector(3 downto 0);
    m_axi_s2mm_awvalid : out std_logic;
    m_axi_s2mm_awready : in std_logic;
    m_axi_s2mm_wdata : out std_logic_vector(31 downto 0);
    m_axi_s2mm_wstrb : out std_logic_vector(3 downto 0);
    m_axi_s2mm_wlast : out std_logic;
    m_axi_s2mm_wvalid : out std_logic;
    m_axi_s2mm_wready : in std_logic;
    m_axi_s2mm_bresp : in std_logic_vector(1 downto 0);
    m_axi_s2mm_bvalid : in std_logic;
    m_axi_s2mm_bready : out std_logic;
    s2mm_prmry_reset_out_n : out std_logic;
    s_axis_s2mm_tdata : in std_logic_vector(31 downto 0);
    s_axis_s2mm_tkeep : in std_logic_vector(3 downto 0);
    s_axis_s2mm_tvalid : in std_logic;
    s_axis_s2mm_tready : out std_logic;
    s_axis_s2mm_tlast : in std_logic;
    s_axis_s2mm_tuser : in std_logic_vector(0 to 0);
    mm2s_fsync : in std_logic;
    mm2s_frame_ptr_in : in std_logic_vector(5 downto 0);
    mm2s_frame_ptr_out : out std_logic_vector(5 downto 0);
    mm2s_fsync_out : out std_logic;
    mm2s_prmtr_update : out std_logic;
    mm2s_buffer_empty : out std_logic;
    mm2s_buffer_almost_empty : out std_logic;
    s2mm_fsync : in std_logic;
    s2mm_frame_ptr_in : in std_logic_vector(5 downto 0);
    s2mm_frame_ptr_out : out std_logic_vector(5 downto 0);
    s2mm_fsync_out : out std_logic;
    s2mm_buffer_full : out std_logic;
    s2mm_buffer_almost_full : out std_logic;
    s2mm_prmtr_update : out std_logic;
    mm2s_introut : out std_logic;
    s2mm_introut : out std_logic;
    axi_vdma_tstvec : out std_logic_vector(63 downto 0)
  );
end cpu0_axi_vdma_0_wrapper;

architecture STRUCTURE of cpu0_axi_vdma_0_wrapper is

  component axi_vdma is
    generic (
      C_S_AXI_LITE_ADDR_WIDTH : INTEGER;
      C_S_AXI_LITE_DATA_WIDTH : INTEGER;
      C_DLYTMR_RESOLUTION : INTEGER;
      C_PRMRY_IS_ACLK_ASYNC : INTEGER;
      C_M_AXI_SG_ADDR_WIDTH : INTEGER;
      C_M_AXI_SG_DATA_WIDTH : INTEGER;
      C_NUM_FSTORES : INTEGER;
      C_USE_FSYNC : INTEGER;
      C_FLUSH_ON_FSYNC : INTEGER;
      C_DYNAMIC_RESOLUTION : INTEGER;
      C_INCLUDE_SG : INTEGER;
      C_INCLUDE_INTERNAL_GENLOCK : INTEGER;
      C_ENABLE_VIDPRMTR_READS : INTEGER;
      C_INCLUDE_MM2S : INTEGER;
      C_M_AXI_MM2S_DATA_WIDTH : INTEGER;
      C_M_AXIS_MM2S_TDATA_WIDTH : INTEGER;
      C_INCLUDE_MM2S_DRE : INTEGER;
      C_INCLUDE_MM2S_SF : INTEGER;
      C_MM2S_SOF_ENABLE : INTEGER;
      C_MM2S_MAX_BURST_LENGTH : INTEGER;
      C_MM2S_GENLOCK_MODE : INTEGER;
      C_MM2S_GENLOCK_NUM_MASTERS : INTEGER;
      C_MM2S_GENLOCK_REPEAT_EN : INTEGER;
      C_MM2S_LINEBUFFER_DEPTH : INTEGER;
      C_MM2S_LINEBUFFER_THRESH : INTEGER;
      C_M_AXI_MM2S_ADDR_WIDTH : INTEGER;
      C_M_AXIS_MM2S_TUSER_BITS : INTEGER;
      C_INCLUDE_S2MM : INTEGER;
      C_M_AXI_S2MM_DATA_WIDTH : INTEGER;
      C_S_AXIS_S2MM_TDATA_WIDTH : INTEGER;
      C_INCLUDE_S2MM_DRE : INTEGER;
      C_INCLUDE_S2MM_SF : INTEGER;
      C_S2MM_SOF_ENABLE : INTEGER;
      C_S2MM_MAX_BURST_LENGTH : INTEGER;
      C_S2MM_GENLOCK_MODE : INTEGER;
      C_S2MM_GENLOCK_NUM_MASTERS : INTEGER;
      C_S2MM_GENLOCK_REPEAT_EN : INTEGER;
      C_S2MM_LINEBUFFER_DEPTH : INTEGER;
      C_S2MM_LINEBUFFER_THRESH : INTEGER;
      C_M_AXI_S2MM_ADDR_WIDTH : INTEGER;
      C_S_AXIS_S2MM_TUSER_BITS : INTEGER;
      C_FAMILY : STRING;
      C_INSTANCE : STRING
    );
    port (
      s_axi_lite_aclk : in std_logic;
      m_axi_sg_aclk : in std_logic;
      m_axi_mm2s_aclk : in std_logic;
      m_axi_s2mm_aclk : in std_logic;
      m_axis_mm2s_aclk : in std_logic;
      s_axis_s2mm_aclk : in std_logic;
      axi_resetn : in std_logic;
      s_axi_lite_awvalid : in std_logic;
      s_axi_lite_awready : out std_logic;
      s_axi_lite_awaddr : in std_logic_vector(C_S_AXI_LITE_ADDR_WIDTH-1 downto 0);
      s_axi_lite_wvalid : in std_logic;
      s_axi_lite_wready : out std_logic;
      s_axi_lite_wdata : in std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0);
      s_axi_lite_bresp : out std_logic_vector(1 downto 0);
      s_axi_lite_bvalid : out std_logic;
      s_axi_lite_bready : in std_logic;
      s_axi_lite_arvalid : in std_logic;
      s_axi_lite_arready : out std_logic;
      s_axi_lite_araddr : in std_logic_vector(C_S_AXI_LITE_ADDR_WIDTH-1 downto 0);
      s_axi_lite_rvalid : out std_logic;
      s_axi_lite_rready : in std_logic;
      s_axi_lite_rdata : out std_logic_vector(C_S_AXI_LITE_DATA_WIDTH-1 downto 0);
      s_axi_lite_rresp : out std_logic_vector(1 downto 0);
      m_axi_sg_araddr : out std_logic_vector(C_M_AXI_SG_ADDR_WIDTH-1 downto 0);
      m_axi_sg_arlen : out std_logic_vector(7 downto 0);
      m_axi_sg_arsize : out std_logic_vector(2 downto 0);
      m_axi_sg_arburst : out std_logic_vector(1 downto 0);
      m_axi_sg_arprot : out std_logic_vector(2 downto 0);
      m_axi_sg_arcache : out std_logic_vector(3 downto 0);
      m_axi_sg_arvalid : out std_logic;
      m_axi_sg_arready : in std_logic;
      m_axi_sg_rdata : in std_logic_vector(C_M_AXI_SG_DATA_WIDTH-1 downto 0);
      m_axi_sg_rresp : in std_logic_vector(1 downto 0);
      m_axi_sg_rlast : in std_logic;
      m_axi_sg_rvalid : in std_logic;
      m_axi_sg_rready : out std_logic;
      m_axi_mm2s_araddr : out std_logic_vector(C_M_AXI_MM2S_ADDR_WIDTH-1 downto 0);
      m_axi_mm2s_arlen : out std_logic_vector(7 downto 0);
      m_axi_mm2s_arsize : out std_logic_vector(2 downto 0);
      m_axi_mm2s_arburst : out std_logic_vector(1 downto 0);
      m_axi_mm2s_arprot : out std_logic_vector(2 downto 0);
      m_axi_mm2s_arcache : out std_logic_vector(3 downto 0);
      m_axi_mm2s_arvalid : out std_logic;
      m_axi_mm2s_arready : in std_logic;
      m_axi_mm2s_rdata : in std_logic_vector(C_M_AXI_MM2S_DATA_WIDTH-1 downto 0);
      m_axi_mm2s_rresp : in std_logic_vector(1 downto 0);
      m_axi_mm2s_rlast : in std_logic;
      m_axi_mm2s_rvalid : in std_logic;
      m_axi_mm2s_rready : out std_logic;
      mm2s_prmry_reset_out_n : out std_logic;
      m_axis_mm2s_tdata : out std_logic_vector(C_M_AXIS_MM2S_TDATA_WIDTH-1 downto 0);
      m_axis_mm2s_tkeep : out std_logic_vector((C_M_AXIS_MM2S_TDATA_WIDTH/8)-1 downto 0);
      m_axis_mm2s_tvalid : out std_logic;
      m_axis_mm2s_tready : in std_logic;
      m_axis_mm2s_tlast : out std_logic;
      m_axis_mm2s_tuser : out std_logic_vector(C_M_AXIS_MM2S_TUSER_BITS-1 to 0);
      m_axi_s2mm_awaddr : out std_logic_vector(C_M_AXI_S2MM_ADDR_WIDTH-1 downto 0);
      m_axi_s2mm_awlen : out std_logic_vector(7 downto 0);
      m_axi_s2mm_awsize : out std_logic_vector(2 downto 0);
      m_axi_s2mm_awburst : out std_logic_vector(1 downto 0);
      m_axi_s2mm_awprot : out std_logic_vector(2 downto 0);
      m_axi_s2mm_awcache : out std_logic_vector(3 downto 0);
      m_axi_s2mm_awvalid : out std_logic;
      m_axi_s2mm_awready : in std_logic;
      m_axi_s2mm_wdata : out std_logic_vector(C_M_AXI_S2MM_DATA_WIDTH-1 downto 0);
      m_axi_s2mm_wstrb : out std_logic_vector((C_M_AXI_S2MM_DATA_WIDTH/8)-1 downto 0);
      m_axi_s2mm_wlast : out std_logic;
      m_axi_s2mm_wvalid : out std_logic;
      m_axi_s2mm_wready : in std_logic;
      m_axi_s2mm_bresp : in std_logic_vector(1 downto 0);
      m_axi_s2mm_bvalid : in std_logic;
      m_axi_s2mm_bready : out std_logic;
      s2mm_prmry_reset_out_n : out std_logic;
      s_axis_s2mm_tdata : in std_logic_vector(C_S_AXIS_S2MM_TDATA_WIDTH-1 downto 0);
      s_axis_s2mm_tkeep : in std_logic_vector((C_S_AXIS_S2MM_TDATA_WIDTH/8)-1 downto 0);
      s_axis_s2mm_tvalid : in std_logic;
      s_axis_s2mm_tready : out std_logic;
      s_axis_s2mm_tlast : in std_logic;
      s_axis_s2mm_tuser : in std_logic_vector(C_S_AXIS_S2MM_TUSER_BITS-1 to 0);
      mm2s_fsync : in std_logic;
      mm2s_frame_ptr_in : in std_logic_vector((C_MM2S_GENLOCK_NUM_MASTERS*6)-1 downto 0);
      mm2s_frame_ptr_out : out std_logic_vector(5 downto 0);
      mm2s_fsync_out : out std_logic;
      mm2s_prmtr_update : out std_logic;
      mm2s_buffer_empty : out std_logic;
      mm2s_buffer_almost_empty : out std_logic;
      s2mm_fsync : in std_logic;
      s2mm_frame_ptr_in : in std_logic_vector((C_S2MM_GENLOCK_NUM_MASTERS*6)-1 downto 0);
      s2mm_frame_ptr_out : out std_logic_vector(5 downto 0);
      s2mm_fsync_out : out std_logic;
      s2mm_buffer_full : out std_logic;
      s2mm_buffer_almost_full : out std_logic;
      s2mm_prmtr_update : out std_logic;
      mm2s_introut : out std_logic;
      s2mm_introut : out std_logic;
      axi_vdma_tstvec : out std_logic_vector(63 downto 0)
    );
  end component;

begin

  axi_vdma_0 : axi_vdma
    generic map (
      C_S_AXI_LITE_ADDR_WIDTH => 9,
      C_S_AXI_LITE_DATA_WIDTH => 32,
      C_DLYTMR_RESOLUTION => 125,
      C_PRMRY_IS_ACLK_ASYNC => 1,
      C_M_AXI_SG_ADDR_WIDTH => 32,
      C_M_AXI_SG_DATA_WIDTH => 32,
      C_NUM_FSTORES => 3,
      C_USE_FSYNC => 1,
      C_FLUSH_ON_FSYNC => 1,
      C_DYNAMIC_RESOLUTION => 0,
      C_INCLUDE_SG => 0,
      C_INCLUDE_INTERNAL_GENLOCK => 1,
      C_ENABLE_VIDPRMTR_READS => 1,
      C_INCLUDE_MM2S => 1,
      C_M_AXI_MM2S_DATA_WIDTH => 64,
      C_M_AXIS_MM2S_TDATA_WIDTH => 64,
      C_INCLUDE_MM2S_DRE => 0,
      C_INCLUDE_MM2S_SF => 1,
      C_MM2S_SOF_ENABLE => 1,
      C_MM2S_MAX_BURST_LENGTH => 16,
      C_MM2S_GENLOCK_MODE => 1,
      C_MM2S_GENLOCK_NUM_MASTERS => 1,
      C_MM2S_GENLOCK_REPEAT_EN => 0,
      C_MM2S_LINEBUFFER_DEPTH => 128,
      C_MM2S_LINEBUFFER_THRESH => 8,
      C_M_AXI_MM2S_ADDR_WIDTH => 32,
      C_M_AXIS_MM2S_TUSER_BITS => 1,
      C_INCLUDE_S2MM => 0,
      C_M_AXI_S2MM_DATA_WIDTH => 32,
      C_S_AXIS_S2MM_TDATA_WIDTH => 32,
      C_INCLUDE_S2MM_DRE => 0,
      C_INCLUDE_S2MM_SF => 1,
      C_S2MM_SOF_ENABLE => 1,
      C_S2MM_MAX_BURST_LENGTH => 16,
      C_S2MM_GENLOCK_MODE => 0,
      C_S2MM_GENLOCK_NUM_MASTERS => 1,
      C_S2MM_GENLOCK_REPEAT_EN => 1,
      C_S2MM_LINEBUFFER_DEPTH => 128,
      C_S2MM_LINEBUFFER_THRESH => 4,
      C_M_AXI_S2MM_ADDR_WIDTH => 32,
      C_S_AXIS_S2MM_TUSER_BITS => 1,
      C_FAMILY => "zynq",
      C_INSTANCE => "axi_vdma_0"
    )
    port map (
      s_axi_lite_aclk => s_axi_lite_aclk,
      m_axi_sg_aclk => m_axi_sg_aclk,
      m_axi_mm2s_aclk => m_axi_mm2s_aclk,
      m_axi_s2mm_aclk => m_axi_s2mm_aclk,
      m_axis_mm2s_aclk => m_axis_mm2s_aclk,
      s_axis_s2mm_aclk => s_axis_s2mm_aclk,
      axi_resetn => axi_resetn,
      s_axi_lite_awvalid => s_axi_lite_awvalid,
      s_axi_lite_awready => s_axi_lite_awready,
      s_axi_lite_awaddr => s_axi_lite_awaddr,
      s_axi_lite_wvalid => s_axi_lite_wvalid,
      s_axi_lite_wready => s_axi_lite_wready,
      s_axi_lite_wdata => s_axi_lite_wdata,
      s_axi_lite_bresp => s_axi_lite_bresp,
      s_axi_lite_bvalid => s_axi_lite_bvalid,
      s_axi_lite_bready => s_axi_lite_bready,
      s_axi_lite_arvalid => s_axi_lite_arvalid,
      s_axi_lite_arready => s_axi_lite_arready,
      s_axi_lite_araddr => s_axi_lite_araddr,
      s_axi_lite_rvalid => s_axi_lite_rvalid,
      s_axi_lite_rready => s_axi_lite_rready,
      s_axi_lite_rdata => s_axi_lite_rdata,
      s_axi_lite_rresp => s_axi_lite_rresp,
      m_axi_sg_araddr => m_axi_sg_araddr,
      m_axi_sg_arlen => m_axi_sg_arlen,
      m_axi_sg_arsize => m_axi_sg_arsize,
      m_axi_sg_arburst => m_axi_sg_arburst,
      m_axi_sg_arprot => m_axi_sg_arprot,
      m_axi_sg_arcache => m_axi_sg_arcache,
      m_axi_sg_arvalid => m_axi_sg_arvalid,
      m_axi_sg_arready => m_axi_sg_arready,
      m_axi_sg_rdata => m_axi_sg_rdata,
      m_axi_sg_rresp => m_axi_sg_rresp,
      m_axi_sg_rlast => m_axi_sg_rlast,
      m_axi_sg_rvalid => m_axi_sg_rvalid,
      m_axi_sg_rready => m_axi_sg_rready,
      m_axi_mm2s_araddr => m_axi_mm2s_araddr,
      m_axi_mm2s_arlen => m_axi_mm2s_arlen,
      m_axi_mm2s_arsize => m_axi_mm2s_arsize,
      m_axi_mm2s_arburst => m_axi_mm2s_arburst,
      m_axi_mm2s_arprot => m_axi_mm2s_arprot,
      m_axi_mm2s_arcache => m_axi_mm2s_arcache,
      m_axi_mm2s_arvalid => m_axi_mm2s_arvalid,
      m_axi_mm2s_arready => m_axi_mm2s_arready,
      m_axi_mm2s_rdata => m_axi_mm2s_rdata,
      m_axi_mm2s_rresp => m_axi_mm2s_rresp,
      m_axi_mm2s_rlast => m_axi_mm2s_rlast,
      m_axi_mm2s_rvalid => m_axi_mm2s_rvalid,
      m_axi_mm2s_rready => m_axi_mm2s_rready,
      mm2s_prmry_reset_out_n => mm2s_prmry_reset_out_n,
      m_axis_mm2s_tdata => m_axis_mm2s_tdata,
      m_axis_mm2s_tkeep => m_axis_mm2s_tkeep,
      m_axis_mm2s_tvalid => m_axis_mm2s_tvalid,
      m_axis_mm2s_tready => m_axis_mm2s_tready,
      m_axis_mm2s_tlast => m_axis_mm2s_tlast,
      m_axis_mm2s_tuser => m_axis_mm2s_tuser,
      m_axi_s2mm_awaddr => m_axi_s2mm_awaddr,
      m_axi_s2mm_awlen => m_axi_s2mm_awlen,
      m_axi_s2mm_awsize => m_axi_s2mm_awsize,
      m_axi_s2mm_awburst => m_axi_s2mm_awburst,
      m_axi_s2mm_awprot => m_axi_s2mm_awprot,
      m_axi_s2mm_awcache => m_axi_s2mm_awcache,
      m_axi_s2mm_awvalid => m_axi_s2mm_awvalid,
      m_axi_s2mm_awready => m_axi_s2mm_awready,
      m_axi_s2mm_wdata => m_axi_s2mm_wdata,
      m_axi_s2mm_wstrb => m_axi_s2mm_wstrb,
      m_axi_s2mm_wlast => m_axi_s2mm_wlast,
      m_axi_s2mm_wvalid => m_axi_s2mm_wvalid,
      m_axi_s2mm_wready => m_axi_s2mm_wready,
      m_axi_s2mm_bresp => m_axi_s2mm_bresp,
      m_axi_s2mm_bvalid => m_axi_s2mm_bvalid,
      m_axi_s2mm_bready => m_axi_s2mm_bready,
      s2mm_prmry_reset_out_n => s2mm_prmry_reset_out_n,
      s_axis_s2mm_tdata => s_axis_s2mm_tdata,
      s_axis_s2mm_tkeep => s_axis_s2mm_tkeep,
      s_axis_s2mm_tvalid => s_axis_s2mm_tvalid,
      s_axis_s2mm_tready => s_axis_s2mm_tready,
      s_axis_s2mm_tlast => s_axis_s2mm_tlast,
      s_axis_s2mm_tuser => s_axis_s2mm_tuser,
      mm2s_fsync => mm2s_fsync,
      mm2s_frame_ptr_in => mm2s_frame_ptr_in,
      mm2s_frame_ptr_out => mm2s_frame_ptr_out,
      mm2s_fsync_out => mm2s_fsync_out,
      mm2s_prmtr_update => mm2s_prmtr_update,
      mm2s_buffer_empty => mm2s_buffer_empty,
      mm2s_buffer_almost_empty => mm2s_buffer_almost_empty,
      s2mm_fsync => s2mm_fsync,
      s2mm_frame_ptr_in => s2mm_frame_ptr_in,
      s2mm_frame_ptr_out => s2mm_frame_ptr_out,
      s2mm_fsync_out => s2mm_fsync_out,
      s2mm_buffer_full => s2mm_buffer_full,
      s2mm_buffer_almost_full => s2mm_buffer_almost_full,
      s2mm_prmtr_update => s2mm_prmtr_update,
      mm2s_introut => mm2s_introut,
      s2mm_introut => s2mm_introut,
      axi_vdma_tstvec => axi_vdma_tstvec
    );

end architecture STRUCTURE;

