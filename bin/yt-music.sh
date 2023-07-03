#!/usr/bin/env bash

YT_CLINT="https://vid.puffyan.us"

quary_usr=$(rofi -dmenu -p "YT Quary" | tr ' ' '+')
quary=$(echo "song+audio+${quary_usr}")
video_id=$(curl -s "https://vid.puffyan.us/search?q=${quary}" | rg -o "watch\?v=.{11}" | head -n 1)
video_url="https://www.youtube.com/${video_id}"
audio_url=$(yt-dlp -f ba --get-url ${video_url})

mpc stop
mpc clear
mpc add ${audio_url}
mpc play

# notification
title=$(yt-dlp --get-title ${video_url})
notify-send "playing: " "${title}"
