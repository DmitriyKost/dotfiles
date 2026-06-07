#!/usr/bin/env bash
# GPU utilization, temperature, and VRAM for the first NVIDIA GPU.
# Silently falls back to "GPU: n/a" if nvidia-smi can't be queried.

nvidia-smi -i 0 --format=csv,noheader,nounits \
    --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total 2>/dev/null \
| awk -F', *' '
    NR==1 {
        printf "GPU:%3d%% Temp:%3d°C VRAM:%4.1f/%4.1f GiB\n", $1, $2, $3/1024, $4/1024
        ok = 1
        exit
    }
    END { if (!ok) print "GPU: n/a" }
'
