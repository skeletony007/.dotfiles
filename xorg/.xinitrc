#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb ~/.Xresources

# WARNING: This command grants any local user (sudo) access to your X screen
# <https://wiki.archlinux.org/title/Xhost>
xhost +SI:localuser:$USER &

gnome-keyring-daemon --start --components=secrets &
pipewire &
wireplumber &
exec i3
