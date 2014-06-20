/**
 * $Id: snowleo_sdr_main.c 2014-5
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
#define _GNU_SOURCE 1

#include <signal.h>
#include <arpa/inet.h>
#include "snowleo_hw.h"

#define  LENGTH_MIN           8
#define  LENGTH_MAX           4088

/**/
#define  PACKAGE_HEAD         0xF0
#define  DMA_FILE_TX          0x10
#define  DMA_FILE_RX          0x11
#define  DMA_START_ADC        0x12
#define  DMA_START_DAC        0x13
#define  DMA_STOP_ADC         0x14
#define  DMA_STOP_DAC         0x15
#define  DMA_CONNECT_DISABLE  0x16

#define  SDR_RF_CTRL_TX_FREQ  0x17
#define  SDR_RF_CTRL_RX_FREQ  0x18
#define  SDR_RF_CTRL_TX_VGA   0x19
#define  SDR_RF_CTRL_RX_VGA   0x20
#define  SDR_RF_CTRL_TEST_SEQ 0x21


/**/
unsigned int cmd_buff[2];

int fd, spi_fd, file_length = 0, rx_length = 256 * 1024;
unsigned char cycle_mode = 1;

typedef struct sockaddr SA;
int listenfd = -1, connfd = -1;
int listenfd_file = -1, connfd_file = -1;
struct sockaddr_in myaddr, peeraddr;
socklen_t peerlen = sizeof(peeraddr);

pthread_t adc_thread = 0, dac_thread = 0, recv_file_thread = 0;
pthread_mutex_t adc_lock, dac_lock, lock;

unsigned char *adc_mem_addr;
unsigned char *dac_mem_addr;
unsigned char *dma_reg_addr_wr;
unsigned char *dma_reg_addr_rd;

#define MaxSize 6
#define BUFFER_MAX_SIZE 2*1024*1024
struct ring_buf
{
	unsigned char *data[MaxSize];
	int front,rear;
} *p;

/**
 * Function declaration
 */
void *recv_file_loop_func(void *temp);
void *thread_recv_func(void* temp);
void *thread_adc_func(void* temp);
void *thread_dac_func_single(void* temp);
void *thread_dac_func_cycle(void* temp);
void write_func_cleanup(void *arg);
static void sig_pipe(int signo);
static void sig_quit(int signo);
int save_frame(unsigned char *frame, const char *file_name, int length);

