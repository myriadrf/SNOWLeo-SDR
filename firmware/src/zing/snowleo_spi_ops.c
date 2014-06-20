/**
 * $Id: snowleo_spi_ops.c 2014-5
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
#include <math.h>
#include <stdint.h>
#include <linux/spi/spidev.h>
#include "snowleo_hw.h"

extern unsigned char *dma_reg_addr_wr;

#define ARRAY_SIZE(a) (sizeof(a) / sizeof((a)[0]))

static void pabort(const char *s)
{
	perror(s);
}

static const char *device = "/dev/spidev0.0";
static uint8_t mode;
static uint8_t bits = 8;
static uint32_t speed = 10*1000*1000;
static uint16_t delay = 10;

/**
 * @brief  spi write operation function.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[in]  reg                spi slave register address to be written
 * @param[in]  value              data to be written
 * @retval                        void
 *
 */
void snowleo_spi_write(int fd, uint8_t reg, uint8_t value)
{
	int ret;
	uint8_t tx[] = {
			reg|(0x1<<7),value,
	};
	struct spi_ioc_transfer tr;
	memset(&tr, 0, sizeof(tr));
	tr.tx_buf = (unsigned long)tx;
	tr.len = ARRAY_SIZE(tx);


	ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
	if (ret < 1)
		pabort("can't send spi message");

}

/**
 * @brief  spi read operation function.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[in]  reg                spi slave register address to be read
 * @param[out] value              read back data
 * @retval                        void
 *
 */
void snowleo_spi_read(int fd, uint8_t reg, uint8_t *value)
{
	int ret;
	uint8_t tx[] = {
			reg,
	};
	uint8_t rx[ARRAY_SIZE(tx)] = {0, };
	struct spi_ioc_transfer tr[2];
	memset(tr, 0, sizeof(tr));
	tr[0].tx_buf = (unsigned long)tx;
	tr[0].len = ARRAY_SIZE(tx);

	tr[1].rx_buf = (unsigned long)rx;
	tr[1].len = ARRAY_SIZE(tx);

	ret = ioctl(fd, SPI_IOC_MESSAGE(2), &tr);
	if (ret < 1)
		pabort("can't send spi message");

	*value = rx[0];

}

/**
 * @brief  lms6002 initial operation function.
 *
 * @param[in]  fd                 spi file descriptor
 * @retval                        void
 *
 */
void transfer(int fd)
{
	int ret;
	uint8_t tx[] = {
			0x82,0x1f,
			0x83,0x08,
			0x85,0x3e,
			0x86,0x0d,
			0x87,0x00,
			0x88,0x00,
			0x89,0x85,
			0x8a,0x00,
			0x8b,0x08,

			0x90,0x4e,
			0x91,0xad,
			0x92,0xaa,
			0x93,0xaa,
			0x94,0x88,
			0x95,0xb1,
			0x96,0x8c,
			0x97,0xfe,
			0x98,0x40,
			0x99,0x98,

			0xa0,0x4e,
			0xa1,0xad,
			0xa2,0xaa,
			0xa3,0xaa,
			0xa4,0x88,
			0xa5,0xb1,
			0xa6,0x8c,
			0xa7,0xfe,
			0xa8,0x40,
			0xa9,0x98,

			0xb2,0x1f,
			0xb3,0x09,
			0xb4,0x02,
			0xb5,0x0c,

			0xd2,0x1f,
			0xd3,0x08,
			0xd4,0x02,
			0xd5,0x0c,
			0xd6,0x30,
			0xd7,0xd4,
			0xd8,0x00,
			0xd9,0x29,
			0xda,0xb0,
			0xdb,0x00,
			0xdc,0x00,
			0xdd,0x00,
			0xde,0x00,
			0xdf,0x1f,

			0xc0,0x02,
			0xc1,0x15,
			0xc2,0x80,
			0xc3,0x80,
			0xc4,0x0b,
			0xc5,0x00,
			0xc6,0x00,
			0xc7,0x40,
			0xc8,0x0c,
			0xc9,0x0c,
			0xca,0x18,
			0xcb,0xff,
			0xcc,0x00,
			0xcd,0x00,
			0xce,0x00,
			0xcf,0x00,

			0xe2,0x1f,
			0xe3,0x08,
			0xe4,0x1e,
			0xe5,0x01,
			0xe6,0x00,
			0xe7,0x00,
			0xe8,0x01,

			0xf0,0x01,
			0xf1,0x80,
			0xf2,0x80,
			0xf3,0x00,
			0xf4,0x00,
			0xf5,0xd0,
			0xf6,0x78,
			0xf7,0x00,
			0xf8,0x1c,
			0xf9,0x37,
			0xfa,0x77,
			0xfb,0x77,
			0xfc,0x18
	};
	uint8_t rx[ARRAY_SIZE(tx)] = {0, };
	struct spi_ioc_transfer tr = {
			.tx_buf = (unsigned long)tx,
			.rx_buf = (unsigned long)rx,
			.len = ARRAY_SIZE(tx),
			.delay_usecs = delay,
			.speed_hz = speed,
			.bits_per_word = bits,
	};

	ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr);
	if (ret < 1)
		pabort("can't send spi message");
}

