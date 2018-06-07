#!/usr/bin/env python3
# Show the quote of the day from https://quotes.rest
import urllib.request
import json

center_width = 100

def cprint(c, s):
	print("\x1b[0;"+str(c)+"m"+s+"\x1b[0m")

try:

    with urllib.request.urlopen("https://quotes.rest/qod") as url:
        data = json.loads(url.read().decode())
    
        if data["success"]["total"] > 0:
            quote = data["contents"]["quotes"][0]["quote"]
            author = "- " + data["contents"]["quotes"][0]["author"] + " -"
            cprint(32, quote.center(center_width))
            print(author.center(center_width))
        else:
            cprint(31, "Cannot get quote of the day")

except:
    cprint(31, "Cannot get quote of the day")