int main (int argc, char *argv[])
{

	int ret, i;
	pthread_t recv_thread;
	struct timeval tv;
	int nSendBufLen = 256*1024;

	if (signal(SIGPIPE, sig_pipe) == SIG_ERR)
	{
		fprintf(stderr, "can't catch SIGPIPE\n");
		exit(1);
	}
	/*	if (signal(SIGQUIT, sig_quit) == SIG_ERR)
	{
		fprintf(stderr, "can't catch SIGQUIT\n");
		exit(1);
	}
	 */
	pthread_mutex_init(&dac_lock, NULL);
	pthread_mutex_init(&adc_lock, NULL);
	pthread_mutex_init(&lock, NULL);

	/**
	 * Memory Mapping
	 */
	adc_mem_addr = map_memory(S2MM_DST_ADDR, S2MM_BUF_SIZE);
	memset(adc_mem_addr, 0x0, S2MM_BUF_SIZE);
	dac_mem_addr = map_memory(MM2S_SRC_ADDR, MM2S_BUF_SIZE);
	memset(dac_mem_addr, 0,  MM2S_BUF_SIZE);

	dma_reg_addr_wr = map_memory(AXI_DMA_BASE_WR, REG_SIZE);
	dma_reg_addr_rd = map_memory(AXI_DMA_BASE_RD, REG_SIZE);

	/*snowleo lms6002 clock set*/
	snowleo_sdr_set_clock("/dev/i2c-0");
	/*snowleo lms6002 spi init*/
	spi_fd = snowleo_sdr_spi_init();
	transfer(spi_fd);

	/**
	 * Simple ring buffer
	 */
	p = (struct ring_buf *)malloc(sizeof(struct ring_buf));
	p->front=p->rear=0;
	for(i = 0; i < MaxSize; i++)
		p->data[i] = dac_mem_addr + (i * BUFFER_MAX_SIZE);

	/**
	 * Tcp server
	 * TODO Support two client connections, one to do the receiving, one to do transmitting
	 */
	if((listenfd = socket(PF_INET, SOCK_STREAM, 0)) < 0)
	{
		perror("fail to socket!");
		exit(-1);
	}

	bzero(&myaddr, sizeof(myaddr));
	myaddr.sin_family = PF_INET;
	myaddr.sin_port = htons(8000);
	myaddr.sin_addr.s_addr = htons(INADDR_ANY);

	if(bind(listenfd, (SA *)&myaddr, sizeof(myaddr)) < 0)
	{
		perror("fail to bind!");
		exit(-1);
	}

	listen(listenfd, 1);

	while(1)
	{
		if((connfd = accept(listenfd, (SA *)&peeraddr, &peerlen)) < 0)
		{
			perror("fail to accept!");
			exit(-1);
		}
#if 1
		tv.tv_sec = 10;
		tv.tv_usec = 0;
#ifdef  RECV_TIMEOUT
		setsockopt(connfd, SOL_SOCKET, SO_RCVTIMEO|SO_SNDTIMEO, &tv, sizeof(tv));
#else
		setsockopt(connfd, SOL_SOCKET, SO_SNDTIMEO, &tv, sizeof(tv));
#endif
		setsockopt(connfd, SOL_SOCKET, SO_SNDBUF, (const char *)&nSendBufLen, sizeof(int) );
#endif
		dma_dbg(MSG_DEBUG,"Connection from [%s:%d]\n", inet_ntoa(peeraddr.sin_addr), ntohs(peeraddr.sin_port));
		//sprintf(file_name, "/mnt/%d.dat", ntohs(peeraddr.sin_port));
		ret = pthread_create(&recv_thread, NULL, &thread_recv_func, NULL);
		if (ret)
		{
			dma_dbg(MSG_ERROR,"ERROR; return code from pthread_create() is %d\n", ret);
			return -1;
		}

		pthread_join(recv_thread,NULL);
		memset((unsigned char *)cmd_buff, 0, sizeof(unsigned int)*2);

		dma_dbg(MSG_DEBUG,"Connection from [%s:%d] is closed\n", inet_ntoa(peeraddr.sin_addr), ntohs(peeraddr.sin_port));
		close(connfd);
	}

	return 0;
}

/**
 * @brief  recv command from network connection.
 *
 * @param[in]  temp               user parameters
 * @retval                        NULL
 *
 */
