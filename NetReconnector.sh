#!/bin/bash
# by nickwang

Debug=false
NetCard=wlan0
Router=192.168.1.1
LogFile=~/NetReconnector.log

test -e $LogFile || touch $LogFile

time=$(date "+%Y/%m/%d %H:%M:%S")

ret=$(ping -c 2 -W 1 -I $NetCard $Router | grep 'received' | cut -d ',' -f 2 | cut -d ' ' -f 2)

if [ "$ret" == "0" ]; then
    sudo ifdown wlan0 && sudo ifup wlan0
    echo "Try Reconnect: $?, $time" | tee -a $LogFile
else
    if [ "$Debug" == "true" ]; then
        echo "Network is ok, ret = $ret, $time" | tee -a $LogFile
    fi
fi

exit 0

