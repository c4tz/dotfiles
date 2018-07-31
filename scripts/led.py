import subprocess
import sys

if len(sys.argv) != 2:
    sys.exit('000')

blue = 0
if sys.argv[1] == 'red':
    red = 255
    green = 0
elif sys.argv[1] == 'green':
    red = 0
    green = 255
subprocess.call([
    'luxafor', 'color', '-l', '255',
    '-r',  str(red), '-g', str(green), '-b', '0'
])
print('%02x%02x%02x' % (red, green, blue))