/**
 * @brief  check lms6002's vco.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[out] value              read back data
 * @param[in]  channel            RF channel
 * @retval                        void
 *
 */
static void spi_check_vco(int fd, uint8_t *value, uint8_t channel)
{
	int ret;
	uint8_t tx1[] = {0x1A+channel,};
	uint8_t rx1[] = {0,};

	struct spi_ioc_transfer tr1[2];

	memset(tr1, 0, sizeof(tr1));
	tr1[0].tx_buf = (unsigned long)tx1;
	tr1[0].len = ARRAY_SIZE(tx1);
	tr1[1].rx_buf = (unsigned long)rx1;
	tr1[1].len = ARRAY_SIZE(tx1);
	ret = ioctl(fd, SPI_IOC_MESSAGE(2), tr1);
	if (ret < 1)
		pabort("can't send spi message");
	printf("rx1 = 0x%x\n", rx1[0]);
	*value = rx1[0];
}

/**
 * @brief  write lms6002's vco.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[in]  value              data to be written
 * @param[in]  channel            RF channel
 * @retval                        void
 *
 */
static void spi_write_vco(int fd, uint8_t value,uint8_t channel)
{
	int ret;
	uint8_t tx1[] = {
			(0x19+channel)|(0x1<<7), (0x2<<6)|value
	};

	struct spi_ioc_transfer tr1;

	memset(&tr1, 0, sizeof(tr1));
	tr1.tx_buf = (unsigned long)tx1;
	tr1.len = ARRAY_SIZE(tx1);

	ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr1);
	if (ret < 1)
		pabort("can't send spi message");
}

/**
 * @brief  configure lms6002's Frequency.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[in]  freq               frequency to be configured
 * @param[in]  channel            RF channel
 * @retval                        void
 *
 */
