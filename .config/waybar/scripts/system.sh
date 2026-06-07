#!/usr/bin/env bash
# CPU% (rolling delta) + RAM used/total in GiB.
# State file is per-user to avoid /tmp collisions.

state="${XDG_RUNTIME_DIR:-/tmp}/waybar-cpu.prev"

read -r _ user nice system idle iowait irq softirq steal _ < /proc/stat
total=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle_t=$((idle + iowait))

if [ -r "$state" ]; then
    read -r prev_total prev_idle < "$state"
else
    prev_total=0
    prev_idle=0
fi
printf '%s %s\n' "$total" "$idle_t" > "$state"

dt=$((total - prev_total))
di=$((idle_t  - prev_idle))
if [ "$dt" -gt 0 ]; then
    cpu=$((100 * (dt - di) / dt))
else
    cpu=0
fi

# Memory in KiB straight from /proc/meminfo (one read, no `free` subprocess).
read -r mem_total mem_avail < <(awk '
    /^MemTotal:/     { t=$2 }
    /^MemAvailable:/ { print t, $2; exit }
' /proc/meminfo)

awk -v c="$cpu" -v u="$((mem_total - mem_avail))" -v t="$mem_total" \
    'BEGIN { printf "CPU:%3d%% RAM:%4.1f/%-4.1f GiB\n", c, u/1024/1024, t/1024/1024 }'
