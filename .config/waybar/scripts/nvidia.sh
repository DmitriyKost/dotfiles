#!/usr/bin/env bash
# GPU utilization, temperature, and VRAM for the first NVIDIA GPU, with icons.
# Silently falls back to "󰾲 n/a" if nvidia-smi can't be queried.

nvidia-smi -i 0 --format=csv,noheader,nounits \
    --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total 2>/dev/null \
| awk -F', *' '
    NR==1 {
        printf "󰾲 %3d%% 󰔏 %3d° 󰍛 %4.1f/%4.1f G\n", $1, $2, $3/1024, $4/1024
        ok = 1
        exit
    }
    END { if (!ok) print "󰾲 n/a" }
'