void *thread_recv_func(void* temp)
{
	int len = 0, ret = 0;

	while(1)
	{
		if((ret = recv(connfd, (unsigned char *)&cmd_buff, sizeof(unsigned int)*2, 0))<=0)
		{
#ifdef RECV_TIMEOUT
			rx_length = 256 * 1024;
			if(recv_file_thread > 0)
				pthread_cancel(recv_file_thread);
			if(dac_thread > 0)
				pthread_cancel(dac_thread);
			if(adc_thread > 0)
				pthread_cancel(adc_thread);
			pthread_exit(NULL);
#else
			continue;
#endif
		}

		dma_dbg(MSG_DEBUG,"cmd[0] = 0x%x, cmd[1] = 0x%x\n", cmd_buff[0], cmd_buff[1]);
		if((cmd_buff[0]&0xFF000000)>>24!= PACKAGE_HEAD)
		{
			memset((unsigned char *)cmd_buff, 0, sizeof(unsigned int)*2);
			perror("package error!\n");
			continue;
		}

		switch ((cmd_buff[0]&0x00FF0000)>>16)
		{
		case DMA_STOP_DAC:
			dma_dbg(MSG_DEBUG,"recv DMA_STOP_DAC cmd\n");
			break;
		case DMA_STOP_ADC:
			dma_dbg(MSG_DEBUG,"recv DMA_STOP_ADC cmd\n");
			break;

		case DMA_FILE_TX:
			dma_dbg(MSG_DEBUG,"recv DMA_FILE_TX cmd\n");
			cycle_mode = cmd_buff[0]&0x000000FF;
			file_length = cmd_buff[1] * 1024;
			dma_dbg(MSG_DEBUG,"file size = %d\n", file_length);
			if(cycle_mode == 0)
			{
				if(pthread_create(&recv_file_thread, NULL, &recv_file_loop_func, NULL)<0)
					dma_dbg(MSG_ERROR,"create recv file thread failed!\n");
				if(pthread_create(&dac_thread, NULL, &thread_dac_func_cycle, NULL)<0)
					dma_dbg(MSG_ERROR,"create dac thread failed!\n");
			}
			else
			{
				do {
					len += recv(connfd, dac_mem_addr + len, file_length - len, 0);
				}while(len != file_length);
				dma_dbg(MSG_DEBUG,"recv file complete!\n");
				len = 0;
				axi_dma_reset(S2MM_CHANNEL, (unsigned long)dma_reg_addr_wr, FIFO_IP_RESET);
				if(pthread_create(&dac_thread, NULL, &thread_dac_func_single, NULL)<0)
					dma_dbg(MSG_ERROR,"create dac thread failed!\n");
			}

			dma_dbg(MSG_DEBUG,"recv file\n");
			break;
		case DMA_FILE_RX:
			dma_dbg(MSG_DEBUG,"recv DMA_FILE_RX cmd\n");
			rx_length = cmd_buff[1] * 1024;
			printf("rx_length = %d\n", rx_length);
			break;
		case DMA_START_ADC:
			if(pthread_create(&adc_thread, NULL, &thread_adc_func, NULL)<0)
				dma_dbg(MSG_ERROR,"create adc thread failed!\n");
			dma_dbg(MSG_DEBUG,"recv DMA_START_ADC cmd\n");
			break;
		case DMA_START_DAC:
			/*if(pthread_create(&dac_thread, NULL, &thread_dac_func_single, NULL)<0)
				dma_dbg(MSG_ERROR,"create dac thread failed!\n");*/
			dma_dbg(MSG_DEBUG,"recv DMA_START_DAC cmd\n");
			break;
		case SDR_RF_CTRL_TX_FREQ:
			snowleo_sdr_set_freq(spi_fd, cmd_buff[0]&0x0000FFFF, RF_TX_CHANNEL);
			dma_dbg(MSG_DEBUG,"recv SDR_RF_CTRL_TX_FREQ cmd\n");
			break;
		case SDR_RF_CTRL_RX_FREQ:
			snowleo_sdr_set_freq(spi_fd, cmd_buff[0]&0x0000FFFF, RF_RX_CHANNEL);
			dma_dbg(MSG_DEBUG,"recv SDR_RF_CTRL_RX_FREQ cmd\n");
			break;
		case SDR_RF_CTRL_TX_VGA:
			snowleo_sdr_set_vga(spi_fd, (cmd_buff[0]&0x0000FFFF)|(cmd_buff[1]&0xFFFF0000), RF_TX_CHANNEL);
			dma_dbg(MSG_DEBUG,"recv SDR_RF_CTRL_TX_VGA cmd\n");
			break;
		case SDR_RF_CTRL_RX_VGA:
			snowleo_sdr_set_vga(spi_fd, (cmd_buff[0]&0x0000FFFF)|((cmd_buff[1]&0xFF000000)>>8), RF_RX_CHANNEL);
			dma_dbg(MSG_DEBUG,"recv SDR_RF_CTRL_RX_VGA cmd\n");
			break;
		case DMA_CONNECT_DISABLE:
			dma_dbg(MSG_DEBUG,"recv DMA_CONNECT_DISABLE cmd\n");
			rx_length = 256 * 1024;
			if(recv_file_thread > 0)
				pthread_cancel(recv_file_thread);
			if(dac_thread > 0)
				pthread_cancel(dac_thread);
			if(adc_thread > 0)
				pthread_cancel(adc_thread);
			pthread_exit(NULL);
			break;
		default:
			break;
		}

		memset((unsigned char *)cmd_buff, 0, sizeof(unsigned int)*2);
	}

	return NULL;
}

/**
 * @brief  recv data from axi dma ipcore thread.
 *
 * @param[in]  temp               user parameters
 * @retval                        NULL
 *
 */
