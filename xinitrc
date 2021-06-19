#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
[[ -f ~/.config/Xmodmap ]] && xmodmap ~/.config/Xmodmap

# Start background apps

wal -i ~/Pictures/wallpapers/ &
(cd ~/Projects/wm/dwm ; sudo make clean install) &
(cd ~/Projects/wm/dmenu ; sudo make clean install) &
slstatus &
picom &
syncthing -no-browser &
server_linux_no_tray_debug &

pidof -s openrc &&
    ! pidof -s pluseaudio >/dev/null 2>&1 &&
    setsid -f pulseaudio --start --exit-idle-time=-1 >/dev/null 2>&1

# Start dwm
exec dwm
