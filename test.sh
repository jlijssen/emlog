#!/bin/bash
echo ---- making emlog and nbcat
make
make nbcat
echo ---- inserting module
insmod emlog.ko
cat /proc/devices | grep emlog
ls -la -tr /sys/class/emlog
echo ---- testing module
mknod /tmp/testlog c 247 8
chmod a+w /tmp/testlog
echo "testing testlog."$RANDOM > /tmp/testlog
./nbcat /tmp/testlog
rm /tmp/testlog
echo ---- removing module
rmmod emlog
echo ---- dmesg out
dmesg | tail