void *thread_adc_func(void* temp)
{
	pthread_detach(pthread_self());
	cpu_set_t mask ;
	CPU_ZERO(&mask);
	CPU_SET(2,&mask);
	int ret = 0;

	ret =pthread_setaffinity_np(pthread_self(),sizeof(mask),(const cpu_set_t*)&mask );
	if(ret < 0)
		printf("dac:pthread_setaffinity_np error... \n");
	do
	{
		if(rx_length%LENGTH_MAX != 0 && rx_length < 20*1024*1024) {
			axi_dma_init(S2MM_CHANNEL, LENGTH_MAX, rx_length/LENGTH_MAX-1, S2MM_DST_ADDR,
					(unsigned long)dma_reg_addr_wr);
			axi_dma_start(S2MM_CHANNEL, 0, (unsigned long)dma_reg_addr_wr);
			check_dma_done(S2MM_CHANNEL, (unsigned long)dma_reg_addr_wr);
			axi_dma_reset(S2MM_CHANNEL, (unsigned long)dma_reg_addr_wr, IP_RESET);
			axi_dma_init(S2MM_CHANNEL, rx_length%LENGTH_MAX, 0, S2MM_DST_ADDR + (rx_length - rx_length%LENGTH_MAX),
					(unsigned long)dma_reg_addr_wr);
			axi_dma_start(S2MM_CHANNEL, 0, (unsigned long)dma_reg_addr_wr);
			check_dma_done(S2MM_CHANNEL, (unsigned long)dma_reg_addr_wr);
		}else if(rx_length%LENGTH_MAX == 0 && rx_length < 20*1024*1024) {
			axi_dma_init(S2MM_CHANNEL, LENGTH_MAX, rx_length/LENGTH_MAX-1, S2MM_DST_ADDR,
					(unsigned long)dma_reg_addr_wr);
			axi_dma_start(S2MM_CHANNEL, 0, (unsigned long)dma_reg_addr_wr);
			check_dma_done(S2MM_CHANNEL, (unsigned long)dma_reg_addr_wr);
		}
		else
			dma_dbg(MSG_DEBUG,"Invalid argument!\n");
		if(send(connfd, (void *)adc_mem_addr, rx_length, 0)<0)
			dma_dbg(MSG_DEBUG,"send:errno=%s\n", strerror(errno));
		axi_dma_reset(S2MM_CHANNEL, (unsigned long)dma_reg_addr_wr, FIFO_IP_RESET);
	}while(0);

	return NULL;
}

/**
 * @brief  send data to axi dma thread.
 *
 * @param[in]  temp               user parameters
 * @retval                        NULL
 *
 */
void *thread_dac_func_single(void* temp)
{
	pthread_detach(pthread_self());
	cpu_set_t mask ;
	CPU_ZERO(&mask);
	CPU_SET(0,&mask);
	int ret = 0;

	ret =pthread_setaffinity_np(pthread_self(),sizeof(mask),(const cpu_set_t*)&mask );
	if(ret < 0)
		printf("dac:pthread_setaffinity_np error... \n");
	do
	{
		if(file_length < 20*1024*1024) {
			axi_dma_init(MM2S_CHANNEL, 2048, file_length/2048-1, MM2S_SRC_ADDR, (unsigned long)dma_reg_addr_rd);
			axi_dma_start(MM2S_CHANNEL, 0, (unsigned long)dma_reg_addr_rd);
			//check_dma_done(MM2S_CHANNEL, (unsigned long)dma_reg_addr_rd);
		}

	}while(0);

	return NULL;
}

/**
 * @brief  continuous data transmission to axi dma thread.
 *
 * @param[in]  temp               user parameters
 * @retval                        NULL
 *
 */