int snowleo_sdr_set_freq(int fd, unsigned int freq, uint8_t channel)
{
	int ret;
	unsigned char value;
	unsigned int value2, net_data = freq;
	unsigned int NINT,NFRAC;

	float x = net_data/1000.0;
	//printf("x = %f\n", x);

	if(x>0.2325&&x<0.285625)
		value = 0x27;//100111
	else if(x>0.285625&&x<0.336875)
		value = 0x2f;//101111
	else if(x>0.405&&x<0.465)
		value = 0x3f;//111111
	else if(x>0.465&&x<0.57125)
		value = 0x26;//100110
	else if(x>0.57125&&x<0.67375)
		value =  0x2e;//101110
	else if(x>0.67375&&x<0.81)
		value = 0x36;//110110
	else if(x>0.81&&x<0.93)
		value = 0x3e;//111110
	else if(x>0.93&&x<1.1425)
		value = 0x25;//100101
	else if(x>1.1425&&x<1.3475)
		value = 0x2d;//101101
	else if(x>1.3475&&x<1.62)
		value = 0x35;//110101
	else if(x>1.62&&x<1.86)
		value = 0x3d;//111101
	else if(x>1.86&&x<2.285)
		value =  0x24;//100100
	else if(x>2.285&&x<2.695)
		value = 0x2c;//101100
	else if(x>2.695&&x<3.24)
		value = 0x34;//110100
	else if(x>3.24&&x<3.72)
		value = 0x3c;//111100
	else
		value = 0;

	value2 = 2<<((value&0x07)-4);
	//printf("value = 0x%x,value2 = %d,(value&0x07)-3 = %d\n",value, value2,(value&0x07)-3);

	NINT= value2*net_data/30.72;
	NFRAC = (2<<22)*(value2*net_data/30.72-NINT);

	printf("NINT = %d; NFRAC = %d\n", NINT,NFRAC);

	uint8_t rf_en = 0;
	snowleo_spi_read(fd, 0x05, &rf_en);

	if(channel == RF_TX_CHANNEL)
		rf_en = rf_en | 0x08;
	else
		rf_en = rf_en | 0x04;

	uint8_t tx[] = {
			0x05|(0x1<<7), rf_en,
			0x09|(0x1<<7), 0x85,  //
			(0x10+channel)|(0x1<<7), (uint8_t)(NINT>>1),
			(0x11+channel)|(0x1<<7), (((uint8_t)NINT&0x01)<<7)|((uint8_t)(NFRAC>>16)&0x7f),
			(0x12+channel)|(0x1<<7), (uint8_t)(NFRAC>>8),
			(0x13+channel)|(0x1<<7), (uint8_t)(NFRAC),
			(0x15+channel)|(0x1<<7), (value<<2)|(0x01),
			//(0x15+channel)|(0x1<<7), (value<<2)|(0x10),
			(0x19+channel)|(0x1<<7), (0x2<<6)|64,
			(0x5a)|(0x1<<7), 0xb0,
	};

	struct spi_ioc_transfer tr_freq = {
			.tx_buf = (unsigned long)tx,
			.rx_buf = 0,
			.len = ARRAY_SIZE(tx),
			.delay_usecs = delay,
			.speed_hz = speed,
			.bits_per_word = bits,
	};

	ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr_freq);
	if (ret < 1)
		pabort("can't send spi message");

	if(channel == RF_RX_CHANNEL) {
		uint8_t send_read_rx_reg[] = {
				0x05,
				0x09, //
				(0x10+channel),
				(0x11+channel),
				(0x12+channel),
				(0x13+channel),
				(0x15+channel),
				(0x19+channel),

				0x65,
				0x75,
		};
		uint8_t recv_read_rx_reg[] = {
				0,
		};

		struct spi_ioc_transfer tr1[2];

		memset(tr1, 0, sizeof(tr1));

		int i = 0;

		for(i = 0; i< ARRAY_SIZE(send_read_rx_reg); i++){
			tr1[0].tx_buf = (unsigned long)&send_read_rx_reg[i];
			tr1[0].len = 1;
			tr1[1].rx_buf = (unsigned long)&recv_read_rx_reg[i];
			tr1[1].len = 1;
			ret = ioctl(fd, SPI_IOC_MESSAGE(2), tr1);
			if (ret < 1)
				pabort("can't send spi message");

			printf("reg[0x%x] = 0x%x\n", send_read_rx_reg[i], recv_read_rx_reg[i]);
		}
	}else{
		uint8_t send_read_tx_reg[] = {
				0x05,
				0x09,
				(0x10+channel),
				(0x11+channel),
				(0x12+channel),
				(0x13+channel),
				(0x15+channel),
				(0x19+channel),

				0x41,
				0x45,
				0x44,
		};
		uint8_t recv_read_tx_reg[] = {
				0,
		};
		struct spi_ioc_transfer tr1[2];
		memset(tr1, 0, sizeof(tr1));

		int i = 0;
		for(i = 0; i< ARRAY_SIZE(send_read_tx_reg); i++){
			tr1[0].tx_buf = (unsigned long)&send_read_tx_reg[i];
			tr1[0].len = 1;
			tr1[1].rx_buf = (unsigned long)&recv_read_tx_reg[i];
			tr1[1].len = 1;
			ret = ioctl(fd, SPI_IOC_MESSAGE(2), tr1);
			if (ret < 1)
				pabort("can't send spi message");

			printf("reg[0x%x] = 0x%x\n", send_read_tx_reg[i], recv_read_tx_reg[i]);
		}

	}

	/*************************Calibration VCO*************************************/
	uint8_t Vtune_H = 0;
	uint8_t Vtune_L = 0;
	uint8_t cmin = 0;
	uint8_t cmax = 0;
	uint8_t incr_value = 31, temp_value = 0;

	spi_write_vco(fd, 31, channel);
	spi_check_vco(fd, &temp_value, channel);
	Vtune_H = (temp_value&0x80)>>7;
	Vtune_L = (temp_value&0x40)>>6;

	printf("Vtune_H=%d   Vtune_L=%d\n", Vtune_H, Vtune_L);

	if(Vtune_H==0&&Vtune_L==0){
		do{
			incr_value-=1;
			spi_write_vco(fd, incr_value, channel);
			spi_check_vco(fd, &temp_value, channel);
			Vtune_H = (temp_value&0x80)>>7;
			Vtune_L = (temp_value&0x40)>>6;
			//}while((Vtune_H!=1&&Vtune_L!=0&&incr_value>0));
		}while((Vtune_H!=1&&Vtune_L==0&&incr_value>0));
		cmin = incr_value;
		incr_value = 31;
		do{
			incr_value+=1;
			spi_write_vco(fd, incr_value, channel);
			spi_check_vco(fd, &temp_value, channel);
			Vtune_H = (temp_value&0x80)>>7;
			Vtune_L = (temp_value&0x40)>>6;
			//}while((Vtune_H!=0&&Vtune_L!=1&&incr_value<63));
		}while((Vtune_H==0&&Vtune_L!=1&&incr_value<63));
		cmax = incr_value;
		incr_value = round(((1.9-2.5)*(cmax-cmin)/(2.5-0.5))+cmax);

	}
	else if(Vtune_H==0&&Vtune_L==1){
		do{
			incr_value-=1;
			spi_write_vco(fd, incr_value, channel);
			spi_check_vco(fd, &temp_value, channel);
			Vtune_H = (temp_value&0x80)>>7;
			Vtune_L = (temp_value&0x40)>>6;
			//}while((Vtune_H!=0&&Vtune_L!=0));
		}while((Vtune_H==0&&Vtune_L!=0));
		cmin = incr_value;
		do{
			incr_value-=1;
			spi_write_vco(fd, incr_value, channel);
			spi_check_vco(fd, &temp_value, channel);
			Vtune_H = (temp_value&0x80)>>7;
			Vtune_L = (temp_value&0x40)>>6;
			//}while((Vtune_H!=1&&Vtune_L!=0&&incr_value>0));
		}while((Vtune_H!=1&&Vtune_L==0&&incr_value>0));
		cmax = incr_value;
		incr_value = round(((1.9-2.5)*(cmax-cmin)/(2.5-0.5))+cmax);

	}
	else if(Vtune_H==1&&Vtune_L==0){
		do{
			incr_value+=1;
			spi_write_vco(fd, incr_value, channel);
			spi_check_vco(fd, &temp_value, channel);
			Vtune_H = (temp_value&0x80)>>7;
			Vtune_L = (temp_value&0x40)>>6;
			//}while((Vtune_H!=0&&Vtune_L!=0));
		}while((Vtune_H!=0&&Vtune_L==0));
		cmin = incr_value;
		do{
			incr_value+=1;
			spi_write_vco(fd, incr_value, channel);
			spi_check_vco(fd, &temp_value, channel);
			Vtune_H = (temp_value&0x80)>>7;
			Vtune_L = (temp_value&0x40)>>6;
			//}while((Vtune_H!=0&&Vtune_L!=1&&incr_value<63));
		}while((Vtune_H==0&&Vtune_L!=1&&incr_value<63));
		cmax = incr_value;
		incr_value = round(((1.9-2.5)*(cmax-cmin)/(2.5-0.5))+cmax);
		//incr_value = (cmax+cmin)/2;

	}
	else {
		printf("check spi connection.\n");
		return -1;
	}
	printf("cmax=%d, cmin=%d VCO=%d\n", cmax, cmin, incr_value);
	spi_write_vco(fd, incr_value, channel);
	//spi_write_vco(fd, 41, channel);
	printf("freq set complete\n");
	/****************************************************************************/
	return 0;
}

