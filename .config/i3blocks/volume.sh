#!/bin/bash

SINK=$(pactl info | awk -F': ' '/Default Sink/ {print $2}')

VOLUME=$(pactl get-sink-volume "$SINK" | awk '{print $5}' | head -n1)

printf "Vol: %3s\n" "$VOLUME"
