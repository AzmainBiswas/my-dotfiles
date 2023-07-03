#!/usr/bin/env bash

nm-applet &
dunst &
emacs --daemon &
# xfce3-power-manager &
mpd &
clipmenud &
numlockx & 
dunstify "hello $(whoami) wellcome" &
