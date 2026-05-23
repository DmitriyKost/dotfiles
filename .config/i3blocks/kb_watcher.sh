#!/usr/bin/env bash

while true; do
    xkb-switch -W 2>>~/.cache/xkb-watch.err | while IFS= read -r layout; do
        pkill -RTMIN+11 i3blocks || true
    done

    echo "$(date '+%F %T') xkb-switch -W exited, restarting..." >> ~/.cache/xkb-watch.err
    sleep 1
done
