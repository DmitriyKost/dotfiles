#!/bin/bash
read cpu user nice system idle iowait irq softirq steal guest < /proc/stat

total=$((user + nice + system + idle + iowait + irq + softirq + steal))
idle_time=$((idle + iowait))

prev_file="/tmp/.cpu_prev"
if [ -f "$prev_file" ]; then
    read prev_total prev_idle < "$prev_file"
else
    prev_total=$total
    prev_idle=$idle_time
fi

diff_total=$((total - prev_total))
diff_idle=$((idle_time - prev_idle))
cpu_usage=$(( (100 * (diff_total - diff_idle) / diff_total) ))

echo "$total $idle_time" > "$prev_file"

read used total <<< $(free -m | awk '/Mem:/ {printf "%d %d", $2-$7, $2}')

used_g=$(awk "BEGIN {printf \"%.1f\", $used/1024}")
total_g=$(awk "BEGIN {printf \"%.1f\", $total/1024}")

cpu_str=$(printf "%3d%%" "$cpu_usage")
ram_str=$(printf "%4.1f/%-4.1f" "$used_g" "$total_g")

echo "CPU:$cpu_str RAM:$ram_str GiB"
