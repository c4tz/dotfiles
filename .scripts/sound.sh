#!/bin/bash

if [ $1 = "headset" ]; then
	device="alsa_output.usb-Logitech_Logitech_G930_Headset-00.analog-stereo"
fi

if [ $1 = "speakers" ]; then
	device="alsa_output.pci-0000_00_1f.3.analog-surround-21"
fi

pacmd set-default-sink $device >/dev/null 2>&1

for playing in $(pacmd list-sink-inputs | awk '$1 == "index:" {print $2}')
do
	pacmd move-sink-input $playing $device >/dev/null 2>&1
done
