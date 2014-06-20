/**
 * $Id: snowleo_hw.c 2014-5
 *
 * @brief SNOWleo SDR main Module.
 *
 * @Author jacky <gaocc@v3best.com>
 *
 * (c) V3best  http://www.zingsoc.com
 *
 * This part of code is written in C programming language.
 * Please visit http://en.wikipedia.org/wiki/C_(programming_language)
 * for more details on the language used herein.
 */
#include <stdio.h>
#include "snowleo_hw.h"

/**
 * @brief Setup AXI dma IPcore.
 *
 * @param[in] channel          0 S2MM_CHANNEL, 1 MM2S_CHANNEL
 * @param[in] length           Data length for once dma transmission
 * @param[in] cycle            Number of dma transmission 
 * @param[in] mem_addr         Physical DDR address of AXI dma IPCore
 * @param[in] reg_baseaddr     Virtual register address of AXI dma IPcore
 * @retval                     0 Success
 * @retval                     -1 Failure
 *
 */
inline int axi_dma_init(int channel, unsigned long length, unsigned int cycle,
		unsigned long mem_addr, unsigned long reg_baseaddr)
{
	if(channel == 0) {
		iowrite32(mem_addr, reg_baseaddr + S2MM_DA);
		iowrite32(length, reg_baseaddr + S2MM_LENGTH);
		iowrite32(cycle, reg_baseaddr + S2MM_CYC);
	}

	if(channel == 1) {
		iowrite32(mem_addr, reg_baseaddr + MM2S_SA);
		iowrite32(length, reg_baseaddr + MM2S_LENGTH);
		iowrite32(cycle, reg_baseaddr + MM2S_CYC);
	}

	return 0;
}


/**
 * @brief start AXI dma IPcore.
 *
 * @param[in] channel          0 S2MM_CHANNEL, 1 MM2S_CHANNEL
 * @param[in] mode             Operating Mode of MM2S_CHANNEL  0 Auto, 1 Manual
 * @param[in] reg_baseaddr     Virtual register address of AXI dma IPcore
 * @retval                     0 Success
 * @retval                     -1 Failure
 *
 */
inline int axi_dma_start(int channel, int mode, unsigned long reg_baseaddr)
{
	if(channel == 0)
		iowrite32(0x11, reg_baseaddr + S2MM_START);

	if(channel == 1) {
		if(mode == 1)
			iowrite32(0x11, reg_baseaddr + MM2S_START);
		else
			iowrite32(0x13, reg_baseaddr + MM2S_START);
	}

	return 0;
}

/**
 * @brief Detect transmission is completed.
 *
 * @param[in] channel          0 S2MM_CHANNEL, 1 MM2S_CHANNEL
 * @param[in] reg_baseaddr     Virtual register address of AXI dma IPcore
 * @retval                     0 Success
 * @retval                     -1 Failure
 *
 */
inline int check_dma_done(int channel, unsigned long reg_baseaddr)
{
	int val;

	if(channel == 0){
		do {
			val = ioread32(reg_baseaddr + S2MM_DONE);
		} while (!(val & 0x1));
	}

	if(channel == 1){
		do {
			val = ioread32(reg_baseaddr + MM2S_DONE);
		} while (!(val & 0x1));
	}

	return 0;
}

/**
 * @brief reset AXI dma IPcore.
 *
 * @param[in] channel          0 S2MM_CHANNEL, 1 MM2S_CHANNEL
 * @param[in] length           Data length for once dma transmission
 * @param[in] reg_baseaddr     Virtual register address of AXI dma IPcore
 * @param[in] type             reset type, IP_RESET only reset IPCore, FIFO_IP_RESET reset IPcore&fifo
 * @retval                     0 Success
 * @retval                     -1 Failure
 *
 */
inline int axi_dma_reset(int channel, unsigned long reg_baseaddr, int type)
{
	if(channel == 0&&type == IP_RESET)
		iowrite32(0x10, reg_baseaddr + S2MM_START);
	if(channel == 1&&type == IP_RESET)
		iowrite32(0x10, reg_baseaddr + MM2S_START);

	if(channel == 0&&type == FIFO_IP_RESET)
		iowrite32(0x00, reg_baseaddr + S2MM_START);
	if(channel == 1&&type == FIFO_IP_RESET)
		iowrite32(0x00, reg_baseaddr + MM2S_START);

	return 0;
}

/**
 * @brief Write 32bit value to Specified Virtual DDR address.
 *
 * @param[in] val            The value to be written
 * @param[in] addr           The Virtual DDR address to be written
 *
 */
inline void iowrite32(unsigned long val, unsigned long addr)
{
	*(unsigned long *)addr = val;
}

/**
 * @brief Read 32bit value from Specified Virtual DDR address.
 *
 * @param[in] addr          The Virtual DDR address to be read
 * @retval                  the value from addr
 *
 */
inline unsigned long ioread32(unsigned long addr)
{
	return *(unsigned long *)addr;
}

/**
 * @brief  map the specified physical address to the virtual address.
 *
 * @param[in] startAddress     The physical DDR address to be mapped
 * @param[in] size             memory size to be mapped
 * @retval                     The Virtual DDR address
 *
 */
unsigned char *map_memory(unsigned long startAddress, unsigned long size)
{
	int fd = open( "/dev/mem", O_RDWR);
	unsigned char *virtual_addr;

	virtual_addr = (unsigned char*)mmap(NULL, size, PROT_READ | PROT_WRITE, MAP_SHARED,
			fd, (off_t)startAddress);

	close (fd);

	return virtual_addr;
}

/**
 * @brief unmap the specified virtual address.
 *
 * @param[in] startAddress     The virtual DDR address to be unmapped
 * @param[in] size             memory size to be unmapped
 *
 */
void unmap_memory(unsigned char *virtual_addr, unsigned long size)
{
	int fd = open( "/dev/mem", O_RDWR);

	munmap((void *)virtual_addr, size);
	close (fd);
}

