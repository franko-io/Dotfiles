#!/usr/bin/env bash

CURRENT=$(powerprofilesctl get)

case "$CURRENT" in
  performance)
    powerprofilesctl set balanced
    notify-send "Power Profile" "Switched to balanced" --icon=power-profile-balanced-symbolic
    ;;
  balanced)
    powerprofilesctl set power-saver
    notify-send "Power Profile" "Switched to power-saver" --icon=power-profile-power-saver-symbolic
    ;;
  power-saver)
    powerprofilesctl set performance
    notify-send "Power Profile" "Switched to performance" --icon=power-profile-performance-symbolic
    ;;
esac
