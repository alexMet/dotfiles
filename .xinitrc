#!/bin/sh

xinitdir="/etc/X11/xinit"
userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

# merge in defaults and keymaps

if [ -f "$sysresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        xrdb -merge "$sysresources"
    else
        xrdb -nocpp -merge "$sysresources"
    fi
fi

if [ -f "$sysmodmap" ]; then
    xmodmap "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        xrdb -merge "$userresources"
    else
        xrdb -nocpp -merge "$userresources"
    fi
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
    for f in "$xinitdir/xinitrc.d"/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

setxkbmap -layout us,gr -option 'grp:win_space_toggle'
brightnessctl -q s 30%
redshift -PO 3000
feh --no-fehbg --bg-fill $HOME/projects/dotfiles/wallpapers/leafy-moon.png

xcompmgr -n &
slstatus &
st -e tmux &
brave &

exec dwm
