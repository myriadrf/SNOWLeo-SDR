--------------------------------------------------------------------------------
--
-- FIFO Generator Core - core top file for implementation
--
--------------------------------------------------------------------------------
--
-- (c) Copyright 2009 - 2010 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--------------------------------------------------------------------------------
--
-- Filename: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_exdes.vhd
--
-- Description:
--   This is the FIFO core wrapper with BUFG instances for clock connections.
--
--------------------------------------------------------------------------------
-- Library Declarations
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library unisim;
use unisim.vcomponents.all;

--------------------------------------------------------------------------------
-- Entity Declaration
--------------------------------------------------------------------------------
entity cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_exdes is
   PORT (
           S_ARESETN                 : IN  std_logic;
           M_AXI_AWID                : OUT std_logic_vector(1-1 DOWNTO 0);
           M_AXI_AWADDR              : OUT std_logic_vector(32-1 DOWNTO 0);
           M_AXI_AWLEN               : OUT std_logic_vector(8-1 DOWNTO 0);
           M_AXI_AWSIZE              : OUT std_logic_vector(3-1 DOWNTO 0);
           M_AXI_AWBURST             : OUT std_logic_vector(2-1 DOWNTO 0);
           M_AXI_AWLOCK              : OUT std_logic_vector(2-1 DOWNTO 0);
           M_AXI_AWCACHE             : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_AWPROT              : OUT std_logic_vector(3-1 DOWNTO 0);
           M_AXI_AWQOS               : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_AWREGION            : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_AWVALID             : OUT std_logic;
           M_AXI_AWREADY             : IN  std_logic;
           M_AXI_WID                 : OUT std_logic_vector(1-1 DOWNTO 0);
           M_AXI_WDATA               : OUT std_logic_vector(64-1 DOWNTO 0);
           M_AXI_WSTRB               : OUT std_logic_vector(64/8-1 DOWNTO 0);
           M_AXI_WLAST               : OUT std_logic;
           M_AXI_WVALID              : OUT std_logic;
           M_AXI_WREADY              : IN  std_logic;
           M_AXI_BID                 : IN  std_logic_vector(1-1 DOWNTO 0);
           M_AXI_BRESP               : IN  std_logic_vector(2-1 DOWNTO 0);
           M_AXI_BVALID              : IN  std_logic;
           M_AXI_BREADY              : OUT std_logic;
           S_AXI_AWID                : IN  std_logic_vector(1-1 DOWNTO 0);
           S_AXI_AWADDR              : IN  std_logic_vector(32-1 DOWNTO 0);
           S_AXI_AWLEN               : IN  std_logic_vector(8-1 DOWNTO 0);
           S_AXI_AWSIZE              : IN  std_logic_vector(3-1 DOWNTO 0);
           S_AXI_AWBURST             : IN  std_logic_vector(2-1 DOWNTO 0);
           S_AXI_AWLOCK              : IN  std_logic_vector(2-1 DOWNTO 0);
           S_AXI_AWCACHE             : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_AWPROT              : IN  std_logic_vector(3-1 DOWNTO 0);
           S_AXI_AWQOS               : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_AWREGION            : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_AWVALID             : IN  std_logic;
           S_AXI_AWREADY             : OUT std_logic;
           S_AXI_WID                 : IN  std_logic_vector(1-1 DOWNTO 0);
           S_AXI_WDATA               : IN  std_logic_vector(64-1 DOWNTO 0);
           S_AXI_WSTRB               : IN  std_logic_vector(64/8-1 DOWNTO 0);
           S_AXI_WLAST               : IN  std_logic;
           S_AXI_WVALID              : IN  std_logic;
           S_AXI_WREADY              : OUT std_logic;
           S_AXI_BID                 : OUT std_logic_vector(1-1 DOWNTO 0);
           S_AXI_BRESP               : OUT std_logic_vector(2-1 DOWNTO 0);
           S_AXI_BVALID              : OUT std_logic;
           S_AXI_BREADY              : IN  std_logic;
           M_AXI_ARID                : OUT std_logic_vector(1-1 DOWNTO 0);
           M_AXI_ARADDR              : OUT std_logic_vector(32-1 DOWNTO 0);
           M_AXI_ARLEN               : OUT std_logic_vector(8-1 DOWNTO 0);
           M_AXI_ARSIZE              : OUT std_logic_vector(3-1 DOWNTO 0);
           M_AXI_ARBURST             : OUT std_logic_vector(2-1 DOWNTO 0);
           M_AXI_ARLOCK              : OUT std_logic_vector(2-1 DOWNTO 0);
           M_AXI_ARCACHE             : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_ARPROT              : OUT std_logic_vector(3-1 DOWNTO 0);
           M_AXI_ARQOS               : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_ARREGION            : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_ARVALID             : OUT std_logic;
           M_AXI_ARREADY             : IN  std_logic;
           M_AXI_RID                 : IN  std_logic_vector(1-1 DOWNTO 0);
           M_AXI_RDATA               : IN  std_logic_vector(64-1 DOWNTO 0);
           M_AXI_RRESP               : IN  std_logic_vector(2-1 DOWNTO 0);
           M_AXI_RLAST               : IN  std_logic;
           M_AXI_RVALID              : IN  std_logic;
           M_AXI_RREADY              : OUT std_logic;
           S_AXI_ARID                : IN  std_logic_vector(1-1 DOWNTO 0);
           S_AXI_ARADDR              : IN  std_logic_vector(32-1 DOWNTO 0);
           S_AXI_ARLEN               : IN  std_logic_vector(8-1 DOWNTO 0);
           S_AXI_ARSIZE              : IN  std_logic_vector(3-1 DOWNTO 0);
           S_AXI_ARBURST             : IN  std_logic_vector(2-1 DOWNTO 0);
           S_AXI_ARLOCK              : IN  std_logic_vector(2-1 DOWNTO 0);
           S_AXI_ARCACHE             : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_ARPROT              : IN  std_logic_vector(3-1 DOWNTO 0);
           S_AXI_ARQOS               : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_ARREGION            : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_ARVALID             : IN  std_logic;
           S_AXI_ARREADY             : OUT std_logic;
           S_AXI_RID                 : OUT std_logic_vector(1-1 DOWNTO 0);
           S_AXI_RDATA               : OUT std_logic_vector(64-1 DOWNTO 0);
           S_AXI_RRESP               : OUT std_logic_vector(2-1 DOWNTO 0);
           S_AXI_RLAST               : OUT std_logic;
           S_AXI_RVALID              : OUT std_logic;
           S_AXI_RREADY              : IN  std_logic;
           AXI_AW_PROG_FULL          : OUT std_logic;
           AXI_AW_PROG_EMPTY         : OUT std_logic;
           AXI_W_PROG_FULL           : OUT std_logic;
           AXI_W_PROG_EMPTY          : OUT std_logic;
           AXI_B_PROG_FULL           : OUT std_logic;
           AXI_B_PROG_EMPTY          : OUT std_logic;
           AXI_AR_PROG_FULL          : OUT std_logic;
           AXI_AR_PROG_EMPTY         : OUT std_logic;
           AXI_R_PROG_FULL           : OUT std_logic;
           AXI_R_PROG_EMPTY          : OUT std_logic;
           S_ACLK                    : IN  std_logic);

end cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_exdes;



architecture xilinx of cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_exdes is


  signal s_aclk_i : std_logic;


  component cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3 is
   PORT (
           S_ARESETN                 : IN  std_logic;
           M_AXI_AWID                : OUT std_logic_vector(1-1 DOWNTO 0);
           M_AXI_AWADDR              : OUT std_logic_vector(32-1 DOWNTO 0);
           M_AXI_AWLEN               : OUT std_logic_vector(8-1 DOWNTO 0);
           M_AXI_AWSIZE              : OUT std_logic_vector(3-1 DOWNTO 0);
           M_AXI_AWBURST             : OUT std_logic_vector(2-1 DOWNTO 0);
           M_AXI_AWLOCK              : OUT std_logic_vector(2-1 DOWNTO 0);
           M_AXI_AWCACHE             : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_AWPROT              : OUT std_logic_vector(3-1 DOWNTO 0);
           M_AXI_AWQOS               : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_AWREGION            : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_AWVALID             : OUT std_logic;
           M_AXI_AWREADY             : IN  std_logic;
           M_AXI_WID                 : OUT std_logic_vector(1-1 DOWNTO 0);
           M_AXI_WDATA               : OUT std_logic_vector(64-1 DOWNTO 0);
           M_AXI_WSTRB               : OUT std_logic_vector(64/8-1 DOWNTO 0);
           M_AXI_WLAST               : OUT std_logic;
           M_AXI_WVALID              : OUT std_logic;
           M_AXI_WREADY              : IN  std_logic;
           M_AXI_BID                 : IN  std_logic_vector(1-1 DOWNTO 0);
           M_AXI_BRESP               : IN  std_logic_vector(2-1 DOWNTO 0);
           M_AXI_BVALID              : IN  std_logic;
           M_AXI_BREADY              : OUT std_logic;
           S_AXI_AWID                : IN  std_logic_vector(1-1 DOWNTO 0);
           S_AXI_AWADDR              : IN  std_logic_vector(32-1 DOWNTO 0);
           S_AXI_AWLEN               : IN  std_logic_vector(8-1 DOWNTO 0);
           S_AXI_AWSIZE              : IN  std_logic_vector(3-1 DOWNTO 0);
           S_AXI_AWBURST             : IN  std_logic_vector(2-1 DOWNTO 0);
           S_AXI_AWLOCK              : IN  std_logic_vector(2-1 DOWNTO 0);
           S_AXI_AWCACHE             : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_AWPROT              : IN  std_logic_vector(3-1 DOWNTO 0);
           S_AXI_AWQOS               : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_AWREGION            : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_AWVALID             : IN  std_logic;
           S_AXI_AWREADY             : OUT std_logic;
           S_AXI_WID                 : IN  std_logic_vector(1-1 DOWNTO 0);
           S_AXI_WDATA               : IN  std_logic_vector(64-1 DOWNTO 0);
           S_AXI_WSTRB               : IN  std_logic_vector(64/8-1 DOWNTO 0);
           S_AXI_WLAST               : IN  std_logic;
           S_AXI_WVALID              : IN  std_logic;
           S_AXI_WREADY              : OUT std_logic;
           S_AXI_BID                 : OUT std_logic_vector(1-1 DOWNTO 0);
           S_AXI_BRESP               : OUT std_logic_vector(2-1 DOWNTO 0);
           S_AXI_BVALID              : OUT std_logic;
           S_AXI_BREADY              : IN  std_logic;
           M_AXI_ARID                : OUT std_logic_vector(1-1 DOWNTO 0);
           M_AXI_ARADDR              : OUT std_logic_vector(32-1 DOWNTO 0);
           M_AXI_ARLEN               : OUT std_logic_vector(8-1 DOWNTO 0);
           M_AXI_ARSIZE              : OUT std_logic_vector(3-1 DOWNTO 0);
           M_AXI_ARBURST             : OUT std_logic_vector(2-1 DOWNTO 0);
           M_AXI_ARLOCK              : OUT std_logic_vector(2-1 DOWNTO 0);
           M_AXI_ARCACHE             : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_ARPROT              : OUT std_logic_vector(3-1 DOWNTO 0);
           M_AXI_ARQOS               : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_ARREGION            : OUT std_logic_vector(4-1 DOWNTO 0);
           M_AXI_ARVALID             : OUT std_logic;
           M_AXI_ARREADY             : IN  std_logic;
           M_AXI_RID                 : IN  std_logic_vector(1-1 DOWNTO 0);
           M_AXI_RDATA               : IN  std_logic_vector(64-1 DOWNTO 0);
           M_AXI_RRESP               : IN  std_logic_vector(2-1 DOWNTO 0);
           M_AXI_RLAST               : IN  std_logic;
           M_AXI_RVALID              : IN  std_logic;
           M_AXI_RREADY              : OUT std_logic;
           S_AXI_ARID                : IN  std_logic_vector(1-1 DOWNTO 0);
           S_AXI_ARADDR              : IN  std_logic_vector(32-1 DOWNTO 0);
           S_AXI_ARLEN               : IN  std_logic_vector(8-1 DOWNTO 0);
           S_AXI_ARSIZE              : IN  std_logic_vector(3-1 DOWNTO 0);
           S_AXI_ARBURST             : IN  std_logic_vector(2-1 DOWNTO 0);
           S_AXI_ARLOCK              : IN  std_logic_vector(2-1 DOWNTO 0);
           S_AXI_ARCACHE             : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_ARPROT              : IN  std_logic_vector(3-1 DOWNTO 0);
           S_AXI_ARQOS               : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_ARREGION            : IN  std_logic_vector(4-1 DOWNTO 0);
           S_AXI_ARVALID             : IN  std_logic;
           S_AXI_ARREADY             : OUT std_logic;
           S_AXI_RID                 : OUT std_logic_vector(1-1 DOWNTO 0);
           S_AXI_RDATA               : OUT std_logic_vector(64-1 DOWNTO 0);
           S_AXI_RRESP               : OUT std_logic_vector(2-1 DOWNTO 0);
           S_AXI_RLAST               : OUT std_logic;
           S_AXI_RVALID              : OUT std_logic;
           S_AXI_RREADY              : IN  std_logic;
           AXI_AW_PROG_FULL          : OUT std_logic;
           AXI_AW_PROG_EMPTY         : OUT std_logic;
           AXI_W_PROG_FULL           : OUT std_logic;
           AXI_W_PROG_EMPTY          : OUT std_logic;
           AXI_B_PROG_FULL           : OUT std_logic;
           AXI_B_PROG_EMPTY          : OUT std_logic;
           AXI_AR_PROG_FULL          : OUT std_logic;
           AXI_AR_PROG_EMPTY         : OUT std_logic;
           AXI_R_PROG_FULL           : OUT std_logic;
           AXI_R_PROG_EMPTY          : OUT std_logic;
           S_ACLK                    : IN  std_logic);

  end component;


