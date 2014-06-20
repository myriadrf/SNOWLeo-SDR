/**
 * $Id: snowleo_i2c_ops.c 2014-5
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
#include <linux/i2c.h>
#include <linux/i2c-dev.h>
#include "snowleo_i2c_ops.h"
#include "snowleo_hw.h"

//#define SNOWLEO_SDR_DEBUG

#define SNOWLEO_SDR_I2C_ADDR        0x60

int snowleo_sdr_i2c_read(int fd, unsigned int snowleo_sdr_addr,
		unsigned short register_offset, unsigned char *value);
int snowleo_sdr_i2c_write(int fd, unsigned int snowleo_sdr_addr,
		unsigned short register_offset, unsigned char value);

/**
 * @brief  Configure snowleosdr lms6002's clock.
 *
 * @param[in] i2c_dev     i2c device name,e.g. "/dev/i2c-0"
 * @retval                0 Success, -1 Fail
 *
 */
int snowleo_sdr_set_clock(char *i2c_dev)
{
	int fd, i;

	fd = open(i2c_dev, O_RDWR);
	if(fd < 0){
		perror("open error");
		return -1;
	}

	ioctl(fd, I2C_TIMEOUT, 1);
	ioctl(fd, I2C_RETRIES, 2);

	sleep(1);

	for(i = 0; i < Config_Len_C; i++){
		if(snowleo_sdr_i2c_write(fd , SNOWLEO_SDR_I2C_ADDR, (unsigned short)(snowleo_sdr_Config[i][0]),
				(unsigned char)snowleo_sdr_Config[i][1])<0)
			perror("snowleo_sdr_i2c_write");
	/*	printf("[%d]reg=0x%x, val=0x%x  set done!\n", i,
				(unsigned short)snowleo_sdr_Config[i][0], (unsigned char)snowleo_sdr_Config[i][1]);*/
	}
	printf("[i2c]All done!\n");
	return 0;
}

/**
 * @brief  i2c read operation function.
 *
 * @param[in]  fd                 i2c file descriptor
 * @param[in]  snowleo_sdr_addr   i2c slave address
 * @param[in]  register_offset    i2c slave register address to be read
 * @param[out] value              read back data
 * @retval                        0 Success, -1 Fail
 *
 */
int snowleo_sdr_i2c_read(int fd, unsigned int snowleo_sdr_addr,
		unsigned short register_offset, unsigned char *value)
{
	int ret;
	struct i2c_rdwr_ioctl_data snowleo_sdr_data;
	snowleo_sdr_data.nmsgs=2;
	snowleo_sdr_data.msgs=(struct i2c_msg*)malloc(snowleo_sdr_data.nmsgs*sizeof(struct i2c_msg));

	if(!snowleo_sdr_data.msgs){
		perror("malloc");
		return -1;
	}

	(snowleo_sdr_data.msgs[0]).len = 1;
	(snowleo_sdr_data.msgs[0]).addr = snowleo_sdr_addr;
	(snowleo_sdr_data.msgs[0]).flags = 0;   //write
	(snowleo_sdr_data.msgs[0]).buf = (unsigned char*)malloc(1);
	(snowleo_sdr_data.msgs[0]).buf[0] = register_offset;
	(snowleo_sdr_data.msgs[1]).len = 1;
	(snowleo_sdr_data.msgs[1]).addr = snowleo_sdr_addr;
	(snowleo_sdr_data.msgs[1]).flags = I2C_M_RD;   //read
	(snowleo_sdr_data.msgs[1]).buf = (unsigned char*)malloc(1);
	(snowleo_sdr_data.msgs[1]).buf[0] = 0;

	ret = ioctl(fd,I2C_RDWR,(unsigned long)&snowleo_sdr_data);
	if(ret < 0){
		perror("ioctl");
		return -1;
	}

	*value = (snowleo_sdr_data.msgs[1].buf[0]) ;
#ifdef SNOWLEO_SDR_DEBUGG
	printf("%x, ", (snowleo_sdr_data.msgs[1]).buf[0]);
	printf("%x  %s\n", (snowleo_sdr_data.msgs[1]).buf[1], __func__);
#endif

	return 0;
}

/**
 * @brief  i2c write operation function.
 *
 * @param[in]  fd                 i2c file descriptor
 * @param[in]  snowleo_sdr_addr   i2c slave address
 * @param[in]  register_offset    i2c slave register address to be written
 * @param[in]  value              data to be written
 * @retval                        0 Success, -1 Fail
 *
 */
int snowleo_sdr_i2c_write(int fd, unsigned int snowleo_sdr_addr,
		unsigned short register_offset, unsigned char value)
{
	int ret;
	struct i2c_rdwr_ioctl_data snowleo_sdr_data;
	snowleo_sdr_data.nmsgs = 1;
	snowleo_sdr_data.msgs = (struct i2c_msg*)malloc(snowleo_sdr_data.nmsgs*sizeof(struct i2c_msg));

	if(!snowleo_sdr_data.msgs){
		perror("malloc");
		return -1;
	}

	(snowleo_sdr_data.msgs[0]).addr = snowleo_sdr_addr;
	(snowleo_sdr_data.msgs[0]).len = 2;
	(snowleo_sdr_data.msgs[0]).addr = snowleo_sdr_addr;
	(snowleo_sdr_data.msgs[0]).flags = 0;   //write
	(snowleo_sdr_data.msgs[0]).buf = (unsigned char *)malloc(2);
	(snowleo_sdr_data.msgs[0]).buf[0] = register_offset;
	(snowleo_sdr_data.msgs[0]).buf[1] = value;
	ret=ioctl(fd,I2C_RDWR,(unsigned long)&snowleo_sdr_data);
	if(ret<0){
		perror("ioctl error2");
		return -1;
	}

#ifdef SNOWLEO_SDR_DEBUG
	printf("%x, ",(snowleo_sdr_data.msgs[0]).buf[1]);
	printf("%x  %s\n",(snowleo_sdr_data.msgs[0]).buf[2], __func__);
#endif

	return 0;
}
