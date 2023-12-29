#!/usr/bin/env bash

FIND="fd"
# FIND="fdfind"
SCRIPTFOLDER="$HOME/bin"
DMENU="dmenu -F -i -l 10 -p"
ROFI="rofi -dmenu -i -p"
FZF='fzf --height 70% --border rounded --reverse --prompt'

main() {
    script=$($FIND . $SCRIPTFOLDER -t x | $MENU "Script Launcher > ")
    if [ "script" == "" ] || [ "script" == " " ]
    then
        exit
    fi
    exec $script
}

MENU=$ROFI
main
