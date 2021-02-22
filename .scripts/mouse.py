import re
from subprocess import PIPE, STDOUT, Popen

result = Popen(
    ["solaar", "show", "2672572D"],
    stdin=PIPE,
    stdout=PIPE,
    stderr=STDOUT,
    close_fds=True,
).stdout.read()

mv = int(re.search(r"(Battery: )([0-9]+)(mV)", result.decode()).group(2))

# hardcoded because there is no queryable min/max value
min, max = 3500, 4211
percent = round((mv - min) / (max - min) * 100)

print(f"{percent}%")
