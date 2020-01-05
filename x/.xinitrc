[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
#exec openbox-session

export XDG_SESSION_TYPE='X11'

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#exec startxfce4
exec mate-session

