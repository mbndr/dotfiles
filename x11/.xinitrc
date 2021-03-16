[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

setxkbmap -layout de &
xset r rate 300 50

sxhkd & 			# Shortcuts
topbar-start &		# Start topbar
dunst &

exec ~/.scripts/startdwm