/**
 * @brief  configure lms6002's Gain.
 *
 * @param[in]  fd                 spi file descriptor
 * @param[in]  vga                gain to be configured
 * @param[in]  channel            RF channel
 * @retval                        void
 *
 */
int snowleo_sdr_set_vga(int fd, unsigned int vga, uint8_t channel)
{
	int ret;
	unsigned int temp_val = 0;
	uint8_t tx[6], rx_pll_buffer;
	if(channel == RF_TX_CHANNEL) {
		printf("set tx vga\n");
		tx[0] = 0x41|(0x1<<7); tx[1] =(uint8_t)(vga&0xff);
		tx[2] = 0x45|(0x1<<7); tx[3] =(uint8_t)((vga>>8)&0xff);
		tx[4] = 0x44|(0x1<<7); tx[5] =(uint8_t)((vga>>24)&0xff); //PA
		temp_val = ioread32((unsigned long)(dma_reg_addr_wr+0x10));
		iowrite32(((vga>>16)&0x000000ff)|(temp_val&0xffffff00), (unsigned long)(dma_reg_addr_wr+0x10));
	} else {
		printf("set rx vga\n");
		tx[0] = 0x65|(0x1<<7); tx[1] = (uint8_t)(vga&0xff);//0x1f
		tx[2] = 0x75|(0x1<<7); tx[3] = (uint8_t)((vga>>8)&0xff);
		snowleo_spi_read(fd, 0x25, &rx_pll_buffer);
		//printf("LNA = 0x%x\n", tx[3]);
		//printf("reg[0x25] = 0x%x\n", rx_pll_buffer);
		//printf("(tx[3]&0x30)>>4 = 0x%x\n", (tx[3]&0x30)>>4);
		//printf("rx_pll_buffer&0xfc = 0x%x\n", rx_pll_buffer&0xfc);
		tx[4] = 0x25|(0x1<<7); tx[5] = (rx_pll_buffer&0xfc)|((tx[3]&0x30)>>4);
		temp_val = ioread32((unsigned long)(dma_reg_addr_wr+0x10));
		iowrite32(((vga>>8)&0x0000ff00)|(temp_val&0xffff00ff), (unsigned long)(dma_reg_addr_wr+0x10));
	}

	struct spi_ioc_transfer tr_freq;
	memset(&tr_freq, 0, sizeof(tr_freq));
	tr_freq.tx_buf = (unsigned long)tx;
	tr_freq.len = ARRAY_SIZE(tx);

	ret = ioctl(fd, SPI_IOC_MESSAGE(1), &tr_freq);
	if (ret < 1)
		pabort("can't send spi message");

	snowleo_spi_read(fd, 0x25, &rx_pll_buffer);
	printf("reg[0x25] = 0x%x\n", rx_pll_buffer);

	if(channel == RF_RX_CHANNEL) {
		uint8_t send_read_rx_reg[] = {
				0x65,
				0x75,
		};
		uint8_t recv_read_rx_reg[] = {
				0,
		};
		struct spi_ioc_transfer tr1[2];
		memset(tr1, 0, sizeof(tr1));
		int i = 0;
		for(i = 0; i< ARRAY_SIZE(send_read_rx_reg); i++){
			tr1[0].tx_buf = (unsigned long)&send_read_rx_reg[i];
			tr1[0].len = 1;
			tr1[1].rx_buf = (unsigned long)&recv_read_rx_reg[i];
			tr1[1].len = 1;
			ret = ioctl(fd, SPI_IOC_MESSAGE(2), tr1);
			if (ret < 1)
				pabort("can't send spi message");

			printf("reg[0x%x] = 0x%x\n", send_read_rx_reg[i], recv_read_rx_reg[i]);
		}
	}else{
		uint8_t send_read_tx_reg[] = {
				0x41,
				0x45,
				0x44,
		};
		uint8_t recv_read_tx_reg[] = {
				0,
		};
		struct spi_ioc_transfer tr1[2];
		memset(tr1, 0, sizeof(tr1));

		int i = 0;
		for(i = 0; i< ARRAY_SIZE(send_read_tx_reg); i++){
			tr1[0].tx_buf = (unsigned long)&send_read_tx_reg[i];
			tr1[0].len = 1;
			tr1[1].rx_buf = (unsigned long)&recv_read_tx_reg[i];
			tr1[1].len = 1;
			ret = ioctl(fd, SPI_IOC_MESSAGE(2), tr1);
			if (ret < 1)
				pabort("can't send spi message");

			printf("reg[0x%x] = 0x%x\n", send_read_tx_reg[i], recv_read_tx_reg[i]);
		}

	}
	return 0;
}

