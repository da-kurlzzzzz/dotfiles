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

TOUCHPAD="$(xinput --list | grep -i touchpad | sed 's/.*id=\([[:digit:]]*\).*/\1/')"

# hate to force the touchpad
xinput set-prop "$TOUCHPAD" "libinput Tapping Enabled" 1

# reverse scroll direction to usual
xinput set-prop "$TOUCHPAD" "libinput Natural Scrolling Enabled" 1

# Caps Lock is useless
# setxkbmap -option caps:escape
# Keyboard layouts
# setxkbmap -layout us,ru
# setxkbmap -option grp:shifts_toggle
# setxkbmap -option grp_led:caps
# I am very angry so I'll leave it here:
# /etc/X11/xorg.conf.d/00-keyboard.conf
# Section "InputClass"
# Identifier "system-keyboard"
# MatchIsKeyboard "on"
# Option "XkbLayout" "us,ru"
# Option "XkbOptions" "grp:shifts_toggle,grp_led:caps,caps:escape"
# EndSection

# automounting
udiskie &

# turn on my adapter
bluetoothctl power on &

# screen must be on
xset s off -dpms &

# strange bell is now off
xset -b

# hide cursor when it is not needed
unclutter &

# happy ending
exec i3
