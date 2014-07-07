#include "drawploat.h"
volatile int singleflag;
volatile int doubleflag;
extern volatile int flag;
double  temp1[512];
double  ctemp1[512];
double  xsamp[512];
volatile int showflag;
int hfd[2];
int lfd[2];

Drawploat::Drawploat(QWidget *parent) :
    QwtPlot(parent)
{
    setAutoReplot(false);
    m_grid = new Plot_grid();
    m_grid->attach(this);
    QwtLegend *legend = new QwtLegend();
    legend->setItemMode(QwtLegend::CheckableItem);

    canvas()->setLineWidth(1);
    canvas()->setFrameStyle(QFrame::Box | QFrame::Plain);
    canvas()->setBorderRadius(15);
    QPalette canvasPalette(Qt::black);
    canvasPalette.setColor(QPalette::Foreground,QColor(165, 193, 228));
    canvas()->setPalette(canvasPalette);

    setAxisTitle(xBottom, "时间轴");
    setAxisScale(xBottom, 0, 512);
    QwtScaleWidget *scaleWidget = axisWidget(xBottom);
    const int fmh = QFontMetrics(scaleWidget->font()).height();
    scaleWidget->setMinBorderDist(0, fmh/2);

    setAxisTitle(yLeft, "电压");
    setAxisScale(yLeft, -35000, 35000);



    QwtPlotZoomer *zoomer = new QwtPlotZoomer(canvas());
    zoomer->setRubberBandPen(QColor(Qt::white));
    zoomer->setTrackerPen(QColor(Qt::white));
    zoomer->setMousePattern(QwtEventPattern::MouseSelect2 , Qt::RightButton , Qt::ControlModifier );
    zoomer->setMousePattern(QwtEventPattern::MouseSelect3 , Qt::RightButton);

    QwtPlotMarker *my = new QwtPlotMarker();
    my->setLabel(QString::fromLatin1("y=0"));
    my->setLabelAlignment(Qt::AlignRight|Qt::AlignTop);
    my->setLineStyle(QwtPlotMarker::HLine);
    my->setLinePen(QPen(Qt::green, 1,Qt::DotLine));
    my->setYValue(0.0);
    my->attach(this);
    enableAxis(QwtPlot::xBottom, false);
    enableAxis(QwtPlot::yLeft, false);

}
