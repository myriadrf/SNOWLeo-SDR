#include <QtGui/QApplication>
#include "snow_sdr.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    Snow_sdr w;
    w.setWindowTitle("SNOWLeo VST");
    w.show();
    
    return a.exec();
}
