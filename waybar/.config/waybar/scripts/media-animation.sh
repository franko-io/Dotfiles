#!/usr/bin/env bash

frames=("▂▄▆" "▄▂▆" "▄▆▂" "▆▄▂" "▆▂▄")

coproc P { exec playerctl --follow status 2>/dev/null; }
trap 'kill "$P_PID" 2>/dev/null' EXIT

status="" i=0
while :; do
  if [[ $status == Playing ]]; then
    echo "${frames[i++ % ${#frames[@]}]}"
    # Builtin timeout instead of a forked sleep; returns early on a status change.
    read -r -t 0.2 -u "${P[0]}" line && status=$line
  else
    if [[ $status == Paused ]]; then
      echo "󰏤"
    else
      echo ""
    fi
    # Block until the status changes. No polling, no forks.
    read -r -u "${P[0]}" status || exit
  fi
done
