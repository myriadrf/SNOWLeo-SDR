#include "osthread.h"

extern bool conflag;
extern volatile int flag;
extern unsigned char *adc_mem_addr;
extern unsigned char *dac_mem_addr;
extern unsigned char *dma_reg_addr_wr;
extern unsigned char *dma_reg_addr_rd;
extern int file_length;
extern int dma_dac_stop;
extern double x_t[512];
extern double y_i[512];
extern double y_q[512];
Osthread::Osthread(QObject *parent) :
    QThread(parent)
{

}
void Osthread::run()
{
    qDebug()<<"run";
    while(conflag == false)
    {
        if(flag == 1)
        {
            axi_dma_reset(S2MM_CHANNEL ,(unsigned long)dma_reg_addr_wr, IP_RESET);
            axi_dma_init(S2MM_CHANNEL, 2048, 0 ,S2MM_DST_ADDR,(unsigned long)dma_reg_addr_wr);
            qDebug()<<"init";
            axi_dma_start(S2MM_CHANNEL,0,(unsigned long)dma_reg_addr_wr);
            qDebug()<<"start";
            check_dma_done(S2MM_CHANNEL,(unsigned long)dma_reg_addr_wr);
            axi_dma_reset(S2MM_CHANNEL ,(unsigned long)dma_reg_addr_wr, FIFO_IP_RESET);
            setSamples((unsigned char *)(adc_mem_addr));
            flag = 0;
            emit paintsignal();
        }
    }
    conflag = false;
}
void Osthread::stop()
{
    conflag = true;
    flag = 0;
}
void Osthread::setSamples(unsigned char * data)
{ 
    memset(x_t, 0 , sizeof(x_t));
    memset(y_i , 0 , sizeof(y_i));
    memset(y_q , 0 , sizeof(y_q));
    for(int i=0 ; i<DATASIZE ; i++)
    {
        x_t[i]= i;
        y_i[i] = (signed short)((*((signed int *)data +i)&0xffff));
        y_q[i] = (signed short)(((*((signed int *)data +i)&0xffff0000)>>16));
    }
}
