#!/usr/bin/env bash
# Outputs JSON: {"text":"<icon> <title> — <artist>","class":"playing|paused|none"}.
# Body padded to a constant 40-char width so neighboring pills don't shift.

WIDTH=40

meta=$(playerctl metadata --format '{{status}}|{{title}}|{{artist}}' 2>/dev/null)

if [ -z "$meta" ]; then
    icon="󰽰"
    body="no player"
    class="none"
else
    status=${meta%%|*}
    rest=${meta#*|}
    title=${rest%%|*}
    artist=${rest#*|}

    case "$status" in
        Playing) icon="󰐊"; class="playing" ;;
        Paused)  icon="󰏤"; class="paused"  ;;
        *)       icon="●"; class="none"    ;;
    esac

    if [ -n "$title" ] && [ -n "$artist" ]; then
        body="$title — $artist"
    elif [ -n "$title" ]; then
        body="$title"
    else
        body="(no metadata)"
    fi
fi

body=$(awk -v w="$WIDTH" '
{
    n = length($0)
    if (n > w) printf "%s%s", substr($0, 1, w-1), "…"
    else       printf "%-*s",  w, $0
}' <<<"$body")

text="$icon $body"
jq -cn --arg text "$text" --arg class "$class" '{text: $text, class: $class}'
