/*****************************************************************************
* Filename:          J:\zing_pro\zing_pldma_v144\pldma.srcs\sources_1\edk\cpu0/drivers/pldma_v1_00_a/src/pldma.c
* Version:           1.00.a
* Description:       pldma Driver Source File
* Date:              Tue Dec 24 17:19:12 2013 (by Create and Import Peripheral Wizard)
*****************************************************************************/


/***************************** Include Files *******************************/

#include "pldma.h"

/************************** Function Definitions ***************************/


/**
 *
 * User logic master module to send/receive word to/from remote system memory.
 * While sending, one word is read from user logic local FIFO and written to remote system memory.
 * While receiving, one word is read from remote system memory and written to user logic local FIFO.
 *
 * @param   BaseAddress is the base address of the PLDMA device.
 * @param   Src/DstAddress is the destination system memory address from/to which the data will be fetched/stored.
 *
 * @return  None.
 *
 * @note    None.
 *
 */
void PLDMA_MasterSendBytes(Xuint32 BaseAddress, Xuint32 DstAddress, int Size)
{
  int LsbSize;
  int MsbSize;
  LsbSize = (Xuint16)Size;
  MsbSize = (Xuint8)(Size >> 16);
  /*
   * Set user logic master control register for write transfer.
   */
  Xil_Out8(BaseAddress+PLDMA_MST_CNTL_REG_OFFSET, MST_BRWR);

  /*
   * Set user logic master address register to drive IP2Bus_Mst_Addr signal.
   */
  Xil_Out32(BaseAddress+PLDMA_MST_ADDR_REG_OFFSET, DstAddress);

  /*
   * Set user logic master byte enable register to drive IP2Bus_Mst_BE signal.
   */
  Xil_Out16(BaseAddress+PLDMA_MST_BE_REG_OFFSET, 0xFFFF);

  /*
   * Set user logic master length register.
  */
  Xil_Out16(BaseAddress+PLDMA_LSB_MST_LEN_REG_OFFSET, LsbSize);

  Xil_Out8(BaseAddress+PLDMA_MSB_MST_LEN_REG_OFFSET, MsbSize);

  /*
   * Start user logic master write transfer by writting special pattern to its go port.
   */
  Xil_Out8(BaseAddress+PLDMA_MST_GO_PORT_OFFSET, MST_START);
}

void PLDMA_MasterRecvBytes(Xuint32 BaseAddress, Xuint32 SrcAddress, int Size)
{
  int LsbSize;
  int MsbSize;
  LsbSize = (Xuint16)Size;
  MsbSize = (Xuint8)(Size >> 16);
  /*
   * Set user logic master control register for read transfer.
   */
  Xil_Out8(BaseAddress+PLDMA_MST_CNTL_REG_OFFSET, MST_BRRD);

  /*
   * Set user logic master address register to drive IP2Bus_Mst_Addr signal.
   */
  Xil_Out32(BaseAddress+PLDMA_MST_ADDR_REG_OFFSET, SrcAddress);

  /*
   * Set user logic master byte enable register to drive IP2Bus_Mst_BE signal.
   */
  Xil_Out16(BaseAddress+PLDMA_MST_BE_REG_OFFSET, 0xFFFF);

  /*
   * Set user logic master length register.
  */
  Xil_Out16(BaseAddress+PLDMA_LSB_MST_LEN_REG_OFFSET, LsbSize);

  Xil_Out8(BaseAddress+PLDMA_MSB_MST_LEN_REG_OFFSET, MsbSize);

  /*
   * Start user logic master read transfer by writting special pattern to its go port.
   */
  Xil_Out8(BaseAddress+PLDMA_MST_GO_PORT_OFFSET, MST_START);
}

