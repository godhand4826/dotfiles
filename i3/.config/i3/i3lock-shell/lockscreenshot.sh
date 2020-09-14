#!/bin/bash 
img="/tmp/i3lock.png"
icon="/home/eric/.config/i3/i3lock-shell/to_be_continued.png"
scrot $img
convert -noise 10% -sepia-tone 75% $img $img 
composite -gravity SouthEast $icon $img $img
i3lock -u -i $img -p win -e
