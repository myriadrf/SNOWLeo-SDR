/******************************************************************************
*
* (c) Copyright 2013 Xilinx, Inc. All rights reserved.
*
* This file contains confidential and proprietary information of Xilinx, Inc.
* and is protected under U.S. and international copyright and other
* intellectual property laws.
*
* DISCLAIMER
* This disclaimer is not a license and does not grant any rights to the
* materials distributed herewith. Except as otherwise provided in a valid
* license issued to you by Xilinx, and to the maximum extent permitted by
* applicable law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL
* FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS,
* IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF
* MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE;
* and (2) Xilinx shall not be liable (whether in contract or tort, including
* negligence, or under any other theory of liability) for any loss or damage
* of any kind or nature related to, arising under or in connection with these
* materials, including for any direct, or any indirect, special, incidental,
* or consequential loss or damage (including loss of data, profits, goodwill,
* or any type of loss or damage suffered as a result of any action brought by
* a third party) even if such damage or loss was reasonably foreseeable or
* Xilinx had been advised of the possibility of the same.
*
* CRITICAL APPLICATIONS
* Xilinx products are not designed or intended to be fail-safe, or for use in
* any application requiring fail-safe performance, such as life-support or
* safety devices or systems, Class III medical devices, nuclear facilities,
* applications related to the deployment of airbags, or any other applications
* that could lead to death, personal injury, or severe property or
* environmental damage (individually and collectively, "Critical
* Applications"). Customer assumes the sole risk and liability of any use of
* Xilinx products in Critical Applications, subject only to applicable laws
* and regulations governing limitations on product liability.
*
* THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE
* AT ALL TIMES.
*
******************************************************************************/
/*****************************************************************************/
/**
*
* @file xspips_hw.c
*
* Contains the reset and post boot rom state initialization.
* Function prototypes in xspips_hw.h
*
* <pre>
* MODIFICATION HISTORY:
*
* Ver   Who    Date     Changes
* ----- ------ -------- -----------------------------------------------
* 1.06a hk     08/22/13 First release.
*
* </pre>
*
******************************************************************************/

/***************************** Include Files *********************************/

#include "xspips_hw.h"

/************************** Constant Definitions *****************************/


/**************************** Type Definitions *******************************/


/***************** Macros (Inline Functions) Definitions *********************/


/************************** Variable Definitions *****************************/


/*****************************************************************************/
/**
*
* Resets the spi module
*
* @param	None
*
* @return	None
*
* @note		None.
*
******************************************************************************/
void XSpiPs_ResetHw(u32 BaseAddress)
{

	/*
	 * Disable Interrupts
	 */
	XSpiPs_WriteReg(BaseAddress, XSPIPS_IDR_OFFSET,
			XSPIPS_IXR_DISABLE_ALL_MASK);

	/*
	 * Disable device
	 */
	XSpiPs_WriteReg(BaseAddress, XSPIPS_ER_OFFSET,
				0);
	/*
	 * Write default value to RX and TX threshold registers
	 * RX threshold should be set to 1 here as the corresponding
	 * status bit is used to clear the FIFO next
	 */
	XSpiPs_WriteReg(BaseAddress, XSPIPS_TXWR_OFFSET,
			(XSPIPS_TXWR_RESET_VALUE & XSPIPS_TXWR_MASK));
	XSpiPs_WriteReg(BaseAddress, XSPIPS_RXWR_OFFSET,
			(XSPIPS_RXWR_RESET_VALUE & XSPIPS_RXWR_MASK));

	/*
	 * Clear RXFIFO
	 */
	while ((XSpiPs_ReadReg(BaseAddress,XSPIPS_SR_OFFSET) &
		XSPIPS_IXR_RXNEMPTY_MASK) != 0) {
		XSpiPs_ReadReg(BaseAddress, XSPIPS_RXD_OFFSET);
	}

	/*
	 * Clear status register by writing 1 to the write to clear bits
	 */
	XSpiPs_WriteReg(BaseAddress, XSPIPS_SR_OFFSET,
				XSPIPS_IXR_WR_TO_CLR_MASK);

	/*
	 * Write default value to configuration register
	 * De-select all slaves
	 */
	XSpiPs_WriteReg(BaseAddress, XSPIPS_CR_OFFSET,
				XSPIPS_CR_RESET_STATE |
				XSPIPS_CR_SSCTRL_MASK);

}

