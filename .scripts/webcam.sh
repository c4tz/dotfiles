#!/bin/bash

device="/dev/v4l/by-id/usb-Elgato_Elgato_Facecam_MK.2_A6HTB34210GWBJ-video-index0"

if [ $1 = "gain" ]; then
    current_gain=$(v4l2-ctl -d $device -C gain | grep -o '[0-9]\+')
    new_gain=$current_gain
    if [ $2 = "increase" ]; then
        new_gain=$(($current_gain + 1))
        if (( $new_gain > 88 )); then
            new_gain=88
        fi
    elif [ $2 = "decrease" ]; then
        new_gain=$(($current_gain - 1))
        if (( $new_gain < 0 )); then
            new_gain=0
        fi
    fi
    v4l2-ctl -d $device -c gain=$new_gain
elif [ $1 = "default" ]; then
    v4l2-ctl \
        -d $device \
        -c zoom_absolute=150,auto_exposure=1,gain=14,white_balance_automatic=0
fi