/**
 * @brief  configure snowleo's spi controller.
 *
 * @retval                        0 Success, -1 Fail
 *
 */
int snowleo_sdr_spi_init()
{
	int ret = 0;
	int fd;

	fd = open(device, O_RDWR);
	if (fd < 0)
		pabort("can't open device");

	/*
	 * spi mode
	 */
	ret = ioctl(fd, SPI_IOC_WR_MODE, &mode);
	if (ret == -1)
		pabort("can't set spi mode");

	ret = ioctl(fd, SPI_IOC_RD_MODE, &mode);
	if (ret == -1)
		pabort("can't get spi mode");

	/*
	 * bits per word
	 */
	ret = ioctl(fd, SPI_IOC_WR_BITS_PER_WORD, &bits);
	if (ret == -1)
		pabort("can't set bits per word");

	ret = ioctl(fd, SPI_IOC_RD_BITS_PER_WORD, &bits);
	if (ret == -1)
		pabort("can't get bits per word");

	/*
	 * max speed hz
	 */
	ret = ioctl(fd, SPI_IOC_WR_MAX_SPEED_HZ, &speed);
	if (ret == -1)
		pabort("can't set max speed hz");

	ret = ioctl(fd, SPI_IOC_RD_MAX_SPEED_HZ, &speed);
	if (ret == -1)
		pabort("can't get max speed hz");

	printf("spi mode: %d\n", mode);
	printf("bits per word: %d\n", bits);
	printf("max speed: %d Hz (%d MHz)\n", speed, speed/1000000);

	return fd;

}

