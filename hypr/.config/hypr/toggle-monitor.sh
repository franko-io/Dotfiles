#!/bin/bash

toggle_monitor() {
    local MONITOR="$1"
    local ENABLED=$(hyprctl monitors | grep -w "$MONITOR")

    if [[ -z "$ENABLED" ]]; then
        hyprctl keyword monitor "$MONITOR, preferred, auto, 1"
    else
        hyprctl keyword monitor "$MONITOR, disable"
    fi
}

toggle_monitor "$1"
