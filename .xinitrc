#!/bin/sh

redshift -PO 4000
feh --no-fehbg --bg-fill $HOME/projects/dotfiles/wallpapers/leafy-moon.png

xcompmgr -n &
slstatus &
st -e tmux &
qutebrowser --restore default &

exec dwm
