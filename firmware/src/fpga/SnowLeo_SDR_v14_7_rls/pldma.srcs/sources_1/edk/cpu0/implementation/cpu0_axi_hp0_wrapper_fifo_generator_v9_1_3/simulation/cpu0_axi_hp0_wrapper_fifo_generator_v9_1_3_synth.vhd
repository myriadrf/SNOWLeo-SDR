--------------------------------------------------------------------------------
--
-- FIFO Generator Core Demo Testbench 
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
-- Filename: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_synth.vhd
--
-- Description:
--   This is the demo testbench for fifo_generator core.
--
--------------------------------------------------------------------------------
-- Library Declarations
--------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.STD_LOGIC_1164.ALL;
USE ieee.STD_LOGIC_unsigned.ALL;
USE IEEE.STD_LOGIC_arith.ALL;
USE ieee.numeric_std.ALL;
USE ieee.STD_LOGIC_misc.ALL;

LIBRARY std;
USE std.textio.ALL;

LIBRARY work;
USE work.cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_pkg.ALL;

--------------------------------------------------------------------------------
-- Entity Declaration
--------------------------------------------------------------------------------
ENTITY cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_synth IS
  GENERIC(
  	   FREEZEON_ERROR : INTEGER := 0;
	   TB_STOP_CNT    : INTEGER := 0;
	   TB_SEED        : INTEGER := 1
	 );
  PORT(
	S_ACLK     :  IN  STD_LOGIC;
        RESET      :  IN  STD_LOGIC;
        SIM_DONE   :  OUT STD_LOGIC;
        STATUS     :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      );
END ENTITY;

