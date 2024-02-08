#!/usr/bin/env bash

video_quality="$1"
video_link="$2"
video_name="${@:3}"
video_name_no_space=$(echo $video_name | tr " " "-")
video_name_lower=$(echo $video_name_no_space | tr "[:upper:]" "[:lower:]")


if [[ -z "$1" ]]; then
    echo "first argument is for video quality(use bv for better video quality)"
    echo "second argument is for video link"
    echo "last arguments for video name"
else
    yt-dlp -f "$video_quality+ba" --merge-output-format mp4 "$video_link" -o "$video_name_lower"
fi
