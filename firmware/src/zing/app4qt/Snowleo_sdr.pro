#-------------------------------------------------
#
# Project created by QtCreator 2014-06-10T16:00:50
#
#-------------------------------------------------

QT       += core gui

TARGET = Snowleo_sdr
TEMPLATE = app


SOURCES += main.cpp\
        snow_sdr.cpp \
    plot_grid.cpp \
    drawploat.cpp \
    dathread.cpp \
    osthread.cpp

HEADERS  += snow_sdr.h \
    snowleo_hw.h \
    plot_grid.h \
    drawploat.h \
    dathread.h \
    osthread.h

LIBS  += -L "/home/david/Qt_INSTALL/lib/" -lqwt
LIBS  += -L ./libsnowleosdr.so

INCLUDEPATH += /home/david/Qt_INSTALL/include/
FORMS    += snow_sdr.ui

RESOURCES += \
    images.qrc
