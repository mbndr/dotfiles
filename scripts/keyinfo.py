#!/usr/bin/env python3
#
# Short script to parse the sxhkd keybindings in a nicer (colored and indented) form

import os

# Config file path
config = "~/.config/sxhkd/sxhkdrc"
config = os.path.expanduser(config)

def cprint(c, s):
	print("\x1b[0;"+str(c)+"m"+s+"\x1b[0m")

# Check if file exists
if not os.path.exists(config):
	print("Config file not found: " + config)
	exit(1)

cprint(34, "Configuration of " + config + "\n")

# Get content
with open(config) as f:
    content = f.readlines()
content = [x.strip() for x in content]

# Tells if next element is a combination
next_is_comb = False

# Loops over content
for l in content:
	# Empty line
	if len(l) < 1:
		print()
		continue
	# Comment
	if l[0] == "#":
		cprint(32, l[2:])
		next_is_comb = True
		continue
	# Combination
	if next_is_comb:
		print(l)
		next_is_comb = False

