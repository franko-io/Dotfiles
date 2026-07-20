#!/usr/bin/env bash

# Path shortening for tmux catppuccin directory module

max_len="${1:-50}"      # max path length before collapsing
keep="${2:-2}"          # number of trailing components to always keep full
letter_max="${3:-3}"    # max number of single-letter ancestors to show before squashing

path="$(tmux display-message -p '#{pane_current_path}')"
prefix=""

# Calculate prefix
if [[ "$path" == "$HOME" ]]; then
    printf '~'
    exit 0
elif [[ "$path" == "$HOME"/* ]]; then
    prefix="~"
    path="${path#"$HOME"}"
fi

if (( ${#prefix} + ${#path} <= max_len )); then
    printf '%s%s' "$prefix" "$path"
    exit 0
fi

IFS='/' read -ra parts <<< "$path"  # split path into components

# Count components
num_components=0
for p in "${parts[@]}"; do
    [[ -n "$p" ]] && ((num_components++))
done

# Separate ancestors and the tail
idx=0
ancestors=()
tail=()
for p in "${parts[@]}"; do
    [[ -z "$p" ]] && continue
    ((idx++))
    if (( num_components - idx < keep )); then
        tail+=("$p")
    else
        ancestors+=("${p:0:1}")
    fi
done

# Squash single-letter ancestors if needed
if (( ${#ancestors[@]} > letter_max )); then
    if (( letter_max > 0 )); then
        kept=("${ancestors[@]: -$letter_max}")
        ancestors=(".." "${kept[@]}")
    else
        ancestors=("..")
    fi
fi

# Rebuild final path
all=("${ancestors[@]}" "${tail[@]}")
joined=$(IFS=/; echo "${all[*]}")

printf '%s/%s' "$prefix" "$joined"
