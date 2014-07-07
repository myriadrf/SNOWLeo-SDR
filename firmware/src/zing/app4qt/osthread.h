#ifndef OSTHREAD_H
#define OSTHREAD_H

#include <QThread>
#include <QDebug>

extern "C"
{
#include "snowleo_hw.h"
}

#define DATASIZE 512
#define LENGTH_MAX 4088

class Osthread : public QThread
{
    Q_OBJECT
public:
    explicit Osthread(QObject *parent = 0);
    void run();
    void stop();
    void setSamples(unsigned char *);
    unsigned char buffer[16000];
    
signals:
    void paintsignal();
public slots:
    
};

#endif // OSTHREAD_H
