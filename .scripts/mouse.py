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

# hardcoded because there is no queryable max value
percent = round(mv / 4211 * 100)

print(f"{percent}%")
