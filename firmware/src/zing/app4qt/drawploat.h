#ifndef DRAWPLOAT_H
#define DRAWPLOAT_H

#include <qwt_plot.h>
#include "plot_grid.h"
#include <qwt_plot_zoomer.h>
#include <qwt_plot_layout.h>
#include <qwt_plot_curve.h>
#include <qwt_scale_widget.h>
#include <qwt_legend.h>
#include <qwt_legend_item.h>
#include <qwt_plot_marker.h>
#include <QApplication>

extern "C"
{
#include<stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#include <errno.h>
#include <sched.h>
}
#define YSIZEMIN -25000
#define YSIZEMAX  25000

class QwtPlotCurve;
class Drawploat : public QwtPlot
{
    Q_OBJECT
public:
    Drawploat(QWidget * = 0);
    Plot_grid *m_grid;
    
signals:
    
};

#endif // DRAWPLOAT_H
