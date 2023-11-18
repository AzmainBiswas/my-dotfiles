#!/usr/bin/env bash

nm-applet --indicator &
# crow &
# syncthingtray --wait &
blueman-applet &
xfce4-power-manager &
# dunst &
swaync &
mswayncpd &
# clipmenud &
wl-clipboard-history -t &
# copyq &
kdeconnect-indicator &
xrdb -load .Xresources &
foot --server &
dunstify "hello $(whoami) wellcome" &
/usr/bin/emacs --daemon &
