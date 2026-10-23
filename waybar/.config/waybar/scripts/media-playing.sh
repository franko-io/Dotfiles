#!/usr/bin/env bash
export LC_ALL=C.UTF-8   # slice by character, not byte (Waybar may run in the C locale)

readonly WIDTH=40
readonly DELAY=0.3
readonly GAP="   ·   "
readonly SEP=$'\x1f'    # field separator that won't appear in titles

coproc P { exec playerctl --follow metadata \
  --format "{{status}}${SEP}{{title}}${SEP}{{artist}}" 2>/dev/null; }
trap 'exit' TERM INT HUP
trap 'kill "$P_PID" 2>/dev/null' EXIT

status="" text="" loop="" cycle="" last="" i=0

emit() { [[ $1 == "$last" ]] || { last=$1; printf '%s\n' "$1"; }; }

while :; do
  scrolling=0
  if [[ -z $text ]]; then
    emit ""
  elif (( ${#text} <= WIDTH )); then
    emit "$text"
  elif [[ $status == Playing ]]; then
    scrolling=1
    emit "${loop:i:WIDTH}"
    i=$(( (i + 1) % ${#cycle} ))
  else
    emit "${text:0:WIDTH-1}…"
  fi

  if (( scrolling )); then
    read -r -t "$DELAY" -u "${P[0]}" line; rc=$?   # wake on timeout or event
  else
    read -r -u "${P[0]}" line; rc=$?               # block until something changes
  fi

  if (( rc == 0 )); then
    status=${line%%"$SEP"*}
    rest=${line#*"$SEP"}
    title=${rest%%"$SEP"*}
    artist=${rest#*"$SEP"}

    if [[ $status != Playing && $status != Paused ]]; then
      new=""
    elif [[ -n $title && -n $artist ]]; then
      new="$title - $artist"
    else
      new="$title$artist"          # whichever one exists, no dangling " - "
    fi

    if [[ $new != "$text" ]]; then
      text=$new i=0
      cycle="$text$GAP" loop="$cycle$cycle"
    fi
  elif (( rc <= 128 )); then
    exit                            # playerctl exited (EOF)
  fi
done
