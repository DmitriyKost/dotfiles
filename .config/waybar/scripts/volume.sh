#!/usr/bin/env bash
# Default sink volume, or "OFF" when muted. Always 8 chars: "Vol:NNN%".

mute=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}')

if [ "$mute" = "yes" ]; then
    printf "Vol: OFF\n"
else
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | awk 'NR==1 {print $5}')
    printf "Vol:%4s\n" "${vol:-?}"
fi
