#include "snow_sdr.h"
#include "ui_snow_sdr.h"

bool conflag = false;
volatile int flag = 1;
unsigned char *adc_mem_addr;
unsigned char *dac_mem_addr;
unsigned char *dma_reg_addr_wr;
unsigned char *dma_reg_addr_rd;
int file_length;
int spi_fd;
int dma_dac_stop = 0;
double x_t[512] = {0};
double y_i[512] = {0};
double y_q[512] = {0};

Snow_sdr::Snow_sdr(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Snow_sdr)
{
    ui->setupUi(this);
    time_i = new QwtPlotCurve();
    time_q = new QwtPlotCurve();
    freq_i = new QwtPlotCurve();
    freq_q = new QwtPlotCurve();
    x_y_c = new QwtPlotCurve();

    QPen i,q,c;
    i.setBrush(Qt::yellow);
    q.setBrush(Qt::red);
    c.setBrush(Qt::green);
    i.setWidth(2);
    q.setWidth(2);
    c.setWidth(2);
    time_i->setPen(i);
    time_i->attach(ui->time_i_plot);
    time_q->setPen(q);
    time_q->attach(ui->time_q_plot);
    x_y_c->setPen(c);
    x_y_c->attach(ui->freq_q_plot);



    // mmap
    adc_mem_addr = map_memory(S2MM_DST_ADDR ,S2MM_BUF_SIZE);
    memset(adc_mem_addr , 0 ,S2MM_BUF_SIZE);
    dac_mem_addr = map_memory(MM2S_SRC_ADDR, MM2S_BUF_SIZE);
    memset(dac_mem_addr, 0,  MM2S_BUF_SIZE);

    dma_reg_addr_wr = map_memory(AXI_DMA_BASE_WR, REG_SIZE);
    dma_reg_addr_rd = map_memory(AXI_DMA_BASE_RD, REG_SIZE);

    /*****************************/
    // set IIc
    snowleo_sdr_set_clock("/dev/i2c-1");

    spi_fd = snowleo_sdr_spi_init();
    transfer(spi_fd);
    /****************************/

    init_ui();
    initpation();
    connect(ui->Os_bt ,SIGNAL(clicked()) , this , SLOT(Os_contrl()));
    connect(&osthread , SIGNAL(paintsignal()) , this ,SLOT(plotcure()),Qt::QueuedConnection);
    connect(ui->filebt , SIGNAL(clicked()) , this , SLOT(Fileselect()));
    connect(ui->dacontrbt , SIGNAL(clicked()) ,this , SLOT(Dacontrl()));
    connect(ui->Rx_spinBox ,SIGNAL(valueChanged(int)),ui->freq_rx ,SLOT(setValue(int)));
    connect(ui->Tx_spinBox ,SIGNAL(valueChanged(int)),ui->freq_tx ,SLOT(setValue(int)));
    connect(ui->freq_rx,SIGNAL(valueChanged(int)),this ,SLOT(Set_freq_value_Rx(int)));
    connect(ui->freq_tx,SIGNAL(valueChanged(int)),this  ,SLOT(Set_freq_value_Tx(int)));
    connect(ui->Rx_gain_srtbt ,SIGNAL(clicked()) ,this , SLOT(Set_vga_value_Rx()));
    connect(ui->Tx_gain_setbt , SIGNAL(clicked()) , this ,SLOT(Set_vga_value_Tx()));

}

