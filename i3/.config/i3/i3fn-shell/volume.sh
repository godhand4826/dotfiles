#!/bin/bash
step="5"
volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,');
if [ -z "$1" ] ; then
	pactl set-sink-mute 0 toggle;
elif [ "$1" = "+" ] && [ $volume -lt 150 ] ; then
	pactl set-sink-volume 0 +"$step"%;
elif [ "$1" = "-" ] && [ $volume -gt 0 ] ; then
	pactl set-sink-volume 0 -"$step"%;
fi
mute=$(pactl list sinks | grep -o "Mute: no");
volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,');
if [ -z "$mute" ] ; then
	volume="$volume (muted)"
fi
notify-send -t 500 "$volume"
