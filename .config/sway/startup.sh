#!/usr/bin/env bash

nm-applet --indicator &
# crow &
# syncthingtray --wait &
blueman-applet &
xfce4-power-manager &
# dunst &
swaync &
mpd &
lxpolkit &
kdeconnect-indicator &
wl-paste --watch cliphist store &
xrdb -load .Xresources &
foot --server &
notify-send -i "/mnt/media/photos/Takeout/Google Photos/Photos from 2023/IMG-20230904-WA0010.jpg" "HELLO" "$(whoami) wellcome" &
# /usr/bin/emacs --daemon &
