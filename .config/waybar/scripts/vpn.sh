#!/usr/bin/env bash
# Outputs JSON: {"text":"<icon> oc|tun|if|off","class":"on|off"}.

if pgrep -x openconnect >/dev/null; then
    label="oc";  icon="󰦝"; class="on"
elif pgrep -f 'tun2socks|gost|xray|sing-box' >/dev/null; then
    label="tun"; icon="󰦝"; class="on"
elif ip -o link show 2>/dev/null | awk -F': ' '{print $2}' | grep -qE '^(tun|tap|vpn|oc|ppp)'; then
    label="if";  icon="󰦝"; class="on"
else
    label="off"; icon="󰦞"; class="off"
fi

text=$(printf '%s %3s' "$icon" "$label")
jq -cn --arg text "$text" --arg class "$class" '{text: $text, class: $class}'