Snow_sdr::~Snow_sdr()
{
    delete ui;
    osthread.stop();
    dathread.stop();
    unmap_memory(adc_mem_addr, S2MM_BUF_SIZE);
    unmap_memory(dac_mem_addr, MM2S_BUF_SIZE);
    unmap_memory(dma_reg_addr_wr, REG_SIZE);
    unmap_memory(dma_reg_addr_rd, REG_SIZE);
}
void Snow_sdr::init_ui()
{
    ui->time_q_plot->setAxisTitle(ui->time_q_plot->xBottom, "时间轴");
    ui->time_q_plot->setAxisScale(ui->time_q_plot->xBottom, 0, 512);
    ui->time_q_plot->setAxisTitle(ui->time_q_plot->yLeft, "电压");
    ui->time_q_plot->setAxisScale(ui->time_q_plot->yLeft, -35000, 35000);
    ui->time_q_plot->enableAxis(ui->time_q_plot->xBottom, false);
    ui->time_q_plot->enableAxis(ui->time_q_plot->yLeft, false);
    ui->time_q_plot->replot();
    ui->freq_q_plot->setAxisTitle(ui->freq_q_plot->xBottom, "时间轴");
    ui->freq_q_plot->setAxisScale(ui->freq_q_plot->xBottom, -60000,60000 );
    ui->freq_q_plot->setAxisTitle(ui->freq_q_plot->yLeft, "电压");
    ui->freq_q_plot->setAxisScale(ui->freq_q_plot->yLeft, -60000, 60000);
    ui->freq_q_plot->enableAxis(ui->time_q_plot->xBottom, false);
    ui->freq_q_plot->enableAxis(ui->time_q_plot->yLeft, false);
    ui->freq_q_plot->replot();

    QStringList txvb1list = QStringList()
            <<"-35"<<"-34"<<"-33"<<"-32"<<"-31"<<"-30"<<"-29"<<"-28"<<"-27"<<"-26"<<"-25"<<"-24"<<"-23"
            <<"-22"<<"-21"<<"-20"<<"-19"<<"-18"<<"-17"<<"-16"<<"-15"<<"-14"<<"-13"<<"-12"<<"-11"<<"-10"
            <<"-09"<<"-08"<<"-07"<<"-06"<<"-05"<<"-04";
    ui->tx_v1_cb->addItems(txvb1list);

    QStringList txv2list =QStringList()
            <<"00"<<"01"<<"02"<<"03"<<"04"<<"05"<<"06"<<"07"<<"08"
            <<"09"<<"10"<<"11"<<"12"<<"13"<<"14"<<"15"<<"16"<<"17"
            <<"18"<<"19"<<"20"<<"21"<<"22"<<"23"<<"24"<<"25";
    ui->tx_v2_cb->addItems(txv2list);

    QStringList rxv2list = QStringList()
            <<"00"<<"03"<<"06"<<"09"<<"12"<<"15"<<"18"<<"21"<<"24"<<"27"
            <<"30"<<"33"<<"36"<<"39"<<"42"<<"45"<<"48"<<"51"<<"54"<<"57"<<"60";
    ui->rx_v2_cb->addItems(rxv2list);


    ui->freq_rx->setMinimum(300);
    ui->freq_rx->setMaximum(3700);
    ui->freq_tx->setMinimum(300);
    ui->freq_tx->setMaximum(3700);
    ui->freq_rx->setValue(2417);
    ui->freq_tx->setValue(2417);

    ui->Rx_spinBox->setMinimum(300);
    ui->Rx_spinBox->setMaximum(3700);
    ui->Tx_spinBox->setMinimum(300);
    ui->Tx_spinBox->setMaximum(3700);
    ui->Rx_spinBox->setValue(2417);
    ui->Tx_spinBox->setValue(2417);


}
void Snow_sdr::initpation()
{

    FILE *init_path;
    init_path = fopen("/mnt/tone_16bit.dat","rb");
    QString filepath = "/mnt/tone_16bit.dat";
    if(init_path == NULL)
    {
        qDebug()<<"open failed";
        return;
    }
    QFile file(filepath);
    file_length = file.size();
    qDebug()<<"file_length"<<file_length;
    fread(dac_mem_addr , 1 , file_length ,init_path);
    fclose(init_path);

    ui->pathlb->setText(filepath);
    ui->x_ycb->setChecked(true);
    ui->Itimecb->setChecked(true);
    ui->qtcb->setChecked(true);

    dathread.start();
    sleep(1);
    osthread.start();


}
void Snow_sdr::Os_contrl()
{
    if(osthread.isRunning())
    {

        osthread.stop();
        ui->Os_bt->setText(tr("Rx_Start"));
    }
    else
    {
        conflag = false;
        flag = 1;

        osthread.start();
        ui->Os_bt->setText(tr("Rx_Stop"));
    }

}

