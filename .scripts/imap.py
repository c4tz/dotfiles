import json
import os
import sys
from imaplib import IMAP4, IMAP4_SSL

# Example account file:
# [
#     {
#         "host": "imap.example.com",
#         "port": 993,
#         "login": "me@example.com",
#         "password": "1234"
#     }
# ]

acc_file = os.path.join(os.path.expanduser("~"), ".imap.json")
with open(acc_file, "r") as f:
    accounts = json.load(f)

unreads = 0

for account in accounts:
    try:
        if account["port"] == 143:
            obj = IMAP4(account["host"], account["port"])
            obj.starttls()
        else:
            obj = IMAP4_SSL(account["host"], account["port"])
        obj.login(account["login"], account["password"])
        obj.select()
        unreads += len(obj.search(None, "unseen")[1][0].split())
    except (OSError, IMAP4.error):
        sys.exit("Could not fetch unread mails from " + account["host"])

if unreads:
    print("%{F#b94646}%{F-} " + str(unreads))
else:
    print("%{F#666}%{F-}")
