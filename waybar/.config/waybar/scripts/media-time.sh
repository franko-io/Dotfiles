#!/usr/bin/env bash

# INT64_MAX
readonly LIVE_SENTINEL=9223372036854775807

length=$(playerctl metadata mpris:length 2>/dev/null)
position=$(playerctl metadata --format '{{duration(position)}}' 2>/dev/null)

if [[ -z "$length" ]]; then
    exit 0
fi

if [[ "$length" -ge "$LIVE_SENTINEL" ]]; then
    echo "LIVE"
else
    duration=$(playerctl metadata --format '{{duration(mpris:length)}}' 2>/dev/null)
    echo "${position}/${duration}"
fi
