#!/bin/bash

if [ $1 = "headset" ]; then
    device="alsa_output.usb-Creative_Technology_Ltd_Sound_Blaster_Tactic_3D__Alpha_00069161-00.analog-stereo"
fi

if [ $1 = "speakers" ]; then
    pacmd set-card-profile 2 output:analog-surround-21+input:analog-stereo
    device="alsa_output.pci-0000_00_1f.3.analog-surround-21"
fi

pacmd set-default-sink $device >/dev/null 2>&1

for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
do
    pacmd move-sink-input $playing $device >/dev/null 2>&1
done
