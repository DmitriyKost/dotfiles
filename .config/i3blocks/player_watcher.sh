#!/bin/bash

playerctl --follow metadata --format '{{status}} {{title}}' | while read -r _; do
    pkill -RTMIN+10 i3blocks
done
