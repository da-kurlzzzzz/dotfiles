#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
# end of default stuff

# hate to force the touchpad
xinput set-prop "Elan Touchpad" "libinput Tapping Enabled" 1

# Caps Lock is useless
setxkbmap -option caps:escape

# Keyboard layouts
setxkbmap -layout us,ru
setxkbmap -option grp:shifts_toggle

# automounting
udiskie &

# turn on my adapter
bluetoothctl power on &

# happy ending
exec i3
