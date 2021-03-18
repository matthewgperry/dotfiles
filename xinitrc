#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Start background apps

pulseaudio --daemonize &
wal -i ~/Pictures/wallpapers/ &
(cd ~/Projects/wm/dwm ; sudo make clean install) &
# feh --bg-scale ~/Pictures/wallpaper.jpg &
slstatus &
picom &

# Start dwm
exec dwm
