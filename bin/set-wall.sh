#!/bin/bash

cp -f "$1" $HOME/.config/background
killall swaybg 
swaybg -m fill -i $HOME/.config/background &
