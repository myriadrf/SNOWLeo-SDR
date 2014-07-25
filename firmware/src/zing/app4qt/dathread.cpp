#include "dathread.h"

extern unsigned char *adc_mem_addr;
extern unsigned char *dac_mem_addr;
extern unsigned char *dma_reg_addr_wr;
extern unsigned char *dma_reg_addr_rd;
extern int file_length;
extern int dma_dac_stop;
Dathread::Dathread(QObject *parent) :
    QThread(parent)
{

}
void Dathread::run()
{
    while(!dma_dac_stop)
    {
        if(file_length < 20*1024*1024)
        {
            axi_dma_init(MM2S_CHANNEL ,2048 ,file_length/2048-1 ,MM2S_SRC_ADDR,(unsigned long)dma_reg_addr_rd);
            axi_dma_start(MM2S_CHANNEL , 0 ,(unsigned long)dma_reg_addr_rd);
        }
    }
    dma_dac_stop = 0;
}
void Dathread::stop()
{
    dma_dac_stop = 1;
    axi_dma_reset(MM2S_CHANNEL,(unsigned long)dma_reg_addr_rd,FIFO_IP_RESET);
}
