# Desktop environment or window manager to start
dewm=dwm

# Default settings
xset r rate 300 50
xinput set-prop "Synaptics tm2964-001" "libinput Tapping Enabled" 1
setxkbmap -layout de &

# Choose wm / de
case "$dewm" in
    mate)
        # TODO: some mate settings have to be made (and saved somewhere)
        # This is how de/wm can be changed "dynamically"
        exec mate-session
        ;;
    *) # default is dwm
        [ -f /etc/xprofile ] && . /etc/xprofile
        [ -f ~/.xprofile ] && . ~/.xprofile

        sxhkd & 			# Shortcuts
        topbar-start &		# Start topbar
        dunst &             # Notifications

        exec ~/.scripts/startdwm
        ;;

esac
