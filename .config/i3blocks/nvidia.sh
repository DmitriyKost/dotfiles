#!/bin/bash

output=$(nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total \
                    --format=csv,noheader,nounits -i 0)

IFS=',' read -r gpu_util temp vram_used vram_total <<< "$output"

gpu_util=$(echo $gpu_util | xargs)
temp=$(echo $temp | xargs)
vram_used=$(echo $vram_used | xargs)
vram_total=$(echo $vram_total | xargs)

vram_used_gb=$(awk -v u="$vram_used" 'BEGIN { printf "%.1f", u/1024 }')
vram_total_gb=$(awk -v t="$vram_total" 'BEGIN { printf "%.1f", t/1024 }')

printf "GPU:%3d%% Temp:%3d°C VRAM:%4.1f/%4.1f GiB\n" \
      "$gpu_util" "$temp" "$vram_used_gb" "$vram_total_gb"
