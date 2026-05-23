#!/bin/bash

PLAYER_STATUS=$(playerctl status 2>/dev/null)
TRACK=$(playerctl metadata xesam:title 2>/dev/null)
ARTIST=$(playerctl metadata xesam:artist 2>/dev/null)

if [ -z "$PLAYER_STATUS" ]; then
    echo "No player"
    exit 0
fi

case "$PLAYER_STATUS" in
    Playing) ICON="" ;;
    Paused)  ICON="" ;;
    *)       ICON="" ;;
esac

INFO="$TRACK - $ARTIST"

if [ ${#INFO} -gt 40 ]; then
    INFO="${INFO:0:37}..."
fi

echo "$ICON $INFO"