void Snow_sdr::Dacontrl()
{
    if(dathread.isRunning())
    {
        dathread.stop();
        ui->dacontrbt->setText(tr("Tx_Start"));
    }
    else
    {
        dma_dac_stop = 0;
        dathread.start();
        ui->dacontrbt->setText(tr("Tx_Stop"));
    }
}
void Snow_sdr::Fileselect()
{
    FILE* filefd;
    ui->pathlb->setText(" ");
    path = QFileDialog::getOpenFileName(this,tr("Open Spreadsheet"), ".",tr("Spreadsheet files (*.*)"));
    if(path.length() == 0)
    {
        QMessageBox::information(NULL, tr("Path"), tr("You didn't select any files."));
    }
    else
    {
        QMessageBox::information(NULL, tr("Path"), tr("You selected ") + path);
        ui->pathlb->setText(path);
        filefd = fopen(path.toAscii().constData(),"rb");
        if(filefd == NULL)
        {
            qDebug()<<"open failed";
            return;
        }
        QFile file(path);
        file_length = file.size();
        qDebug()<<"file_length"<<file_length;
        fread(dac_mem_addr , 1 , file_length ,filefd);
        fclose(filefd);
    }
}
void Snow_sdr::closeEvent(QCloseEvent *event)
{
    osthread.stop();
    //osthread.terminate();
    osthread.wait();
    dathread.stop();
    dathread.wait();
    event->accept();
}
//void Snowsdr::plotcure(double *t_x, double *y_i, double *y_q, int c)

void Snow_sdr::plotcure()
{
    if(ui->Itimecb->isChecked())
    {
        time_i->setSamples(x_t, y_i, 512);
        ui->time_i_plot->replot();
    }
    else
    {
        time_i->setSamples(x_t, y_i ,0);
        ui->time_i_plot->replot();
    }
    if(ui->qtcb->isChecked())
    {
        time_q->setSamples(x_t, y_q, 512);
        ui->time_q_plot->replot();
    }
    else
    {
        time_q->setSamples(x_t,y_q,0);
        ui->time_q_plot->replot();
    }
    if(ui->x_ycb->isChecked())
    {
        x_y_c->setSamples(y_i , y_q ,512);
        ui->freq_q_plot->replot();
    }
    else
    {
        x_y_c->setSamples(y_i ,y_q,0);
        ui->freq_q_plot->replot();
    }
    flag = 1;
}

void Snow_sdr::Set_freq_value_Rx(int val)
{
    int v =val;
    unsigned int temp = (unsigned int)val;
    ui->Rx_spinBox->setValue(v);
    snowleo_sdr_set_freq(spi_fd , temp ,RF_RX_CHANNEL);

}

void Snow_sdr::Set_freq_value_Tx(int val)
{
    int v = val;
    unsigned int temp = (unsigned int)val;
    ui->Tx_spinBox->setValue(v);
    snowleo_sdr_set_freq(spi_fd , temp , RF_TX_CHANNEL);
}

void Snow_sdr::Set_vga_value_Rx()
{
    int t2;
    unsigned int temp;
    t2 = ui->rx_v2_cb->currentIndex();
    temp = (unsigned int)((t2)|0x0000d000);
    snowleo_sdr_set_vga(spi_fd , temp ,RF_RX_CHANNEL);
}

void Snow_sdr::Set_vga_value_Tx()
{
    int t1,t2;
    t1 = ui->tx_v1_cb->currentIndex();
    t2 = ui->tx_v2_cb->currentIndex();
    unsigned int temp;
    temp = (unsigned int)(((t2<<8)|t1)|0x0b000000);
    snowleo_sdr_set_vga(spi_fd , temp ,RF_TX_CHANNEL);
}
