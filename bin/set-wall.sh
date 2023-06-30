#!/bin/bash

mv "$1" $HOME/.config/wall.png
killall swaybg 
swaybg -m fill -i $HOME/.config/wall.png &
