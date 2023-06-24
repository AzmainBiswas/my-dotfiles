#!/usr/bin/env bash

nm-applet --indicator &
# crow &
# syncthingtray --wait &
XDG_CURRENT_DESKTOP=gnome telegram-desktop &
blueman-applet &
xfce4-power-manager &
dunst &
dunstify "hello $(whoami) wellcome" &
