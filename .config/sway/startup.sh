#!/usr/bin/env bash

nm-applet --indicator &
# crow &
# syncthingtray --wait &
/usr/bin/emacs --daemon &
XDG_CURRENT_DESKTOP=gnome telegram-desktop &
blueman-applet &
xfce4-power-manager &
dunst &
mpd &
clipmenud &
# copyq &
foot --server
dunstify "hello $(whoami) wellcome" &
