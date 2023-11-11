#!/usr/bin/env bash

# Send a notification if the laptop battery is either low 
# or is fully charged.
#
FULL_lAVEL=97
WARNING_LEVEL=30
BATTERY_DISCHARGING=$(acpi -b | rg "Battery 0" | rg --count "Discharging")
BATTERY_LEVEL=$(acpi -b | rg "Battery 0" | rg -P --only-matching '[0-9]+(?=%)')

if [ "$BATTERY_LEVEL" -le "$WARNING_LEVEL" ] && [ "$BATTERY_DISCHARGING" -eq 1 ]
then
    notify-send "Low Battery" "{$BATTERY_LEVEL}% of battery remaining" -u critical
elif [ "$BATTERY_LEVEL" -gt "$FULL_lAVEL" ] && [ "$BATTERY_DISCHARGING" -eq 0 ]
then
    notify-send "Battery Charged" "Battery is fully charged." 
fi
