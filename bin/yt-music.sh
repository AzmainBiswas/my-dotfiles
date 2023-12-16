#!/usr/bin/env bash

quary_usr=$(printf "" | dmenu -i -F -p "yt-music: ")

if [ "$quary_usr" = "" ]
then
    exit
fi

quary=$(echo "${quary_usr} original song audio")
audio_url=$(yt-dlp -f ba --get-url "ytsearch:${quary}" )
thumbnal_url=$(yt-dlp --get-thumbnail "ytsearch:${quary}")

wget -c ${thumbnal_url} -O /home/azmain/.local/.temp/thumbnal.png

mpc stop
mpc clear
mpc add ${audio_url}
mpc play
mpc repeat

# notification
notify-send -i /home/azmain/.local/.temp/thumbnal.png "Playing:  ${quary_usr}"
rm /home/azmain/.local/.temp/thumbnal.png