begin

  s_aclk_buf: bufg
    PORT map(
      i => S_ACLK,
      o => s_aclk_i
      );


  exdes_inst : cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3 
    PORT MAP (
           S_ARESETN                 => s_aresetn,
           M_AXI_AWID                => m_axi_awid,
           M_AXI_AWADDR              => m_axi_awaddr,
           M_AXI_AWLEN               => m_axi_awlen,
           M_AXI_AWSIZE              => m_axi_awsize,
           M_AXI_AWBURST             => m_axi_awburst,
           M_AXI_AWLOCK              => m_axi_awlock,
           M_AXI_AWCACHE             => m_axi_awcache,
           M_AXI_AWPROT              => m_axi_awprot,
           M_AXI_AWQOS               => m_axi_awqos,
           M_AXI_AWREGION            => m_axi_awregion,
           M_AXI_AWVALID             => m_axi_awvalid,
           M_AXI_AWREADY             => m_axi_awready,
           M_AXI_WID                 => m_axi_wid,
           M_AXI_WDATA               => m_axi_wdata,
           M_AXI_WSTRB               => m_axi_wstrb,
           M_AXI_WLAST               => m_axi_wlast,
           M_AXI_WVALID              => m_axi_wvalid,
           M_AXI_WREADY              => m_axi_wready,
           M_AXI_BID                 => m_axi_bid,
           M_AXI_BRESP               => m_axi_bresp,
           M_AXI_BVALID              => m_axi_bvalid,
           M_AXI_BREADY              => m_axi_bready,
           S_AXI_AWID                => s_axi_awid,
           S_AXI_AWADDR              => s_axi_awaddr,
           S_AXI_AWLEN               => s_axi_awlen,
           S_AXI_AWSIZE              => s_axi_awsize,
           S_AXI_AWBURST             => s_axi_awburst,
           S_AXI_AWLOCK              => s_axi_awlock,
           S_AXI_AWCACHE             => s_axi_awcache,
           S_AXI_AWPROT              => s_axi_awprot,
           S_AXI_AWQOS               => s_axi_awqos,
           S_AXI_AWREGION            => s_axi_awregion,
           S_AXI_AWVALID             => s_axi_awvalid,
           S_AXI_AWREADY             => s_axi_awready,
           S_AXI_WID                 => s_axi_wid,
           S_AXI_WDATA               => s_axi_wdata,
           S_AXI_WSTRB               => s_axi_wstrb,
           S_AXI_WLAST               => s_axi_wlast,
           S_AXI_WVALID              => s_axi_wvalid,
           S_AXI_WREADY              => s_axi_wready,
           S_AXI_BID                 => s_axi_bid,
           S_AXI_BRESP               => s_axi_bresp,
           S_AXI_BVALID              => s_axi_bvalid,
           S_AXI_BREADY              => s_axi_bready,
           M_AXI_ARID                => m_axi_arid,
           M_AXI_ARADDR              => m_axi_araddr,
           M_AXI_ARLEN               => m_axi_arlen,
           M_AXI_ARSIZE              => m_axi_arsize,
           M_AXI_ARBURST             => m_axi_arburst,
           M_AXI_ARLOCK              => m_axi_arlock,
           M_AXI_ARCACHE             => m_axi_arcache,
           M_AXI_ARPROT              => m_axi_arprot,
           M_AXI_ARQOS               => m_axi_arqos,
           M_AXI_ARREGION            => m_axi_arregion,
           M_AXI_ARVALID             => m_axi_arvalid,
           M_AXI_ARREADY             => m_axi_arready,
           M_AXI_RID                 => m_axi_rid,
           M_AXI_RDATA               => m_axi_rdata,
           M_AXI_RRESP               => m_axi_rresp,
           M_AXI_RLAST               => m_axi_rlast,
           M_AXI_RVALID              => m_axi_rvalid,
           M_AXI_RREADY              => m_axi_rready,
           S_AXI_ARID                => s_axi_arid,
           S_AXI_ARADDR              => s_axi_araddr,
           S_AXI_ARLEN               => s_axi_arlen,
           S_AXI_ARSIZE              => s_axi_arsize,
           S_AXI_ARBURST             => s_axi_arburst,
           S_AXI_ARLOCK              => s_axi_arlock,
           S_AXI_ARCACHE             => s_axi_arcache,
           S_AXI_ARPROT              => s_axi_arprot,
           S_AXI_ARQOS               => s_axi_arqos,
           S_AXI_ARREGION            => s_axi_arregion,
           S_AXI_ARVALID             => s_axi_arvalid,
           S_AXI_ARREADY             => s_axi_arready,
           S_AXI_RID                 => s_axi_rid,
           S_AXI_RDATA               => s_axi_rdata,
           S_AXI_RRESP               => s_axi_rresp,
           S_AXI_RLAST               => s_axi_rlast,
           S_AXI_RVALID              => s_axi_rvalid,
           S_AXI_RREADY              => s_axi_rready,
           AXI_AW_PROG_FULL          => axi_aw_prog_full,
           AXI_AW_PROG_EMPTY         => axi_aw_prog_empty,
           AXI_W_PROG_FULL           => axi_w_prog_full,
           AXI_W_PROG_EMPTY          => axi_w_prog_empty,
           AXI_B_PROG_FULL           => axi_b_prog_full,
           AXI_B_PROG_EMPTY          => axi_b_prog_empty,
           AXI_AR_PROG_FULL          => axi_ar_prog_full,
           AXI_AR_PROG_EMPTY         => axi_ar_prog_empty,
           AXI_R_PROG_FULL           => axi_r_prog_full,
           AXI_R_PROG_EMPTY          => axi_r_prog_empty,
           S_ACLK                    => s_aclk_i);

end xilinx;
