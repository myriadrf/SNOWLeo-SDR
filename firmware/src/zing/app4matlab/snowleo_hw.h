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

//#define SPECTRUM_MASK     0xF
//#define LOOP_MASK         (0xF<<4)
//#define DECIMATION_MASK   (0xFF<<8)
//#define TRIGGER_MASK      (0xFFFF<<16)

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


#define SPI_DEV "/dev/spidev0.0"
#define I2C_DEV "/dev/i2c-1"

/**
 * @brief Write 32bit value to Specified Virtual DDR address.
 *
 * @param[in] val            The value to be written
 * @param[in] addr           The Virtual DDR address to be written
 *
 */
inline void iowrite32(unsigned long val, unsigned long addr);

/**
 * @brief Read 32bit value from Specified Virtual DDR address.
 *
 * @param[in] addr          The Virtual DDR address to be read
 * @retval                  the value from addr
 *
 */
inline unsigned long ioread32(unsigned long addr);

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
inline int axi_dma_start(int channel, int mode, unsigned long reg_baseaddr);

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
		unsigned long mem_addr, unsigned long reg_baseaddr);

/**
 * @brief Detect transmission is completed.
 *
 * @param[in] channel          0 S2MM_CHANNEL, 1 MM2S_CHANNEL
 * @param[in] reg_baseaddr     Virtual register address of AXI dma IPcore
 * @retval                     0 Success
 * @retval                     -1 Failure
 *
 */
inline int check_dma_done(int channel, unsigned long reg_baseaddr);

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
inline int axi_dma_reset(int channel, unsigned long reg_baseaddr, int type);

/**
 * @brief  map the specified physical address to the virtual address.
 *
 * @param[in] startAddress     The physical DDR address to be mapped
 * @param[in] size             memory size to be mapped
 * @retval                     The Virtual DDR address
 *
 */
unsigned char *map_memory(unsigned long startAddress, unsigned long size);

/**
 * @brief unmap the specified virtual address.
 *
 * @param[in] startAddress     The virtual DDR address to be unmapped
 * @param[in] size             memory size to be unmapped
 *
 */
void unmap_memory(unsigned char *virtual_addr, unsigned long size);


#define  RF_TX_CHANNEL   0
#define  RF_RX_CHANNEL   0x10

extern int snowleo_sdr_set_clock(char *i2c_dev);

/**
 * @brief  configure lms6002's Frequency.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[in]  freq               frequency to be configured
 * @param[in]  channel            RF channel
 * @retval                        void
 *
 */
extern int snowleo_sdr_set_freq(int fd, unsigned int freq, uint8_t channel);
extern int snowleo_sdr_set_tx_dc(int fd, uint8_t dci, uint8_t dcq);
void snowleo_spi_custom_write(int fd, uint8_t *data, uint8_t data_size);
void snowleo_spi_custom_read(int fd, uint8_t *reg, uint8_t *data, uint8_t data_size);
/**
 * @brief  configure lms6002's Gain.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[in]  vga                gain to be configured
 * @param[in]  channel            RF channel
 * @retval                        void
 *
 */
extern int snowleo_sdr_set_vga(int fd, unsigned int vga, uint8_t channel);

/**
 * @brief  configure snowleo's spi controller.
 *
 * @retval                        0 Success, -1 Fail
 *
 */
extern int snowleo_sdr_spi_init(const char *spi_dev);
extern void transfer(int fd);

/**
 * @brief  spi write operation function.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[in]  reg                spi slave register address to be written
 * @param[in]  value              data to be written
 * @retval                        void
 *
 */
void snowleo_spi_write(int fd, uint8_t reg, uint8_t value);

/**
 * @brief  spi read operation function.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[in]  reg                spi slave register address to be read
 * @param[out] value              read back data
 * @retval                        void
 *
 */
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
