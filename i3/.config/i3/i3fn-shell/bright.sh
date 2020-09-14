#!/bin/sh
step="6000"
val=$(cat /sys/class/backlight/intel_backlight/brightness)
if [ "$1" = "+" ] ; then
  val=`expr $val + $step`
elif [ "$1" = "-" ] && [ $val -gt 24000 ] ; then
  val=`expr $val - $step`
fi
notify-send $(echo $val | sudo tee /sys/class/backlight/intel_backlight/brightness)
val=$(cat /sys/class/backlight/intel_backlight/brightness)
notify-send $(($val*100/120000))
