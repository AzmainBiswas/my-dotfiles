#!/usr/bin/env bash

nm-applet --indicator &
# crow &
# syncthingtray --wait &
XDG_CURRENT_DESKTOP=gnome telegram-desktop &
blueman-applet &
xfce4-power-manager &
dunst &
mpd &
clipmenud &
# copyq &
kdeconnect-indicator &
xrdb -load .Xresources &
foot --server &
dunstify "hello $(whoami) wellcome" &
/usr/bin/emacs --daemon &
