/**
 * $Id: snowleo_hw.h 2014-5
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
#ifndef __HW_SET__
#define __HW_SET__
#include <stdio.h>
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <pthread.h>
#include <errno.h>

#define SPECTRUM_MASK     0xF
#define LOOP_MASK         (0xF<<4)
#define DECIMATION_MASK   (0xFF<<8)
#define TRIGGER_MASK      (0xFFFF<<16)

/*AXI DMA IPcore memory map address*/
#define AXI_DMA_BASE_WR 0x41210000
#define AXI_DMA_BASE_RD 0x41220000

/*AXI DMA IPcore register offset*/
#define MM2S_HW
#ifdef MM2S_HW
#define MM2S_START   0x0
#define MM2S_SA      0x4
#define MM2S_LENGTH  0x8
#define MM2S_CYC     0xc

#define MM2S_DONE     0x0
#endif

#define S2MM_START   0x0
#define S2MM_DA      0x4
#define S2MM_LENGTH  0x8
#define S2MM_CYC     0xc

/*AXI DMA IPcore mask*/
#define S2MM_DONE   0x0

#define S2MM_CHANNEL  0
#define MM2S_CHANNEL  1

#define IP_RESET  	 0
#define FIFO_IP_RESET	 1

/*DDR phy address for AXI DMA IPcore*/
#define ZING_MINI_SOM
#ifdef ZING_MINI_SOM
#define  S2MM_DST_ADDR 0x1CE00000
#define  MM2S_SRC_ADDR 0x1E700000
#else
#define  S2MM_DST_ADDR 0x30000000
#define  MM2S_SRC_ADDR 0x38000000
#endif
#define  S2MM_BUF_SIZE 20480000
#define  MM2S_BUF_SIZE 20480000

#define  REG_SIZE        4096



inline void iowrite32(unsigned long val, unsigned long addr);
inline unsigned long ioread32(unsigned long addr);

inline int axi_dma_start(int channel, int mode, unsigned long reg_baseaddr);
inline int axi_dma_init(int channel, unsigned long length, unsigned int cycle,
		unsigned long mem_addr, unsigned long reg_baseaddr);

inline int check_dma_done(int channel, unsigned long reg_baseaddr);

inline int axi_dma_reset(int channel, unsigned long reg_baseaddr, int type);

unsigned char *map_memory(unsigned long startAddress, unsigned long size);
void unmap_memory(unsigned char *virtual_addr, unsigned long size);


#define  RF_TX_CHANNEL   0
#define  RF_RX_CHANNEL   0x10

extern int snowleo_sdr_set_clock(char *i2c_dev);
extern int snowleo_sdr_set_freq(int fd, unsigned int freq, uint8_t channel);
extern int snowleo_sdr_set_vga(int fd, unsigned int vga, uint8_t channel);
extern int snowleo_sdr_spi_init();
extern void transfer(int fd);
void snowleo_spi_write(int fd, uint8_t reg, uint8_t value);
void snowleo_spi_read(int fd, uint8_t reg, uint8_t *value);


#define DEBUG  4
enum {
    MSG_ERROR = 0,
    MSG_WARNING,
    MSG_NOTICE,
    MSG_INFO,
    MSG_DEBUG,
};

#ifdef  DEBUG
#define dma_dbg(level,fmt,args...) if (DEBUG>=level) printf(fmt,##args);
#else
#define dma_dbg(level,fmt,args...)
#endif  /* DEBUG */

#endif/*__HW_SET__*/
