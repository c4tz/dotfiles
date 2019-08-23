# mostly copied from https://github.com/madnight/dotfiles/blob/master/scripts/lock.py

import subprocess
import os
import mss
import socket
import sys

from PIL import Image

radius = 127 if socket.gethostname() == "pc" else 123

with mss.mss() as sct:
    # take screenshot
    sct_img = sct.grab(sct.monitors[0])
    img = Image.frombytes('RGB', sct_img.size, sct_img.bgra, 'raw', 'BGRX')

    # pixelate
    imgSmall = img.resize(
        (int(img.size[0] / 10), int(img.size[1] / 10)), resample=Image.BILINEAR
    )

    result = imgSmall.resize(img.size, Image.NEAREST)
    icon = Image.open(sys.argv[1])

    # calc lock icon position on primary display
    primary = sct.monitors[1]
    area = (
        int(((primary['width'] / 2) + primary['left']) - icon.size[0] / 2),
        int(((primary['height'] / 2) + primary['top']) - icon.size[1] / 2),
    )

# add lock icon to bg image
result.paste(icon, area, icon)

subprocess.run(
    [
        'i3lock',
        '--raw',
        str(result.width) + 'x' + str(result.height) + ':rgb',
        '-i',
        '/dev/stdin',
        '--insidevercolor=#ffffff00',
        '--ringvercolor=#0000bb00',
        '--insidewrongcolor=#CF42C100',
        '--ringwrongcolor=#b94646aa',
        '--insidecolor=#eeeeee00',
        '--ringcolor=#46b995aa',
        '--linecolor=#319576aa',
        '--separatorcolor=#ffffff00',
        '--verifcolor=#ffffffaa',
        '--wrongcolor=#b9466000',
        '--timecolor=#ee00e0ee',
        '--datecolor=#ee00e0ee',
        '--layoutcolor=#000000ff',
        '--keyhlcolor=#23c2c6aa',
        '--bshlcolor=#23c2c6aa',
        '--ring-width=10',
        '--screen=1',
        '--radius=' + str(radius),
        '--veriftext=""',
        '--wrongtext=""',
        '--noinputtext=""',
        '--locktext=""',
        '--lockfailedtext=""',
    ],
    stdout=subprocess.PIPE,
    input=result.tobytes(),
)
