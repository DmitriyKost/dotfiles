#!/usr/bin/env bash
# Outputs JSON: {"text":"<icon> NNN%","class":"on|muted"}.
# Icon picks vol-low / mid / high based on level.

mute=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | awk '{print $2}')

if [ "$mute" = "yes" ]; then
    text=$(printf '%s %4s' "󰝟" "OFF")
    jq -cn --arg text "$text" '{text: $text, class: "muted"}'
    exit 0
fi

vol=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | awk 'NR==1 {print $5}')
num=${vol%\%}
num=${num:-0}

if   [ "$num" -ge 67 ]; then icon="󰕾"
elif [ "$num" -ge 34 ]; then icon="󰖀"
else                         icon="󰕿"
fi

text=$(printf '%s %4s' "$icon" "${vol:-?}")
jq -cn --arg text "$text" '{text: $text, class: "on"}'
