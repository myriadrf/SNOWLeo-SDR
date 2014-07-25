//----------------------------------------------------------------------------
// Filename:          user_logic.v
// Version:           1.00.a
// Description:       User logic module.
// Date:              Tue Dec 24 17:18:55 2013 (by Create and Import Peripheral Wizard)
// Verilog Standard:  Verilog-2001
//----------------------------------------------------------------------------
// Naming Conventions:
//   active low signals:                    "*_n"
//   clock signals:                         "clk", "clk_div#", "clk_#x"
//   reset signals:                         "rst", "rst_n"
//   generics:                              "C_*"
//   user defined types:                    "*_TYPE"
//   state machine next state:              "*_ns"
//   state machine current state:           "*_cs"
//   combinatorial signals:                 "*_com"
//   pipelined or register delay signals:   "*_d#"
//   counter signals:                       "*cnt*"
//   clock enable signals:                  "*_ce"
//   internal version of output port:       "*_i"
//   device pins:                           "*_pin"
//   ports:                                 "- Names begin with Uppercase"
//   processes:                             "*_PROCESS"
//   component instantiations:              "<ENTITY_>I_<#|FUNC>"
//----------------------------------------------------------------------------

`uselib lib=unisims_ver
`uselib lib=proc_common_v3_00_a

module user_logic
(
  // -- ADD USER PORTS BELOW THIS LINE ---------------
input 					m_axi_aclk,
output [139:0] 		u_debug,
input 					rd_clk,
output [31:0] 			data_rd,
input 					rd_en,
output 					aempty,
output [14:0] 			rd_fifo_cnt,
output reg 				rst=1'b0,
  // -- ADD USER PORTS ABOVE THIS LINE ---------------

  // -- DO NOT EDIT BELOW THIS LINE ------------------
  // -- Bus protocol ports, do not add to or delete
input																Bus2IP_Clk,                     // Bus to IP clock
input																Bus2IP_Resetn,                  // Bus to IP reset
input      [C_SLV_DWIDTH-1 : 0]           			Bus2IP_Data,                    // Bus to IP data bus
input      [C_SLV_DWIDTH/8-1 : 0]         			Bus2IP_BE,                      // Bus to IP byte enables
input      [C_NUM_REG-1 : 0]              			Bus2IP_RdCE,                    // Bus to IP read chip enable
input      [C_NUM_REG-1 : 0]              			Bus2IP_WrCE,                    // Bus to IP write chip enable
output reg [C_SLV_DWIDTH-1 : 0]           			IP2Bus_Data,                    // IP to Bus data bus
output reg                                			IP2Bus_RdAck,                   // IP to Bus read transfer acknowledgement
output reg                                			IP2Bus_WrAck,                   // IP to Bus write transfer acknowledgement
output                                    			IP2Bus_Error,                   // IP to Bus error response
output reg														ip2bus_mstrd_req,               // IP to Bus master read request
output reg														ip2bus_mstwr_req,               // IP to Bus master write request
output     [C_MST_AWIDTH-1 : 0]           			ip2bus_mst_addr,                // IP to Bus master read/write address
output reg [(C_MST_NATIVE_DATA_WIDTH/8)-1 : 0] 		ip2bus_mst_be,                  // IP to Bus byte enable
output reg [C_LENGTH_WIDTH-1 : 0]         			ip2bus_mst_length,              // Ip to Bus master transfer length
output reg                                			ip2bus_mst_type,                // Ip to Bus burst assertion control
output reg                                			ip2bus_mst_lock,                // Ip to Bus bus lock
output reg                                			ip2bus_mst_reset,               // Ip to Bus master reset
input                                     			bus2ip_mst_cmdack,              // Bus to Ip master command ack
input                                     			bus2ip_mst_cmplt,               // Bus to Ip master trans complete
input                                     			bus2ip_mst_error,               // Bus to Ip master error
input                                     			bus2ip_mst_rearbitrate,         // Bus to Ip master re-arbitrate for bus ownership
input                                     			bus2ip_mst_cmd_timeout,         // Bus to Ip master command time out
input      [C_MST_NATIVE_DATA_WIDTH-1 : 0] 			bus2ip_mstrd_d,                 // Bus to Ip master read data
input      [(C_MST_NATIVE_DATA_WIDTH)/8-1 : 0]	bus2ip_mstrd_rem,               // Bus to Ip master read data rem
input                                     			bus2ip_mstrd_sof_n,             // Bus to Ip master read start of frame
input                                     			bus2ip_mstrd_eof_n,             // Bus to Ip master read end of frame
input                                     			bus2ip_mstrd_src_rdy_n,         // Bus to Ip master read source ready
input                                     			bus2ip_mstrd_src_dsc_n,         // Bus to Ip master read source dsc
output reg                               				ip2bus_mstrd_dst_rdy_n,         // Ip to Bus master read dest. ready
output reg                                			ip2bus_mstrd_dst_dsc_n,         // Ip to Bus master read dest. dsc
output reg [C_MST_NATIVE_DATA_WIDTH-1 : 0]			ip2bus_mstwr_d,                 // Ip to Bus master write data
output reg [(C_MST_NATIVE_DATA_WIDTH)/8-1 : 0]	ip2bus_mstwr_rem,               // Ip to Bus master write data rem
output reg                                 			ip2bus_mstwr_src_rdy_n,         // Ip to Bus master write source ready
output reg                                 			ip2bus_mstwr_src_dsc_n,         // Ip to Bus master write source dsc
output reg                                			ip2bus_mstwr_sof_n,             // Ip to Bus master write start of frame
output reg                                			ip2bus_mstwr_eof_n,             // Ip to Bus master write end of frame
input                                     			bus2ip_mstwr_dst_rdy_n,         // Bus to Ip master write dest. ready
input                                     			bus2ip_mstwr_dst_dsc_n          // Bus to Ip master write dest. ready
  // -- DO NOT EDIT ABOVE THIS LINE ------------------
); // user_logic
// -- DO NOT EDIT BELOW THIS LINE --------------------
// -- Bus protocol parameters, do not add to or delete
parameter C_MST_NATIVE_DATA_WIDTH        = 64;
parameter C_LENGTH_WIDTH                 = 12;
parameter C_MST_AWIDTH                   = 32;
parameter C_NUM_REG                      = 4;
parameter C_SLV_DWIDTH                   = 32;
// -- DO NOT EDIT ABOVE THIS LINE --------------------


endmodule