void *thread_dac_func_cycle(void* temp)
{
	pthread_detach(pthread_self());
	cpu_set_t mask ;
	CPU_ZERO(&mask);
	CPU_SET(0,&mask);
	int ret = 0;

	ret =pthread_setaffinity_np(pthread_self(),sizeof(mask),(const cpu_set_t*)&mask );
	if(ret < 0)
		printf("dac:pthread_setaffinity_np error... \n");

	while(1)
	{

		//pthread_mutex_lock(&lock);
		if(p->front==p->rear)
		{
			dma_dbg(MSG_WARNING,"queue empty!\n");
			//pthread_mutex_unlock(&lock);
			continue;
		}
		else
		{
			dma_dbg(MSG_WARNING,"buffer is not empty!\n");
			//pthread_mutex_unlock(&lock);
			p->front=(p->front+1)%MaxSize;
			do
			{
				axi_dma_init(MM2S_CHANNEL, 2048, BUFFER_MAX_SIZE/2048, MM2S_SRC_ADDR+(p->data[p->front]-dac_mem_addr), (unsigned long)dma_reg_addr_rd);
				axi_dma_start(MM2S_CHANNEL, 1, (unsigned long)dma_reg_addr_rd);
				check_dma_done(MM2S_CHANNEL, (unsigned long)dma_reg_addr_rd);
				axi_dma_reset(MM2S_CHANNEL, (unsigned long)dma_reg_addr_rd, FIFO_IP_RESET);

			}while(0);
		}
	}

	return NULL;
}

/**
 * @brief  save a frame data for debug.
 *
 * @param[in]  frame              data cache
 * @param[in]  file_name          file name
 * @param[in]  length             data length
 * @retval                        0 Success, -1 Fail
 *
 */
int save_frame(unsigned char *frame, const char *file_name, int length)
{
	int fd_raw = open(file_name, O_RDWR|O_CREAT| O_APPEND, 0666);

	if(fd_raw < 0)
	{
		dma_dbg(MSG_ERROR,"can not open file\n");
		return -1;
	}

	write(fd_raw, frame, length);
	close(fd_raw);

	return 0;
}

/**
 * @brief  continuous receiving data thread.
 *
 * @param[in]  temp               user parameters
 * @retval                        NULL
 *
 */
void *recv_file_loop_func(void *temp)
{
	pthread_detach(pthread_self());
	pthread_cleanup_push(write_func_cleanup,NULL);
	int length = 0;
	struct sockaddr_in file_addr, file_peeraddr;
	socklen_t file_peerlen = sizeof(peeraddr);

	if((listenfd_file = socket(PF_INET, SOCK_STREAM, 0)) < 0)
	{
		perror("fail to socket!");
	}

	bzero(&file_addr, sizeof(file_addr));
	file_addr.sin_family = PF_INET;
	file_addr.sin_port = htons(8080);
	file_addr.sin_addr.s_addr = htons(INADDR_ANY);

	if(bind(listenfd_file, (SA *)&file_addr, sizeof(file_addr)) < 0)
	{
		perror("fail to bind!");
	}

	listen(listenfd_file, 1);

	if((connfd_file = accept(listenfd_file, (SA *)&file_peeraddr, &file_peerlen)) < 0)
	{
		perror("fail to accept!");
	}

	while(1){
		//pthread_mutex_lock(&lock);
		if((p->rear+1)%MaxSize==p->front)
		{
			dma_dbg(MSG_WARNING,"queue full!\n");
			//pthread_mutex_unlock(&lock);
			continue;
		}
		else
		{
			//pthread_mutex_unlock(&lock);
			p->rear=(p->rear+1)%MaxSize;
			do {
				length += recv(connfd_file, p->data[p->rear]+length, file_length-length, 0);
			}while(length != file_length);
			length = 0;
		}
	}

	pthread_cleanup_pop(1);

	return NULL;
}

/**
 * @brief  cleanup function for recv_file_loop_func.
 *
 * @param[in]  arg                user parameters
 * @retval                        void
 *
 */
void write_func_cleanup(void *arg)
{
	if(listenfd_file > 0)
		close(listenfd_file);

	if(connfd_file > 0)
		close(connfd_file);
}

/**
 * @brief  SIGPIPE handle.to avoid program quit from wrong network connection
 *
 * @param[in]  signo              signal id
 * @retval                        void
 *
 */
static void sig_pipe(int signo)
{
	/*nothing to do*/
}
static void sig_quit(int signo)
{
	unmap_memory(adc_mem_addr, S2MM_BUF_SIZE);
	unmap_memory(dac_mem_addr, MM2S_BUF_SIZE);
	unmap_memory(dma_reg_addr_wr, REG_SIZE);
	unmap_memory(dma_reg_addr_rd, REG_SIZE);
	free(p);
	close(spi_fd);
	exit(1);
}
