#include "plot_grid.h"
#include <qwt_math.h>
#include <qpainter.h>
#include <qwt_painter.h>
#include <QPen>
#include <qpen.h>
#include <QDebug>
Plot_grid::Plot_grid()
{
    m_pen.setBrush(QColor(102,102,102));
    m_pen.setStyle(Qt::DotLine);
}
Plot_grid::~Plot_grid()
{}
void Plot_grid::draw(QPainter *painter, const QwtScaleMap &xMap, const QwtScaleMap &yMap, const QRectF &canvasRect) const
{
    Q_UNUSED (xMap);
    Q_UNUSED (yMap);

    int l = canvasRect.left() + 1;//1
    int r = canvasRect.right() - 4;
    int b = canvasRect.bottom() - 4;
    int t = canvasRect.top() + 1;//1

    painter->setPen(m_pen);

    QwtPainter::drawRect(painter, l, t, r, b);

    double pos = l;
    double step = r/12;
    for(int i=0; i<11; i++) {
        pos += step;
        QwtPainter::drawLine( painter, qRound(pos), t, qRound(pos), b+1 );
    }
    pos = t+2;
    step = b/10;
    for(int i=0; i<9; i++) {
        pos += step;
        QwtPainter::drawLine( painter, l, qRound(pos), r+1, qRound(pos) );
    }
}
