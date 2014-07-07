#ifndef PLOT_GRID_H
#define PLOT_GRID_H

#include <qwt_global.h>
#include <qwt_plot_item.h>
#include <qwt_scale_div.h>
#include <QPen>

class QPainter;
class QPen;

class Plot_grid : public QwtPlotItem
{
public:
    Plot_grid();
    virtual ~Plot_grid();

    virtual void draw( QPainter *p,
                       const QwtScaleMap &xMap, const QwtScaleMap &yMap,
                       const QRectF &rect ) const;

private:
    QPen m_pen;
};

#endif // PLOT_GRID_H