ARCHITECTURE simulation_arch OF cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_synth IS
    CONSTANT AWID_OFFSET       : INTEGER := if_then_else(1 = 1,63 - 1,63);
    CONSTANT AWADDR_OFFSET     : INTEGER := AWID_OFFSET - 32;
    CONSTANT AWLEN_OFFSET      : INTEGER := if_then_else(1 = 1,AWADDR_OFFSET - 8,AWADDR_OFFSET);
    CONSTANT AWSIZE_OFFSET     : INTEGER := if_then_else(1 = 1,AWLEN_OFFSET - 3,AWLEN_OFFSET);
    CONSTANT AWBURST_OFFSET    : INTEGER := if_then_else(1 = 1,AWSIZE_OFFSET - 2,AWSIZE_OFFSET);
    CONSTANT AWLOCK_OFFSET     : INTEGER := if_then_else(1 = 1,AWBURST_OFFSET - 2,AWBURST_OFFSET);
    CONSTANT AWCACHE_OFFSET    : INTEGER := if_then_else(1 = 1,AWLOCK_OFFSET - 4,AWLOCK_OFFSET);
    CONSTANT AWPROT_OFFSET     : INTEGER := AWCACHE_OFFSET - 3;
    CONSTANT AWQOS_OFFSET      : INTEGER := AWPROT_OFFSET - 4;
    CONSTANT AWREGION_OFFSET   : INTEGER := AWQOS_OFFSET - 4;
    CONSTANT AWUSER_OFFSET     : INTEGER := if_then_else(0 = 1,AWREGION_OFFSET-1,AWREGION_OFFSET);

    CONSTANT WID_OFFSET        : INTEGER := if_then_else(1 = 1,74 - 1,74);
    CONSTANT WDATA_OFFSET      : INTEGER := WID_OFFSET - 64;
    CONSTANT WSTRB_OFFSET      : INTEGER := WDATA_OFFSET - 64/8;
    CONSTANT WUSER_OFFSET      : INTEGER := if_then_else(0 = 1,WSTRB_OFFSET-1,WSTRB_OFFSET);

    CONSTANT BID_OFFSET        : INTEGER := if_then_else(1 = 1,6 - 1,6);
    CONSTANT BRESP_OFFSET      : INTEGER := BID_OFFSET - 2;
    CONSTANT BUSER_OFFSET      : INTEGER := if_then_else(0 = 1,BRESP_OFFSET-1,BRESP_OFFSET);
    CONSTANT ARID_OFFSET       : INTEGER := if_then_else(1 = 1,63 - 1,63);
    CONSTANT ARADDR_OFFSET     : INTEGER := ARID_OFFSET - 32;
    CONSTANT ARLEN_OFFSET      : INTEGER := if_then_else(1 = 1,ARADDR_OFFSET - 8,ARADDR_OFFSET);
    CONSTANT ARSIZE_OFFSET     : INTEGER := if_then_else(1 = 1,ARLEN_OFFSET - 3,ARLEN_OFFSET);
    CONSTANT ARBURST_OFFSET    : INTEGER := if_then_else(1 = 1,ARSIZE_OFFSET - 2,ARSIZE_OFFSET);
    CONSTANT ARLOCK_OFFSET     : INTEGER := if_then_else(1 = 1,ARBURST_OFFSET - 2,ARBURST_OFFSET);
    CONSTANT ARCACHE_OFFSET    : INTEGER := if_then_else(1 = 1,ARLOCK_OFFSET - 4,ARLOCK_OFFSET);
    CONSTANT ARPROT_OFFSET     : INTEGER := ARCACHE_OFFSET - 3;
    CONSTANT ARQOS_OFFSET      : INTEGER := ARPROT_OFFSET - 4;
    CONSTANT ARREGION_OFFSET   : INTEGER := ARQOS_OFFSET - 4;
    CONSTANT ARUSER_OFFSET     : INTEGER := if_then_else(0 = 1,ARREGION_OFFSET-1,ARREGION_OFFSET);

    CONSTANT RID_OFFSET        : INTEGER := if_then_else(1 = 1,68 - 1,68);
    CONSTANT RDATA_OFFSET      : INTEGER := RID_OFFSET - 64;
    CONSTANT RRESP_OFFSET      : INTEGER := RDATA_OFFSET - 2;
    CONSTANT RUSER_OFFSET      : INTEGER := if_then_else(0 = 1,RRESP_OFFSET-1,RRESP_OFFSET);

    -- FIFO interface signal declarations
    SIGNAL s_aresetn                      :   STD_LOGIC;
    SIGNAL m_axi_awid                     :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL m_axi_awaddr                   :   STD_LOGIC_VECTOR(32-1 DOWNTO 0);
    SIGNAL m_axi_awlen                    :   STD_LOGIC_VECTOR(8-1 DOWNTO 0);
    SIGNAL m_axi_awsize                   :   STD_LOGIC_VECTOR(3-1 DOWNTO 0);
    SIGNAL m_axi_awburst                  :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL m_axi_awlock                   :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL m_axi_awcache                  :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL m_axi_awprot                   :   STD_LOGIC_VECTOR(3-1 DOWNTO 0);
    SIGNAL m_axi_awqos                    :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL m_axi_awregion                 :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL m_axi_awvalid                  :   STD_LOGIC;
    SIGNAL m_axi_awready                  :   STD_LOGIC;
    SIGNAL m_axi_wid                      :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL m_axi_wdata                    :   STD_LOGIC_VECTOR(64-1 DOWNTO 0);
    SIGNAL m_axi_wstrb                    :   STD_LOGIC_VECTOR(64/8-1 DOWNTO 0);
    SIGNAL m_axi_wlast                    :   STD_LOGIC;
    SIGNAL m_axi_wvalid                   :   STD_LOGIC;
    SIGNAL m_axi_wready                   :   STD_LOGIC;
    SIGNAL m_axi_bid                      :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL m_axi_bresp                    :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL m_axi_bvalid                   :   STD_LOGIC;
    SIGNAL m_axi_bready                   :   STD_LOGIC;
    SIGNAL s_axi_awid                     :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL s_axi_awaddr                   :   STD_LOGIC_VECTOR(32-1 DOWNTO 0);
    SIGNAL s_axi_awlen                    :   STD_LOGIC_VECTOR(8-1 DOWNTO 0);
    SIGNAL s_axi_awsize                   :   STD_LOGIC_VECTOR(3-1 DOWNTO 0);
    SIGNAL s_axi_awburst                  :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL s_axi_awlock                   :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL s_axi_awcache                  :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL s_axi_awprot                   :   STD_LOGIC_VECTOR(3-1 DOWNTO 0);
    SIGNAL s_axi_awqos                    :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL s_axi_awregion                 :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL s_axi_awvalid                  :   STD_LOGIC;
    SIGNAL s_axi_awready                  :   STD_LOGIC;
    SIGNAL s_axi_wid                      :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL s_axi_wdata                    :   STD_LOGIC_VECTOR(64-1 DOWNTO 0);
    SIGNAL s_axi_wstrb                    :   STD_LOGIC_VECTOR(64/8-1 DOWNTO 0);
    SIGNAL s_axi_wlast                    :   STD_LOGIC;
    SIGNAL s_axi_wvalid                   :   STD_LOGIC;
    SIGNAL s_axi_wready                   :   STD_LOGIC;
    SIGNAL s_axi_bid                      :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL s_axi_bresp                    :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL s_axi_bvalid                   :   STD_LOGIC;
    SIGNAL s_axi_bready                   :   STD_LOGIC;
    SIGNAL m_axi_arid                     :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL m_axi_araddr                   :   STD_LOGIC_VECTOR(32-1 DOWNTO 0);
    SIGNAL m_axi_arlen                    :   STD_LOGIC_VECTOR(8-1 DOWNTO 0);
    SIGNAL m_axi_arsize                   :   STD_LOGIC_VECTOR(3-1 DOWNTO 0);
    SIGNAL m_axi_arburst                  :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL m_axi_arlock                   :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL m_axi_arcache                  :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL m_axi_arprot                   :   STD_LOGIC_VECTOR(3-1 DOWNTO 0);
    SIGNAL m_axi_arqos                    :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL m_axi_arregion                 :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL m_axi_arvalid                  :   STD_LOGIC;
    SIGNAL m_axi_arready                  :   STD_LOGIC;
    SIGNAL m_axi_rid                      :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL m_axi_rdata                    :   STD_LOGIC_VECTOR(64-1 DOWNTO 0);
    SIGNAL m_axi_rresp                    :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL m_axi_rlast                    :   STD_LOGIC;
    SIGNAL m_axi_rvalid                   :   STD_LOGIC;
    SIGNAL m_axi_rready                   :   STD_LOGIC;
    SIGNAL s_axi_arid                     :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL s_axi_araddr                   :   STD_LOGIC_VECTOR(32-1 DOWNTO 0);
    SIGNAL s_axi_arlen                    :   STD_LOGIC_VECTOR(8-1 DOWNTO 0);
    SIGNAL s_axi_arsize                   :   STD_LOGIC_VECTOR(3-1 DOWNTO 0);
    SIGNAL s_axi_arburst                  :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL s_axi_arlock                   :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL s_axi_arcache                  :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL s_axi_arprot                   :   STD_LOGIC_VECTOR(3-1 DOWNTO 0);
    SIGNAL s_axi_arqos                    :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL s_axi_arregion                 :   STD_LOGIC_VECTOR(4-1 DOWNTO 0);
    SIGNAL s_axi_arvalid                  :   STD_LOGIC;
    SIGNAL s_axi_arready                  :   STD_LOGIC;
    SIGNAL s_axi_rid                      :   STD_LOGIC_VECTOR(1-1 DOWNTO 0);
    SIGNAL s_axi_rdata                    :   STD_LOGIC_VECTOR(64-1 DOWNTO 0);
    SIGNAL s_axi_rresp                    :   STD_LOGIC_VECTOR(2-1 DOWNTO 0);
    SIGNAL s_axi_rlast                    :   STD_LOGIC;
    SIGNAL s_axi_rvalid                   :   STD_LOGIC;
    SIGNAL s_axi_rready                   :   STD_LOGIC;
    SIGNAL axi_aw_prog_full               :   STD_LOGIC;
    SIGNAL axi_aw_prog_empty              :   STD_LOGIC;
    SIGNAL axi_w_prog_full                :   STD_LOGIC;
    SIGNAL axi_w_prog_empty               :   STD_LOGIC;
    SIGNAL axi_b_prog_full                :   STD_LOGIC;
    SIGNAL axi_b_prog_empty               :   STD_LOGIC;
    SIGNAL axi_ar_prog_full               :   STD_LOGIC;
    SIGNAL axi_ar_prog_empty              :   STD_LOGIC;
    SIGNAL axi_r_prog_full                :   STD_LOGIC;
    SIGNAL axi_r_prog_empty               :   STD_LOGIC;
    SIGNAL s_aclk_i		          :   STD_LOGIC;
   -- TB Signals
    SIGNAL rst_int_rd                     :   STD_LOGIC := '0';
    SIGNAL rst_int_wr                     :   STD_LOGIC := '0';
    SIGNAL rst_gen_rd                     :   STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
    SIGNAL rst_s_wr3                      :   STD_LOGIC := '0';
    SIGNAL rst_s_rd                       :   STD_LOGIC := '0';
    SIGNAL reset_en                       :   STD_LOGIC := '0';
    SIGNAL status_wach                    :   STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
    SIGNAL status_wdch                    :   STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
    SIGNAL status_wrch                    :   STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
    SIGNAL sim_done_wach                  :   STD_LOGIC := '0';
    SIGNAL sim_done_wdch                  :   STD_LOGIC := '0';
    SIGNAL sim_done_wrch                  :   STD_LOGIC := '0';
    SIGNAL reset_en_wach                  :   STD_LOGIC := '0';
    SIGNAL reset_en_wdch                  :   STD_LOGIC := '0';
    SIGNAL reset_en_wrch                  :   STD_LOGIC := '0';
    SIGNAL wr_en_wach                     :   STD_LOGIC := '0';
    SIGNAL rd_en_wach                     :   STD_LOGIC := '0';
    SIGNAL full_wach                      :   STD_LOGIC := '0';
    SIGNAL empty_wach                     :   STD_LOGIC := '0';
    SIGNAL wr_en_wdch                     :   STD_LOGIC := '0';
    SIGNAL rd_en_wdch                     :   STD_LOGIC := '0';
    SIGNAL full_wdch                      :   STD_LOGIC := '0';
    SIGNAL empty_wdch                     :   STD_LOGIC := '0';
    SIGNAL wr_en_wrch                     :   STD_LOGIC := '0';
    SIGNAL rd_en_wrch                     :   STD_LOGIC := '0';
    SIGNAL full_wrch                      :   STD_LOGIC := '0';
    SIGNAL empty_wrch                     :   STD_LOGIC := '0';
    SIGNAL prc_we_wach                    :   STD_LOGIC := '0';
    SIGNAL prc_we_wdch                    :   STD_LOGIC := '0';
    SIGNAL prc_we_wrch                    :   STD_LOGIC := '0';
    SIGNAL prc_re_wach                    :   STD_LOGIC := '0';
    SIGNAL prc_re_wdch                    :   STD_LOGIC := '0';
    SIGNAL prc_re_wrch                    :   STD_LOGIC := '0';
    SIGNAL dout_chk_wach                  :   STD_LOGIC := '0';
    SIGNAL dout_chk_wdch                  :   STD_LOGIC := '0';
    SIGNAL dout_chk_wrch                  :   STD_LOGIC := '0';
    SIGNAL status_rach                    :   STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
    SIGNAL status_rdch                    :   STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
    SIGNAL sim_done_rach                  :   STD_LOGIC := '0';
    SIGNAL sim_done_rdch                  :   STD_LOGIC := '0';
    SIGNAL reset_en_rach                  :   STD_LOGIC := '0';
    SIGNAL reset_en_rdch                  :   STD_LOGIC := '0';
    SIGNAL wr_en_rach                     :   STD_LOGIC := '0';
    SIGNAL rd_en_rach                     :   STD_LOGIC := '0';
    SIGNAL full_rach                      :   STD_LOGIC := '0';
    SIGNAL empty_rach                     :   STD_LOGIC := '0';
    SIGNAL wr_en_rdch                     :   STD_LOGIC := '0';
    SIGNAL rd_en_rdch                     :   STD_LOGIC := '0';
    SIGNAL full_rdch                      :   STD_LOGIC := '0';
    SIGNAL empty_rdch                     :   STD_LOGIC := '0';

    SIGNAL prc_we_rach                    :   STD_LOGIC := '0';
    SIGNAL prc_we_rdch                    :   STD_LOGIC := '0';
    SIGNAL prc_re_rach                    :   STD_LOGIC := '0';
    SIGNAL prc_re_rdch                    :   STD_LOGIC := '0';
    SIGNAL dout_chk_rach                  :   STD_LOGIC := '0';
    SIGNAL dout_chk_rdch                  :   STD_LOGIC := '0';
    SIGNAL rst_async_rd1                  :   STD_LOGIC := '0'; 
    SIGNAL rst_async_rd2                  :   STD_LOGIC := '0'; 
    SIGNAL rst_async_rd3                  :   STD_LOGIC := '0'; 

    SIGNAL din_wach                       :   STD_LOGIC_VECTOR(63-1 DOWNTO 0);
    SIGNAL din_wdch                       :   STD_LOGIC_VECTOR(74-1 DOWNTO 0);
    SIGNAL din_wrch                       :   STD_LOGIC_VECTOR(6-1 DOWNTO 0);
    SIGNAL dout_wach                      :   STD_LOGIC_VECTOR(63-1 DOWNTO 0);
    SIGNAL dout_wdch                      :   STD_LOGIC_VECTOR(74-1 DOWNTO 0);
    SIGNAL dout_wrch                      :   STD_LOGIC_VECTOR(6-1 DOWNTO 0);
    SIGNAL din_rach                       :   STD_LOGIC_VECTOR(63-1 DOWNTO 0);
    SIGNAL din_rdch                       :   STD_LOGIC_VECTOR(68-1 DOWNTO 0);
    SIGNAL dout_rach                      :   STD_LOGIC_VECTOR(63-1 DOWNTO 0);
    SIGNAL dout_rdch                      :   STD_LOGIC_VECTOR(68-1 DOWNTO 0);

 BEGIN  

   ---- Reset generation logic -----
   rst_int_wr          <= rst_async_rd3 OR rst_s_rd;
   rst_int_rd          <= rst_async_rd3 OR rst_s_rd;

   --Testbench reset synchronization
   PROCESS(s_aclk_i,RESET)
   BEGIN
     IF(RESET = '1') THEN
       rst_async_rd1    <= '1';
       rst_async_rd2    <= '1';
       rst_async_rd3    <= '1';
     ELSIF(s_aclk_i'event AND s_aclk_i='1') THEN
       rst_async_rd1    <= RESET;
       rst_async_rd2    <= rst_async_rd1;
       rst_async_rd3    <= rst_async_rd2;
     END IF;
   END PROCESS;

   --Soft reset for core and testbench
   PROCESS(s_aclk_i)
   BEGIN 
     IF(s_aclk_i'event AND s_aclk_i='1') THEN
       rst_gen_rd      <= rst_gen_rd + "1";
       IF(reset_en = '1' AND AND_REDUCE(rst_gen_rd) = '1') THEN
         rst_s_rd      <= '1';
         assert false
         report "Reset applied..Memory Collision checks are not valid"
         severity note;
       ELSE
         IF(AND_REDUCE(rst_gen_rd)  = '1' AND rst_s_rd = '1') THEN
           rst_s_rd    <= '0';
           assert false
           report "Reset removed..Memory Collision checks are valid"
           severity note;
         END IF;
       END IF;
     END IF;
   END PROCESS;
   ------------------
   
   ---- Clock buffers for testbench ----
  s_aclk_i <= S_ACLK;
   ------------------
    
    s_aresetn 	              <= NOT (RESET OR rst_s_rd) AFTER 12 ns;

    STATUS                    <= status_wach OR status_wdch OR status_wrch OR status_rach OR status_rdch;
    SIM_DONE                  <= sim_done_wach AND sim_done_wdch AND sim_done_wrch AND sim_done_rach AND sim_done_rdch;
    reset_en                  <= reset_en_wach AND reset_en_wdch AND reset_en_wrch AND reset_en_rach AND reset_en_rdch;



    s_axi_awvalid             <= wr_en_wach;
    m_axi_awready             <= rd_en_wach;
    full_wach	              <= NOT s_axi_awready;
    empty_wach                <= NOT m_axi_awvalid;
    
    s_axi_wvalid              <= wr_en_wdch;
    m_axi_wready              <= rd_en_wdch;
    full_wdch	              <= NOT s_axi_wready;
    empty_wdch                <= NOT m_axi_wvalid;
    
    m_axi_bvalid              <= wr_en_wrch;
    s_axi_bready              <= rd_en_wrch;
    full_wrch	              <= NOT m_axi_bready;
    empty_wrch                <= NOT s_axi_bvalid;


     --- WACH
     fg_dg_wach: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dgen
      GENERIC MAP (  
          	C_DIN_WIDTH      => 63,
		C_DOUT_WIDTH     => 63,
		TB_SEED          => TB_SEED, 
 		C_CH_TYPE        => 2
               )
      PORT MAP (  
                RESET            => rst_int_wr,
                WR_CLK           => s_aclk_i,
		PRC_WR_EN        => prc_we_wach,
                FULL             => full_wach,
                WR_EN            => wr_en_wach,
                WR_DATA          => din_wach
	       );

    fg_dv_wach: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dverif
     GENERIC MAP (  
	      C_DOUT_WIDTH        => 63,
	      C_DIN_WIDTH         => 63,
	      C_USE_EMBEDDED_REG  => 0,
	      TB_SEED             => TB_SEED, 
 	      C_CH_TYPE           => 2 
	      )
     PORT MAP(
              RESET               => rst_int_rd,
              RD_CLK              => s_aclk_i,
	      PRC_RD_EN           => prc_re_wach,
              RD_EN               => rd_en_wach,
	      EMPTY               => empty_wach,
	      DATA_OUT            => dout_wach,
	      DOUT_CHK            => dout_chk_wach
	     );

    fg_pc_wach: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_pctrl
    GENERIC MAP (  
              AXI_CHANNEL         => "WACH",
              C_APPLICATION_TYPE  => 0,
	      C_DOUT_WIDTH        => 63,
	      C_DIN_WIDTH         => 63,
	      C_WR_PNTR_WIDTH     => 5,
    	      C_RD_PNTR_WIDTH     => 5,
              FREEZEON_ERROR      => FREEZEON_ERROR,
              TB_STOP_CNT         => TB_STOP_CNT,
	      TB_SEED             => TB_SEED, 
 	      C_CH_TYPE           => 2
	      )
     PORT MAP(
              RESET_WR            => rst_int_wr,
              RESET_RD            => rst_int_rd,
	      RESET_EN            => reset_en_wach,
              WR_CLK              => s_aclk_i,
              RD_CLK              => s_aclk_i,
              PRC_WR_EN           => prc_we_wach,
              PRC_RD_EN           => prc_re_wach,
	      FULL                => full_wach,
	      EMPTY               => empty_wach,
              ALMOST_FULL         =>  '0',
              ALMOST_EMPTY        =>  '0',
	      DATA_IN             => din_wach,
	      DATA_OUT            => dout_wach,
	      DOUT_CHK            => dout_chk_wach,
	      SIM_DONE            => sim_done_wach,
	      STATUS              => status_wach
	    );
     
     --- WDCH
     fg_dg_wdch: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dgen
      GENERIC MAP (  
          	C_DIN_WIDTH      => 74,
		C_DOUT_WIDTH     => 74,
		TB_SEED          => TB_SEED, 
 		C_CH_TYPE        => 0
                )
      PORT MAP (  
                RESET            => rst_int_wr,
                WR_CLK           => s_aclk_i,
		PRC_WR_EN        => prc_we_wdch,
                FULL             => full_wdch,
                WR_EN            => wr_en_wdch,
                WR_DATA          => din_wdch
	       );

    fg_dv_wdch: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dverif
     GENERIC MAP (  
	       C_DOUT_WIDTH       => 74,
	       C_DIN_WIDTH        => 74,
	       C_USE_EMBEDDED_REG => 0,
	       TB_SEED            => TB_SEED, 
 	       C_CH_TYPE          => 0	 
	      )
     PORT MAP (
              RESET               => rst_int_rd,
              RD_CLK              => s_aclk_i,
	      PRC_RD_EN           => prc_re_wdch,
              RD_EN               => rd_en_wdch,
	      EMPTY               => empty_wdch,
	      DATA_OUT            => dout_wdch,
	      DOUT_CHK            => dout_chk_wdch
	    );

    fg_pc_wdch: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_pctrl
    GENERIC MAP (  
              AXI_CHANNEL         => "WDCH",
              C_APPLICATION_TYPE  => 0,
	      C_DOUT_WIDTH        => 74,
	      C_DIN_WIDTH         => 74,
	      C_WR_PNTR_WIDTH     => 9,
    	      C_RD_PNTR_WIDTH     => 9,
              FREEZEON_ERROR      => FREEZEON_ERROR,
              TB_STOP_CNT         => TB_STOP_CNT,
	      TB_SEED             => TB_SEED, 
 	      C_CH_TYPE           => 0
	      )
     PORT MAP (
              RESET_WR            => rst_int_wr,
              RESET_RD            => rst_int_rd,
	      RESET_EN            => reset_en_wdch,
              WR_CLK              => s_aclk_i,
              RD_CLK              => s_aclk_i,
              PRC_WR_EN           => prc_we_wdch,
              PRC_RD_EN           => prc_re_wdch,
	      FULL                => full_wdch,
	      EMPTY               => empty_wdch,
              ALMOST_FULL         => '0',
              ALMOST_EMPTY        => '0',
	      DATA_IN             => din_wdch,
	      DATA_OUT            => dout_wdch,
	      DOUT_CHK            => dout_chk_wdch,
	      SIM_DONE            => sim_done_wdch,
	      STATUS              => status_wdch
	     );
     --- WRCH
     fg_dg_wrch: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dgen
      GENERIC MAP (  
          	C_DIN_WIDTH      => 6,
		C_DOUT_WIDTH     => 6,
		TB_SEED          => TB_SEED, 
 		C_CH_TYPE        => 2 
               )
      PORT MAP (  
                RESET            => rst_int_rd,
                WR_CLK           => s_aclk_i,
		PRC_WR_EN        => prc_we_wrch,
                FULL             => full_wrch,
                WR_EN            => wr_en_wrch,
                WR_DATA          => din_wrch
	       );

    fg_dv_wrch: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dverif
     GENERIC MAP (  
	      C_DOUT_WIDTH       => 6,
	      C_DIN_WIDTH        => 6,
	      C_USE_EMBEDDED_REG => 0,
	      TB_SEED            => TB_SEED, 
 	      C_CH_TYPE          => 2	 
	      )
     PORT MAP (
              RESET              => rst_int_wr,
              RD_CLK             => s_aclk_i,
	      PRC_RD_EN          => prc_re_wrch,
              RD_EN              => rd_en_wrch,
	      EMPTY              => empty_wrch,
	      DATA_OUT           => dout_wrch,
	      DOUT_CHK           => dout_chk_wrch
	    );

    fg_pc_wrch: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_pctrl
    GENERIC MAP (  
              AXI_CHANNEL         => "WRCH",
              C_APPLICATION_TYPE  => 0,
	      C_DOUT_WIDTH        => 6,
	      C_DIN_WIDTH         => 6,
	      C_WR_PNTR_WIDTH     => 4,
    	      C_RD_PNTR_WIDTH     => 4,
              FREEZEON_ERROR      => FREEZEON_ERROR,
              TB_STOP_CNT         => TB_STOP_CNT,
	      TB_SEED             => TB_SEED, 
 	      C_CH_TYPE           => 2
	      )
     PORT MAP (
              RESET_WR            => rst_int_rd,
              RESET_RD            => rst_int_wr,
	      RESET_EN            => reset_en_wrch,
              WR_CLK              => s_aclk_i,
              RD_CLK              => s_aclk_i,
              PRC_WR_EN           => prc_we_wrch,
              PRC_RD_EN           => prc_re_wrch,
	      FULL                => full_wrch,
	      EMPTY               => empty_wrch,
              ALMOST_FULL         =>  '0',
              ALMOST_EMPTY        =>  '0',
	      DATA_IN             => din_wrch,
	      DATA_OUT            => dout_wrch,
	      DOUT_CHK            => dout_chk_wrch,
	      SIM_DONE            => sim_done_wrch,
	      STATUS              => status_wrch
	      );
        dout_wach <= m_axi_awid & m_axi_awaddr & m_axi_awlen & m_axi_awsize & m_axi_awburst & m_axi_awlock
        	    & m_axi_awcache & m_axi_awprot & m_axi_awqos & m_axi_awregion;
    s_axi_awid     <= din_wach(63-1 DOWNTO AWID_OFFSET);    
    s_axi_awaddr   <= din_wach(AWID_OFFSET-1 DOWNTO AWADDR_OFFSET);    
    s_axi_awlen    <= din_wach(AWADDR_OFFSET-1 DOWNTO AWLEN_OFFSET);    
    s_axi_awsize   <= din_wach(AWLEN_OFFSET-1 DOWNTO AWSIZE_OFFSET);    
    s_axi_awburst  <= din_wach(AWSIZE_OFFSET-1 DOWNTO AWBURST_OFFSET);    
    s_axi_awlock   <= din_wach(AWBURST_OFFSET-1 DOWNTO AWLOCK_OFFSET);    
    s_axi_awcache  <= din_wach(AWLOCK_OFFSET-1 DOWNTO AWCACHE_OFFSET);    
    s_axi_awprot   <= din_wach(AWCACHE_OFFSET-1 DOWNTO AWPROT_OFFSET);    
    s_axi_awqos    <= din_wach(AWPROT_OFFSET-1 DOWNTO AWQOS_OFFSET);    
    s_axi_awregion <= din_wach(AWQOS_OFFSET-1 DOWNTO AWREGION_OFFSET);
    dout_wdch      <= m_axi_wid & m_axi_wdata & m_axi_wstrb & m_axi_wlast;
    s_axi_wid      <= din_wdch(74-1 DOWNTO WID_OFFSET);
    s_axi_wdata    <= din_wdch(WID_OFFSET-1 DOWNTO WDATA_OFFSET);
    s_axi_wstrb    <= din_wdch(WDATA_OFFSET-1 DOWNTO WSTRB_OFFSET);
    s_axi_wlast    <= din_wdch(0);
    dout_wrch      <= s_axi_bid & s_axi_bresp;
    m_axi_bid      <= din_wrch(6-1 DOWNTO BID_OFFSET); 
    m_axi_bresp    <= din_wrch(BID_OFFSET-1 DOWNTO BRESP_OFFSET); 

    s_axi_arvalid   <= wr_en_rach;
    m_axi_arready   <= rd_en_rach;
    full_rach	    <= NOT s_axi_arready;
    empty_rach      <= NOT m_axi_arvalid;
    
    m_axi_rvalid    <= wr_en_rdch;
    s_axi_rready    <= rd_en_rdch;
    full_rdch	    <= NOT m_axi_rready;
    empty_rdch      <= NOT s_axi_rvalid;



    --- RACH
    fg_dg_rach: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dgen
      GENERIC MAP (  
          	 C_DIN_WIDTH      => 63,
		 C_DOUT_WIDTH     => 63,
		 TB_SEED          => TB_SEED, 
 		 C_CH_TYPE        => 2 
                  )
      PORT MAP (  
                RESET            => rst_int_wr,
                WR_CLK           => s_aclk_i,
		PRC_WR_EN        => prc_we_rach,
                FULL             => full_rach,
                WR_EN            => wr_en_rach,
                WR_DATA          => din_rach
	       );

    fg_dv_rach: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dverif
     GENERIC MAP (  
	      C_DOUT_WIDTH        => 63,
	      C_DIN_WIDTH         => 63,
	      C_USE_EMBEDDED_REG  => 0,
	      TB_SEED             => TB_SEED, 
 	      C_CH_TYPE           => 2	 
	      )
     PORT MAP (
              RESET               => rst_int_rd,
              RD_CLK              => s_aclk_i,
	      PRC_RD_EN           => prc_re_rach,
              RD_EN               => rd_en_rach,
	      EMPTY               => empty_rach,
	      DATA_OUT            => dout_rach,
	      DOUT_CHK            => dout_chk_rach
	      );

    fg_pc_rach: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_pctrl
    GENERIC MAP (  
              AXI_CHANNEL         => "RACH",
              C_APPLICATION_TYPE  => 0,
	      C_DOUT_WIDTH        => 63,
	      C_DIN_WIDTH         => 63,
	      C_WR_PNTR_WIDTH     => 5,
    	      C_RD_PNTR_WIDTH     => 5,
              FREEZEON_ERROR      => FREEZEON_ERROR,
              TB_STOP_CNT         => TB_STOP_CNT,
	      TB_SEED             => TB_SEED, 
 	      C_CH_TYPE           => 2
	      )
     PORT MAP (
              RESET_WR            => rst_int_wr,
              RESET_RD            => rst_int_rd,
	      RESET_EN            => reset_en_rach,
              WR_CLK              => s_aclk_i,
              RD_CLK              => s_aclk_i,
              PRC_WR_EN           => prc_we_rach,
              PRC_RD_EN           => prc_re_rach,
	      FULL                => full_rach,
	      EMPTY               => empty_rach,
              ALMOST_FULL         =>  '0',
              ALMOST_EMPTY        =>  '0',
	      DATA_IN             => din_rach,
	      DATA_OUT            => dout_rach,
	      DOUT_CHK            => dout_chk_rach,
	      SIM_DONE            => sim_done_rach,
	      STATUS              => status_rach
	      );   

    --- RDCH
    fg_dg_rdch: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dgen
      GENERIC MAP (  
          	 C_DIN_WIDTH      => 68,
		 C_DOUT_WIDTH     => 68,
		 TB_SEED          => TB_SEED, 
 		 C_CH_TYPE        => 0 
               )
      PORT MAP (  
                RESET             => rst_int_rd,
                WR_CLK            => s_aclk_i,
		PRC_WR_EN         => prc_we_rdch,
                FULL              => full_rdch,
                WR_EN             => wr_en_rdch,
                WR_DATA           => din_rdch
	       );

    fg_dv_rdch: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_dverif
     GENERIC MAP (  
	      C_DOUT_WIDTH        => 68,
	      C_DIN_WIDTH         => 68,
	      C_USE_EMBEDDED_REG  => 0,
	      TB_SEED             => TB_SEED, 
 	      C_CH_TYPE           => 0	 
	      )
     PORT MAP (
              RESET               => rst_int_wr,
              RD_CLK              => s_aclk_i,
	      PRC_RD_EN           => prc_re_rdch,
              RD_EN               => rd_en_rdch,
	      EMPTY               => empty_rdch,
	      DATA_OUT            => dout_rdch,
	      DOUT_CHK            => dout_chk_rdch
	      );

    fg_pc_rdch: cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_pctrl
    GENERIC MAP (  
              AXI_CHANNEL         => "RDCH",
              C_APPLICATION_TYPE  => 0,
	      C_DOUT_WIDTH        => 68,
	      C_DIN_WIDTH         => 68,
	      C_WR_PNTR_WIDTH     => 9,
    	      C_RD_PNTR_WIDTH     => 9,
              FREEZEON_ERROR      => FREEZEON_ERROR,
              TB_STOP_CNT         => TB_STOP_CNT,
	      TB_SEED             => TB_SEED, 
 	      C_CH_TYPE           => 0
	      )
     PORT MAP (
              RESET_WR            => rst_int_rd,
              RESET_RD            => rst_int_wr,
	      RESET_EN            => reset_en_rdch,
              WR_CLK              => s_aclk_i,
              RD_CLK              => s_aclk_i,
              PRC_WR_EN           => prc_we_rdch,
              PRC_RD_EN           => prc_re_rdch,
	      FULL                => full_rdch,
	      EMPTY               => empty_rdch,
              ALMOST_FULL         =>  '0',
              ALMOST_EMPTY        =>  '0',
	      DATA_IN             => din_rdch,
	      DATA_OUT            => dout_rdch,
	      DOUT_CHK            => dout_chk_rdch,
	      SIM_DONE            => sim_done_rdch,
	      STATUS              => status_rdch
	     ); 
       dout_rach       <= m_axi_arid & m_axi_araddr & m_axi_arlen & m_axi_arsize & m_axi_arburst & m_axi_arlock & m_axi_arcache & m_axi_arprot
        	          & m_axi_arqos & m_axi_arregion;
       s_axi_arid      <= din_rach(63-1 DOWNTO ARID_OFFSET);    
       s_axi_araddr    <= din_rach(ARID_OFFSET-1 DOWNTO ARADDR_OFFSET);    
       s_axi_arlen     <= din_rach(ARADDR_OFFSET-1 DOWNTO ARLEN_OFFSET);    
       s_axi_arsize    <= din_rach(ARLEN_OFFSET-1 DOWNTO ARSIZE_OFFSET);    
       s_axi_arburst   <= din_rach(ARSIZE_OFFSET-1 DOWNTO ARBURST_OFFSET);    
       s_axi_arlock    <= din_rach(ARBURST_OFFSET-1 DOWNTO ARLOCK_OFFSET);    
       s_axi_arcache   <= din_rach(ARLOCK_OFFSET-1 DOWNTO ARCACHE_OFFSET);    
       s_axi_arprot    <= din_rach(ARCACHE_OFFSET-1 DOWNTO ARPROT_OFFSET);    
       s_axi_arqos     <= din_rach(ARPROT_OFFSET-1 DOWNTO ARQOS_OFFSET);    
       s_axi_arregion  <= din_rach(ARQOS_OFFSET-1 DOWNTO ARREGION_OFFSET);    
   
         dout_rdch     <= s_axi_rid & s_axi_rdata & s_axi_rresp & s_axi_rlast;
       m_axi_rid       <= din_rdch(68-1 DOWNTO RID_OFFSET);    
       m_axi_rdata     <= din_rdch(RID_OFFSET-1 DOWNTO RDATA_OFFSET);
       m_axi_rresp     <= din_rdch(RDATA_OFFSET-1 DOWNTO RRESP_OFFSET);
       m_axi_rlast     <= din_rdch(0);

  cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_inst : cpu0_axi_hp0_wrapper_fifo_generator_v9_1_3_exdes 
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

END ARCHITECTURE;
