#!/usr/bin/env bash
# CPU% (rolling delta), CPU temperature, and RAM used/total in GiB.
# State file is per-user to avoid /tmp collisions.

state="${XDG_RUNTIME_DIR:-/tmp}/waybar-cpu.prev"

# ─── CPU utilization (rolling delta) ──────────────────────────────────────────
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

# ─── CPU temperature ──────────────────────────────────────────────────────────
# Scan hwmon for a known CPU sensor driver and read its canonical input
# (Tctl on AMD k10temp, Package id 0 on Intel coretemp, etc.).
cpu_temp=0
for d in /sys/class/hwmon/hwmon*; do
    name=$(cat "$d/name" 2>/dev/null) || continue
    case "$name" in
        coretemp|k10temp|zenpower|cpu_thermal) ;;
        *) continue ;;
    esac
    for t in "$d"/temp*_input; do
        [ -r "$t" ] || continue
        lbl=$(cat "${t%_input}_label" 2>/dev/null)
        case "$lbl" in
            "Tctl"|"Tdie"|"Package id 0"|"")
                cpu_temp=$(awk '{print int($1/1000)}' "$t")
                break 2
                ;;
        esac
    done
done

# ─── Memory (KiB from /proc/meminfo) ──────────────────────────────────────────
read -r mem_total mem_avail < <(awk '
    /^MemTotal:/     { t=$2 }
    /^MemAvailable:/ { print t, $2; exit }
' /proc/meminfo)

awk -v c="$cpu" -v tc="$cpu_temp" -v u="$((mem_total - mem_avail))" -v t="$mem_total" \
    'BEGIN { printf "󰻠 %3d%% 󰔏 %3d° 󰍛 %4.1f/%4.1f G\n", c, tc, u/1024/1024, t/1024/1024 }'
