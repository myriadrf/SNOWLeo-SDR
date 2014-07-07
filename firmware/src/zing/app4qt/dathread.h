#ifndef DATHREAD_H
#define DATHREAD_H

#include <QThread>
#include <QDebug>

extern "C"
{
#include "snowleo_hw.h"
}

#define BUFFER_MAX_SIZE 2*1024*1024

class Dathread : public QThread
{
    Q_OBJECT
public:
    explicit Dathread(QObject *parent = 0);
    void run();
    void stop();
    
signals:
    
public slots:


    
};

#endif // DATHREAD_H
