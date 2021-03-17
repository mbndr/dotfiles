[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ] && . ~/.xprofile

setxkbmap -layout de &
xset r rate 300 50
xinput set-prop "Synaptics tm2964-001" "libinput Tapping Enabled" 1

sxhkd & 			# Shortcuts
topbar-start &		# Start topbar
dunst &

exec ~/.scripts/startdwm
