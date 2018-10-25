#! /bin/bash

autoconf 
make clean
if [ "$1" != arm ] ; then
	echo "build for x86"
	./configure
else
	echo "build for arm/miner"
	CC=arm-linux-gnueabihf-gcc ./configure --prefix=/home/yang/install-ssh/ --host x86_64-pc-linux-gnu --disable-zlib --disable-syslog --disable-loginfunc --enable-static
fi

make PROGRAMS="dbclient scp" MULTI=1 SCPPROGRESS=1
#make PROGRAMS="dbclient scp" MULTI=1 SCPPROGRESS=1 install
