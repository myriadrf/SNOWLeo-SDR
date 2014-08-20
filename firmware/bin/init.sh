#!/bin/sh
route add -host 255.255.255.255 dev eth0
route add -net 224.0.2.15 netmask 255.255.255.0 dev eth0
echo "Starting Zing axi-dma Application..."

cp /mnt/libsnowleosdr.so /lib

TRD_LIB=/usr/local/lib/zynq_qt_install

if [ ! -d ${TRD_LIB} ]
then
  mkdir -p ${TRD_LIB} 
fi

if [ ! -d ${TRD_LIB}/lib ]
then
  mount /mnt/qt_lib.img ${TRD_LIB} -r -o loop
fi

export LD_LIBRARY_PATH=${TRD_LIB}/lib
export QT_QWS_FONTDIR=${TRD_LIB}/lib/fonts

#cd /mnt/wifitool
#./setup.sh

cd /mnt/
./Snowleo_vst -qws &



