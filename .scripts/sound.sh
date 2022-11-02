#!/bin/bash

if [ $1 = "headset" ]; then
    device="alsa_output.usb-Creative_Technology_Ltd_Sound_Blaster_Tactic_3D__Alpha_00069161-00.analog-stereo"
fi

if [ $1 = "bluetooth" ]; then
    device="bluez_output.00_1B_66_23_E8_EB.a2dp-sink"
fi

if [ $1 = "speakers" ]; then
    device="alsa_output.usb-GeneralPlus_USB_Audio_Device-00.analog-stereo"
fi

pactl set-default-sink $device >/dev/null 2>&1

for playing in $(pactl list sink-inputs | grep "Sink Input #" | sed "s/.*#//")
do
    pactl move-sink-input $playing $device >/dev/null 2>&1
done
