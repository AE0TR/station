#!/bin/sh

DEV_NUM=$(rtl_device $DEVICE_SN)

if [ "$MODE" = "stream" ]; then
    rtl_adsb -d $DEV_NUM | socat -u - TCP-LISTEN:$DEVICE_SN,fork
elif [ "$MODE" = "publish" ]; then
     rtl_adsb -d $DEV_NUM | mosquitto_pub -l -L $MQ_URL
else
    echo "set MODE=stream | publish"
fi

