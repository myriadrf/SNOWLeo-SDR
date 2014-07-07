#ifndef SNOW_SDR_H
#define SNOW_SDR_H

#include <QMainWindow>
#include <QDesktopWidget>
#include <QCloseEvent>
#include <qwt_plot_curve.h>
#include <QFileDialog>
#include <QMessageBox>
#include <QString>
#include <QDebug>

#include "osthread.h"
#include "drawploat.h"
#include "dathread.h"

extern "C"
{
#include <sys/mman.h>
#include "snowleo_hw.h"
}

namespace Ui {
class Snow_sdr;
}

class Snow_sdr : public QMainWindow
{
    Q_OBJECT
    
public:
    explicit Snow_sdr(QWidget *parent = 0);
    ~Snow_sdr();
    
private:
    Ui::Snow_sdr *ui;
    Osthread osthread;
    Dathread dathread;
    QwtPlotCurve *time_i;
    QwtPlotCurve *time_q;
    QwtPlotCurve *freq_i;
    QwtPlotCurve *freq_q;
    QwtPlotCurve *x_y_c;
    QString path;

    void initpation();
    void init_ui();
public slots:
    void Os_contrl();
    void Dacontrl();
    void closeEvent(QCloseEvent *event);
    void plotcure();
    void Fileselect();
    void Set_freq_value_Rx(int);
    void Set_freq_value_Tx(int);
    void Set_vga_value_Rx();
    void Set_vga_value_Tx();
};

#endif // SNOW_SDR_H
