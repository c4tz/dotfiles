#!/bin/bash

if [ $1 = "headset" ]; then
    device="alsa_output.usb-Creative_Technology_Ltd_Sound_Blaster_Tactic_3D__Alpha_00069161-00.analog-stereo"
fi

if [ $1 = "bluetooth" ]; then
    device="bluez_output.00_1B_66_23_E8_EB.a2dp-sink"
fi

if [ $1 = "speakers" ]; then
    if [[ $(hostname) == 'pc' ]]; then
        pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:analog-surround-21+input:analog-stereo
        device="alsa_output.pci-0000_2d_00.4.analog-surround-21"
    fi
    if [[ $(hostname) == 'laptop' ]]; then
        device="alsa_output.usb-Lenovo_ThinkPad_USB-C_Dock_Gen2_USB_Audio_000000000000-00.analog-stereo"
    fi
fi

pactl set-default-sink $device >/dev/null 2>&1

for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
do
    pactl move-sink-input $playing $device >/dev/null 2>&1
done
