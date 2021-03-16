export EDITOR="nvim"
export TERMINAL="st"
#TODO: see other in luke smiths video

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start graphical interface when first tty
if [ "$(tty)" = "/dev/tty1"  ]; then
	pgrep -x dwm || exec startx
fi
